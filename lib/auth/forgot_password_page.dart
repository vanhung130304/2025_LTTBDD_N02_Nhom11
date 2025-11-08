// File: forgot_password_page.dart

import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  bool _loading = false;
  String? _message;

  Future<void> _sendResetLink() async {
    final email = _emailController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      setState(() {
        _message = "Vui lòng nhập một địa chỉ email hợp lệ.";
      });
      return;
    }

    setState(() {
      _loading = true;
      _message = null;
    });

    // Mô phỏng cuộc gọi API gửi liên kết đặt lại mật khẩu
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _loading = false;
      // Thông báo thành công giả định
      _message = "Liên kết đặt lại mật khẩu đã được gửi đến $email. Vui lòng kiểm tra hộp thư đến của bạn.";
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  
  // Hàm tạo Input Field được thiết kế lại (Đã sao chép từ login_page)
  Widget _buildInputField(TextEditingController controller, String hint, IconData icon, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 16, color: Colors.black87),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.orange.shade400),
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        // Cấu hình border hiện đại
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Dùng AppBar tối giản để có nút Back
      appBar: AppBar(
        title: const Text('Quên Mật khẩu'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- ICON KHÓA/ĐẶT LẠI ---
            const SizedBox(height: 10),
            Center(
              child: Icon(
                Icons.lock_reset, // Icon đặt lại mật khẩu
                size: 100,
                color: Colors.orange.shade600,
              ),
            ),
            const SizedBox(height: 30),

            // --- HEADER ---
            Text(
              "Đặt lại Mật khẩu",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade800,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Nhập địa chỉ email đã đăng ký của bạn. Chúng tôi sẽ gửi cho bạn một liên kết để đặt lại mật khẩu.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),

            // --- INPUT FIELD ---
            _buildInputField(
              _emailController,
              "Địa chỉ Email",
              Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            
            // Message/Error Display
            if (_message != null)
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  _message!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    // Màu xanh lá cho thành công, màu đỏ cho lỗi
                    color: _message!.contains("Liên kết") ? Colors.green.shade700 : Colors.red,
                  ),
                ),
              ),

            const SizedBox(height: 40),

            // --- SUBMIT BUTTON ---
            ElevatedButton(
              onPressed: _loading ? null : _sendResetLink,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), 
                ),
                elevation: 5, 
              ),
              child: _loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      "Gửi liên kết đặt lại",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),

            const SizedBox(height: 20),
            // Nút quay lại Login
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Quay lại Đăng nhập",
                style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}