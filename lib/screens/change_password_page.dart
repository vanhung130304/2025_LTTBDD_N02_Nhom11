// File: lib/screens/change_password_page.dart

import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  // GlobalKey để quản lý trạng thái của Form
  final _formKey = GlobalKey<FormState>();

  // Controllers để lấy giá trị từ TextField
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Biến trạng thái để ẩn/hiện mật khẩu
  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Xử lý khi nhấn nút Lưu Mật khẩu
  void _handleChangePassword() {
    if (_formKey.currentState!.validate()) {
      // Logic thay đổi mật khẩu sẽ nằm ở đây
      final oldPass = _oldPasswordController.text;
      final newPass = _newPasswordController.text;

      // TODO: 1. Gọi API để xác thực oldPass và cập nhật newPass.

      // Hiển thị thông báo thành công (ví dụ)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Yêu cầu thay đổi mật khẩu đang được xử lý...')),
      );

      // Sau khi thành công, có thể xóa trường nhập liệu
      // _oldPasswordController.clear();
      // _newPasswordController.clear();
      // _confirmPasswordController.clear();
      
      // Quay lại trang trước
      // Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thay đổi Mật khẩu'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Để bảo mật tài khoản, vui lòng nhập mật khẩu cũ và đặt mật khẩu mới của bạn.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // 1. Mật khẩu cũ
              _buildPasswordField(
                controller: _oldPasswordController,
                label: 'Mật khẩu cũ',
                hint: 'Nhập mật khẩu hiện tại của bạn',
                isVisible: _isOldPasswordVisible,
                toggleVisibility: () {
                  setState(() => _isOldPasswordVisible = !_isOldPasswordVisible);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu cũ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // 2. Mật khẩu mới
              _buildPasswordField(
                controller: _newPasswordController,
                label: 'Mật khẩu mới',
                hint: 'Ít nhất 6 ký tự',
                isVisible: _isNewPasswordVisible,
                toggleVisibility: () {
                  setState(() => _isNewPasswordVisible = !_isNewPasswordVisible);
                },
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Mật khẩu mới phải có ít nhất 6 ký tự';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // 3. Xác nhận Mật khẩu mới
              _buildPasswordField(
                controller: _confirmPasswordController,
                label: 'Xác nhận Mật khẩu mới',
                hint: 'Nhập lại mật khẩu mới',
                isVisible: _isConfirmPasswordVisible,
                toggleVisibility: () {
                  setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng xác nhận mật khẩu';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Mật khẩu xác nhận không khớp';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),

              // Nút Thay đổi Mật khẩu
              ElevatedButton(
                onPressed: _handleChangePassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                ),
                child: const Text(
                  'Lưu Mật khẩu mới',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Widget hỗ trợ tạo trường nhập liệu mật khẩu tùy chỉnh
  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required bool isVisible,
    required VoidCallback toggleVisibility,
    required FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.orange, width: 2),
        ),
        prefixIcon: const Icon(Icons.vpn_key_outlined, color: Colors.orange),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: toggleVisibility,
        ),
      ),
    );
  }
}