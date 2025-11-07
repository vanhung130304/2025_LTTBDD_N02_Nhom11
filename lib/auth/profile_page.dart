import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_page.dart';

// SỬA LỖI ĐƯỜNG DẪN: Sử dụng '../screens/' để trỏ đến các tệp trong thư mục 'screens'
import '../screens/group_profile_page.dart'; 
import '../screens/settings_page.dart';
import '../screens/support_center_page.dart';
import '../screens/privacy_policy_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, String>? _user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final user = await AuthService.getUser();
    setState(() => _user = user.map((k, v) => MapEntry(k, v ?? '')));
  }

  Future<void> _logout() async {
    await AuthService.logout();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  // Hàm tiện ích để điều hướng đến một trang mới
  void _navigateTo(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_user!.isEmpty) {
      return const LoginPage();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Tài khoản của tôi"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.orange.shade200,
              child: const Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 15),
            Text(
              _user!['name'] ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              _user!['email'] ?? '',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),
            
            // 1. Profile Nhóm 8: ĐÃ THÊM LOGIC ĐIỀU HƯỚNG
            _buildMenuItem(
              Icons.history, 
              "Profile Nhóm 8 ", 
              () => _navigateTo(const GroupProfilePage()), 
            ),
            
            // 2. Cài đặt tài khoản
            _buildMenuItem(
              Icons.settings, 
              "Cài đặt tài khoản", 
              () => _navigateTo(const SettingsPage()),
            ),
            
            // 3. Trung tâm hỗ trợ
            _buildMenuItem(
              Icons.support_agent, 
              "Trung tâm hỗ trợ", 
              () => _navigateTo(const SupportCenterPage()),
            ),
            
            // 4. Chính sách & quyền riêng tư
            _buildMenuItem(
              Icons.privacy_tip, 
              "Chính sách & quyền riêng tư", 
              () => _navigateTo(const PrivacyPolicyPage()),
            ),

            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _logout,
              icon: const Icon(Icons.logout),
              label: const Text("Đăng xuất"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              break;
            case 1:
              Navigator.pushNamed(context, '/danhmuc');
              break;
            case 2:
              Navigator.pushNamed(context, '/donhang');
              break;
            case 3:
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Khám phá'),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Điểm đến'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Danh mục'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }

  // SỬA LỖI: Cập nhật hàm để nhận tham số onTap
  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap, // Gắn chức năng điều hướng vào đây
      ),
    );
  }
}