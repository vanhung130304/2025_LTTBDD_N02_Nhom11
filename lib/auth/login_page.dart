import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/auth_service.dart';
import 'register_page.dart';
import 'profile_page.dart';
import 'forgot_password_page.dart'; // <-- BƯỚC 1: THÊM IMPORT TRANG MỚI

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  String? _error;

  Future<void> _login() async {
    setState(() => _loading = true);
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final success = await AuthService.login(email, password);
    setState(() => _loading = false);

    if (success) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProfilePage()),
        );
      }
    } else {
      setState(() => _error = "Sai email hoặc mật khẩu");
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
                Icons.flight_takeoff, // Icon du lịch
                size: 100,
                color: Colors.orange.shade600,
              ),
            ),
            const SizedBox(height: 30),

            // --- HEADER ---
            Text(
              "Chào mừng quay lại!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade800,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Đăng nhập để tiếp tục",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),

            // --- INPUT FIELDS ---
            _buildInputField(
              _emailController,
              "Email",
              Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            _buildInputField(
              _passwordController,
              "Mật khẩu",
              Icons.lock_outline,
              obscure: true,
            ),
            
            // Error Message
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15),
                child: Text(
                  _error!,
                  style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                ),
              ),

            // Quên mật khẩu
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // <-- BƯỚC 2: CẬP NHẬT ĐIỀU HƯỚNG ĐẾN TRANG QUÊN MẬT KHẨU
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ForgotPasswordPage()), 
                  );
                },
                child: const Text(
                  "Quên mật khẩu?",
                  style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // --- LOGIN BUTTON (CTA) ---
            ElevatedButton(
              onPressed: _loading ? null : _login,
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
                      "Đăng nhập",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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

            // Register Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Chưa có tài khoản?",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterPage()),
                    );
                  },
                  child: const Text(
                    "Đăng ký ngay",
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
  Widget _buildInputField(TextEditingController controller, String hint, IconData icon, {bool obscure = false, TextInputType keyboardType = TextInputType.text}) {
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

  // Hàm tạo nút Social Login (Giữ nguyên)
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