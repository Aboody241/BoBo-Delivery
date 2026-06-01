import 'package:bobo/controller/user/models/user_model.dart';
import 'package:bobo/controller/user/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        emit(UserLoaded(userModel));
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
      emit(UserLoaded(updatedUser));
    } catch (e) {
      emit(UserError('Failed to save: $e'));
    }
  }
}
