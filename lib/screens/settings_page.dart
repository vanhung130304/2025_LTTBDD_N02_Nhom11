// File: lib/screens/settings_page.dart

import 'package:flutter/material.dart';

// Import các trang đích (CẦN ĐẢM BẢO CÁC FILE NÀY TỒN TẠI)
// 1. TÀI KHOẢN
import 'change_password_page.dart';
import 'update_profile_page.dart';
import 'manage_address_page.dart';
/* import 'activity_log_page.dart';  */ // Nhật ký Hoạt động (Tính năng mới)

// 2. ỨNG DỤNG
import 'language_settings_page.dart';

// 3. BẢO MẬT & KHÁC
import 'manage_permissions_page.dart'; // Quản lý Quyền truy cập
/*import 'delete_account_page.dart';    */ // Xóa Tài khoản (Đặt tên giả định)

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // BƯỚC 2: KHAI BÁO BIẾN TRẠNG THÁI CHO SWITCH
  bool _isPushNotificationEnabled = true;
  bool _isDarkModeEnabled = false;


  // Hàm tiện ích để điều hướng đến một trang mới
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
  
  // HÀM XỬ LÝ: Bật/Tắt Thông báo đẩy
  void _togglePushNotifications(bool newValue) {
    setState(() {
      _isPushNotificationEnabled = newValue;
    });
    // TODO: Xử lý logic bật/tắt thông báo
    print('Thông báo Đẩy: $newValue');
  }

  // HÀM XỬ LÝ: Bật/Tắt Chế độ tối
  void _toggleDarkMode(bool newValue) {
    setState(() {
      _isDarkModeEnabled = newValue;
    });
    // TODO: Xử lý logic bật/tắt Dark Mode
    print('Chế độ tối: $newValue');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt tài khoản'),
        backgroundColor: Colors.orange, // Đồng bộ màu cam
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // --- Phần 1: Cài đặt Tài khoản ---
            _buildSettingsSection(
              context,
              title: 'TÀI KHOẢN',
              items: [
                _buildSettingsItem(
                  context,
                  'Thay đổi Mật khẩu',
                  Icons.lock_outline,
                  onTap: () => _navigateTo(
                    context,
                    const ChangePasswordPage(),
                  ), // Đã thêm điều hướng
                ),
                _buildSettingsItem(
                  context,
                  'Cập nhật Thông tin Cá nhân',
                  Icons.person_outline,
                  onTap: () => _navigateTo(
                    context,
                    const UpdateProfilePage(),
                  ), // Đã thêm điều hướng
                ),
                _buildSettingsItem(
                  context,
                  'Quản lý Địa chỉ',
                  Icons.location_on_outlined,
                  onTap: () => _navigateTo(
                    context,
                    const ManageAddressPage(),
                  ), // Đã thêm điều hướng
                ),
                /*_buildSettingsItem(
                  context, 
                  'Nhật ký Hoạt động', 
                  Icons.history,
                  onTap: () => _navigateTo(context, const ActivityLogPage()), // Đã thêm điều hướng
                ), */
              ],
            ),

            const Divider(thickness: 8, color: Color(0xFFF0F0F0)),

            // --- Phần 2: Cài đặt Ứng dụng ---
            _buildSettingsSection(
              context,
              title: 'ỨNG DỤNG',
              items: [
                _buildSettingsItem(
                  context,
                  'Ngôn ngữ',
                  Icons.language,
                  onTap: () => _navigateTo(
                    context,
                    const LanguageSettingsPage(),
                  ), // Đã thêm điều hướng
                ),
                // Các mục Switch không cần onTap vì logic nằm trong onChanged
                _buildSettingsSwitchItem(
                  'Thông báo Đẩy',
                  Icons.notifications_none,
                  _isPushNotificationEnabled, // BƯỚC 3: SỬ DỤNG BIẾN TRẠNG THÁI
                  (value) {
                    _togglePushNotifications(value); // BƯỚC 4: GỌI HÀM CÓ setState()
                  },
                ),
                _buildSettingsSwitchItem(
                  'Chế độ tối (Dark Mode)',
                  Icons.dark_mode_outlined,
                  _isDarkModeEnabled,         // BƯỚC 3: SỬ DỤNG BIẾN TRẠNG THÁI
                  (value) {
                    _toggleDarkMode(value);     // BƯỚC 4: GỌI HÀM CÓ setState()
                  },
                ),
              ],
            ),

            const Divider(thickness: 8, color: Color(0xFFF0F0F0)),

            // --- Phần 3: Bảo mật và Khác ---
            _buildSettingsSection(
              context,
              title: 'BẢO MẬT & KHÁC',
              items: [
                _buildSettingsItem(
                  context,
                  'Quản lý Quyền truy cập',
                  Icons.privacy_tip_outlined,
                  onTap: () => _navigateTo(
                    context,
                    const ManagePermissionsPage(),
                  ), // Đã thêm điều hướng
                ),
                _buildSettingsItem(
                  context,
                  'Xóa Tài khoản',
                  Icons.delete_outline,
                  isDestructive: true,
                  /*onTap: () => _navigateTo(context, const DeleteAccountPage()), // Đã thêm điều hướng */
                ),
                // Mục này chỉ hiển thị thông tin, không cần điều hướng
                _buildSettingsItem(
                  context,
                  'Phiên bản Ứng dụng',
                  Icons.info_outline,
                  showArrow: false,
                  trailingText: '1.0.0',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget hỗ trợ xây dựng phần tiêu đề cài đặt (Giữ nguyên)
  Widget _buildSettingsSection(
    BuildContext context, {
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 16.0, bottom: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
              fontSize: 14,
            ),
          ),
        ),
        ...items,
      ],
    );
  }

  // Widget hỗ trợ xây dựng mục cài đặt đơn giản (ĐÃ THÊM THAM SỐ onTap)
  Widget _buildSettingsItem(
    BuildContext context,
    String title,
    IconData icon, {
    bool isDestructive = false,
    bool showArrow = true,
    String? trailingText,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : Colors.orange),
      title: Text(
        title,
        style: TextStyle(color: isDestructive ? Colors.red : Colors.black),
      ),
      trailing: showArrow
          ? const Icon(Icons.arrow_forward_ios, size: 16)
          : (trailingText != null
                ? Text(trailingText, style: TextStyle(color: Colors.grey[600]))
                : null),
      onTap:
          onTap ??
          () {
            // Chỉ in ra log nếu không có onTap cụ thể
            if (showArrow) {
              print('Navigating to $title (Default Action)');
            }
          },
    );
  }

  // Widget hỗ trợ xây dựng mục cài đặt với nút chuyển đổi (Switch) (Giữ nguyên)
  Widget _buildSettingsSwitchItem(
    String title,
    IconData icon,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.orange,
      ),
    );
  }
}
