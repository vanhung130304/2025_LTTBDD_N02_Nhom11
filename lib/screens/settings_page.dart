// File: lib/screens/settings_page.dart

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
                _buildSettingsItem(context, 'Thay đổi Mật khẩu', Icons.lock_outline),
                _buildSettingsItem(context, 'Cập nhật Thông tin Cá nhân', Icons.person_outline),
                _buildSettingsItem(context, 'Quản lý Địa chỉ', Icons.location_on_outlined),
              ],
            ),

            const Divider(thickness: 8, color: Color(0xFFF0F0F0)), // Dải phân cách

            // --- Phần 2: Cài đặt Ứng dụng ---
            _buildSettingsSection(
              context,
              title: 'ỨNG DỤNG',
              items: [
                _buildSettingsItem(context, 'Ngôn ngữ', Icons.language),
                _buildSettingsSwitchItem('Thông báo Đẩy', Icons.notifications_none, true, (value) {
                  // TODO: Xử lý logic bật/tắt thông báo
                  print('Thông báo Đẩy: $value');
                }),
                _buildSettingsSwitchItem('Chế độ tối (Dark Mode)', Icons.dark_mode_outlined, false, (value) {
                  // TODO: Xử lý logic bật/tắt Dark Mode
                  print('Chế độ tối: $value');
                }),
              ],
            ),

            const Divider(thickness: 8, color: Color(0xFFF0F0F0)),
            
            // --- Phần 3: Bảo mật và Khác ---
            _buildSettingsSection(
              context,
              title: 'BẢO MẬT & KHÁC',
              items: [
                _buildSettingsItem(context, 'Quản lý Quyền truy cập', Icons.privacy_tip_outlined),
                _buildSettingsItem(context, 'Xóa Tài khoản', Icons.delete_outline, isDestructive: true),
                _buildSettingsItem(context, 'Phiên bản Ứng dụng', Icons.info_outline, showArrow: false, trailingText: '1.0.0'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget hỗ trợ xây dựng phần tiêu đề cài đặt
  Widget _buildSettingsSection(BuildContext context, {required String title, required List<Widget> items}) {
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

  // Widget hỗ trợ xây dựng mục cài đặt đơn giản (có mũi tên hoặc giá trị)
  Widget _buildSettingsItem(BuildContext context, String title, IconData icon, {bool isDestructive = false, bool showArrow = true, String? trailingText}) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : Colors.orange),
      title: Text(title, style: TextStyle(color: isDestructive ? Colors.red : Colors.black)),
      trailing: showArrow 
          ? const Icon(Icons.arrow_forward_ios, size: 16)
          : (trailingText != null ? Text(trailingText, style: TextStyle(color: Colors.grey[600])) : null),
      onTap: () {
        // Có thể thêm logic điều hướng chi tiết cho từng mục
        if (showArrow) {
          print('Navigating to $title');
        }
      },
    );
  }

  // Widget hỗ trợ xây dựng mục cài đặt với nút chuyển đổi (Switch)
  Widget _buildSettingsSwitchItem(String title, IconData icon, bool value, ValueChanged<bool> onChanged) {
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