import 'package:bobo/core/consts/routes/routes.dart';
import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/core/consts/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  bool _isEditing = false;

  // Saved profile state
  String _savedName = 'Daniel Jones';
  String _savedPhoneCode = '405';
  String _savedPhoneNum = '555-0128';
  String _savedBirthday = '12-10-1996';
  String _selectedAddressTitle = 'Home';

  // Text editing controllers
  late TextEditingController _nameController;
  late TextEditingController _phoneCodeController;
  late TextEditingController _phoneNumController;
  late TextEditingController _birthdayController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _savedName);
    _phoneCodeController = TextEditingController(text: _savedPhoneCode);
    _phoneNumController = TextEditingController(text: _savedPhoneNum);
    _birthdayController = TextEditingController(text: _savedBirthday);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneCodeController.dispose();
    _phoneNumController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _isEditing
          ? CancelSaveAppBar(
              title: 'My Account',
              onCancel: () {
                setState(() {
                  // Reset controller texts to saved state if cancelled
                  _nameController.text = _savedName;
                  _phoneCodeController.text = _savedPhoneCode;
                  _phoneNumController.text = _savedPhoneNum;
                  _birthdayController.text = _savedBirthday;
                  _isEditing = false;
                });
              },
              onSave: () {
                setState(() {
                  // Save controller values
                  _savedName = _nameController.text;
                  _savedPhoneCode = _phoneCodeController.text;
                  _savedPhoneNum = _phoneNumController.text;
                  _savedBirthday = _birthdayController.text;
                  _isEditing = false;
                });
              },
            )
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              leadingWidth: 100,
              leading: TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                  size: 16,
                ),
                label: Text(
                  'Back',
                  style: AppTextStyle.poppins16Bold.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              centerTitle: true,
              title: Text(
                "My Account",
                style: AppTextStyle.poppins20Bold.copyWith(
                  color: AppColors.black,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isEditing = true;
                    });
                  },
                  child: Text(
                    "Edit",
                    style: AppTextStyle.poppins18Bold.copyWith(
                      color: AppColors.lightPrimary500,
                    ),
                  ),
                ),
                const Gap(10),
              ],
            ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(25),
            // Profile Picture
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFECECEC),
                        width: 2.5,
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=256',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (_isEditing)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF0F1EE),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black54,
                          size: 20,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const Gap(25),

            // Toggle Editing View vs Readonly View
            if (!_isEditing) ...[
              // Readonly view
              Text(
                _savedName,
                style: AppTextStyle.poppins24Bold.copyWith(
                  color: Colors.black,
                ),
              ),
              const Gap(4),
              Text(
                'daniel.jones@example.com',
                style: AppTextStyle.poppins14.copyWith(
                  color: AppColors.darkGrey300,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(6),
              Text(
                '+$_savedPhoneCode $_savedPhoneNum',
                style: AppTextStyle.poppins16Bold.copyWith(
                  color: AppColors.darkGrey300,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(35),

              // Navigation Cards List
              _buildNavigationCard(
                title: 'Addresses',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.addresses);
                },
              ),
              _buildNavigationCard(
                title: 'Payment',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.paymentMethods);
                },
              ),
              _buildNavigationCard(
                title: 'My Orders',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.myOrdersScreen);
                },
              ),
              _buildNavigationCard(
                title: 'Settings',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.settings);
                },
              ),
            ] else ...[
              // Editing view
              _buildTextField(
                controller: _nameController,
                hintText: 'Name',
              ),
              _buildPhoneRow(),
              _buildTextField(
                controller: _birthdayController,
                hintText: 'Birthdate',
              ),
              _buildAddressSelectField(),
            ],
            const Gap(30),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFFECECEC),
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.lightPrimary500,
              width: 1.5,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        style: AppTextStyle.poppins16.copyWith(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildPhoneRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Row(
        children: [
          // Code code "405"
          SizedBox(
            width: 80,
            child: TextField(
              controller: _phoneCodeController,
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFFECECEC),
                    width: 1.2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.lightPrimary500,
                    width: 1.5,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              style: AppTextStyle.poppins16.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Gap(10),
          // Number "555-0128"
          Expanded(
            child: TextField(
              controller: _phoneNumController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFFECECEC),
                    width: 1.2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.lightPrimary500,
                    width: 1.5,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              style: AppTextStyle.poppins16.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSelectField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: GestureDetector(
        onTap: () async {
          final result = await Navigator.pushNamed(
            context,
            AppRoutes.changeAddress,
            arguments: _selectedAddressTitle,
          );
          if (result != null && result is Map<String, String>) {
            setState(() {
              _selectedAddressTitle = result['title']!;
            });
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFECECEC),
              width: 1.2,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Address - $_selectedAddressTitle',
                  style: AppTextStyle.poppins16.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.darkGrey400,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationCard({
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.back,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyle.poppins16.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.darkGrey400,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
