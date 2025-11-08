// File: lib/services/auth_service.dart

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Khóa lưu trữ trong SharedPreferences
  static const _keyEmail = 'user_email';
  static const _keyPassword = 'user_password';
  static const _keyName = 'user_name';

  // =======================================================
  // 1. Đăng ký tài khoản (Mô phỏng)
  // =======================================================
  static Future<bool> register(String name, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    // Nếu email đã tồn tại -> báo lỗi
    if (prefs.getString(_keyEmail) == email) return false;

    // Lưu thông tin người dùng mới
    await prefs.setString(_keyName, name);
    await prefs.setString(_keyEmail, email);
    await prefs.setString(_keyPassword, password);
    return true;
  }

  // =======================================================
  // 2. Đăng nhập (Mô phỏng)
  // =======================================================
  static Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString(_keyEmail);
    final savedPassword = prefs.getString(_keyPassword);

    // Kiểm tra email và mật khẩu khớp
    return savedEmail == email && savedPassword == password;
  }

  // =======================================================
  // 3. Lấy thông tin người dùng
  // =======================================================
  static Future<Map<String, String?>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString(_keyName),
      'email': prefs.getString(_keyEmail),
    };
  }

  // =======================================================
  // 4. Đăng xuất (Có thể thêm logic xóa token nếu dùng API)
  // =======================================================
  static Future<void> logout() async {
    // Trong môi trường thực tế, bạn sẽ xóa token hoặc session ở đây.
    // Với SharedPreferences mô phỏng, ta không cần làm gì nhiều để giữ lại tài khoản ảo.
  }

  // =======================================================
  // 5. YÊU CẦU ĐẶT LẠI MẬT KHẨU (Mô phỏng logic Backend)
  // =======================================================
  static Future<bool> forgotPassword(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString(_keyEmail);

    // Mô phỏng kiểm tra xem email này có tồn tại trong dữ liệu đã đăng ký không.
    if (savedEmail == email) {
      // THÀNH CÔNG: Trong ứng dụng thực, server đã gửi email đặt lại mật khẩu.
      print('Liên kết đặt lại mật khẩu đã được "gửi" đến: $email');
      return true;
    } else {
      // THẤT BẠI: Email không tồn tại.
      print('Email không tồn tại trong hệ thống: $email');
      return false;
    }
  }
}