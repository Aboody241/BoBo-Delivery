import 'dart:io';
import 'package:bobo/controller/user/models/user_model.dart';
import 'package:bobo/controller/user/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserCubit(this._userRepository) : super(UserInitial());

  Future<void> fetchUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    
    if (currentUser == null) {
      emit(UserError('User not authenticated'));
      return;
    }

    emit(UserLoading());

    try {
      final userModel = await _userRepository.getUser(
        currentUser.uid, 
        currentUser.email ?? 'user@example.com',
      );
      
      if (userModel != null) {
        final prefs = await SharedPreferences.getInstance();
        final localImagePath = prefs.getString('profile_image_${currentUser.uid}');
        emit(UserLoaded(userModel, localImagePath: localImagePath));
      } else {
        emit(UserError('Failed to load user data'));
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> saveUser(UserModel updatedUser) async {
    try {
      // Keep loading state if we want to show a spinner, 
      // but usually we want to update optimistically or show an overlay
      // For simplicity here, we'll just save and then update the state
      
      await _userRepository.saveUser(updatedUser);
      final currentState = state;
      String? currentImagePath;
      if (currentState is UserLoaded) {
        currentImagePath = currentState.localImagePath;
      }
      emit(UserLoaded(updatedUser, localImagePath: currentImagePath));
    } catch (e) {
      emit(UserError('Failed to save: $e'));
    }
  }
  Future<void> updateProfileImage(File imageFile) async {
    final currentState = state;
    if (currentState is UserLoaded) {
      try {
        final uid = currentState.user.uid;
        final directory = await getApplicationDocumentsDirectory();
        final newPath = '${directory.path}/profile_image_$uid.jpg';
        
        // Copy the image to local app directory
        final savedImage = await imageFile.copy(newPath);
        
        // Save the path to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('profile_image_$uid', savedImage.path);
        
        // Emit the updated state
        emit(UserLoaded(currentState.user, localImagePath: savedImage.path));
      } catch (e) {
        emit(UserError('Failed to save image: $e'));
      }
    }
  }
}
