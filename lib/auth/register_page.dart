import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _message;

  Future<void> _register() async {
    if (_nameController.text.trim().isEmpty) {
       setState(() {
        _message = "Vui lòng nhập Tên người dùng.";
      });
      return;
    }
    
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final success = await AuthService.register(name, email, password);
    setState(() {
      _message = success ? "Đăng ký thành công! Vui lòng đăng nhập." : "Email đã tồn tại!";
    });
    if (success) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          Navigator.pop(context);
        }
      });
    }
  }

  // Hàm tiện ích cho nút đăng nhập mạng xã hội
  void _socialLogin(String platform) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tiếp tục với $platform đang được phát triển.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- ICON DU LỊCH ---
            const SizedBox(height: 30),
            Center(
              child: Icon(
                Icons.travel_explore, // Icon du lịch khác cho trang đăng ký
                size: 100,
                color: Colors.orange.shade600,
              ),
            ),
            const SizedBox(height: 30),

            // --- HEADER ---
            Text(
              "Tạo Tài khoản mới",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade800,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Tham gia cộng đồng của chúng tôi chỉ trong vài bước",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),

            // --- INPUT FIELDS ---
            _buildInput(
              _nameController,
              "Tên người dùng",
              Icons.person_outline,
            ),
            const SizedBox(height: 20),
            _buildInput(
              _emailController,
              "Email",
              Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            _buildInput(
              _passwordController,
              "Mật khẩu",
              Icons.lock_outline,
              obscure: true,
            ),

            const SizedBox(height: 35),

            // --- REGISTER BUTTON (CTA) ---
            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
              ),
              child: const Text(
                "Đăng ký",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Message (Success/Error)
            if (_message != null)
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  _message!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: _message!.contains("thành công") ? Colors.green.shade700 : Colors.red,
                  ),
                ),
              ),
              
            const SizedBox(height: 20),
            const Divider(), // Dải phân cách cho mạng xã hội
            const SizedBox(height: 20),

            // --- SOCIAL LOGIN BUTTONS ---
            _buildSocialButton(
              'Facebook',
              Icons.facebook,
              Colors.blue.shade700,
              () => _socialLogin('Facebook'),
            ),
            const SizedBox(height: 15),
            _buildSocialButton(
              'Google',
              Icons.g_mobiledata, 
              Colors.red.shade600,
              () => _socialLogin('Google'),
              iconType: 'google',
            ),

            const SizedBox(height: 25),

            // Login Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Đã có tài khoản?",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Đăng nhập ngay",
                    style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Hàm tạo Input Field được thiết kế lại (Giữ nguyên)
  Widget _buildInput(TextEditingController controller, String hint, IconData icon, {bool obscure = false, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 16, color: Colors.black87),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.orange.shade400),
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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

  // Hàm tạo nút Social Login mới
  Widget _buildSocialButton(String label, IconData icon, Color color, VoidCallback onTap, {String? iconType}) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(color: color, width: 1.5),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconType == 'google')
            Text(
              'G',
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          else
            Icon(icon, color: color, size: 24),
          const SizedBox(width: 10),
          Text(
            'Tiếp tục với $label',
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}