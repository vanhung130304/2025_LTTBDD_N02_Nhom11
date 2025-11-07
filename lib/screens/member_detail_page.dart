// File: lib/screens/member_detail_page.dart

import 'package:flutter/material.dart';

class MemberDetailPage extends StatelessWidget {
  // Biến để nhận dữ liệu thành viên từ trang trước (GroupProfilePage)
  final Map<String, String> member;

  const MemberDetailPage({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(member['name'] ?? 'Chi tiết thành viên'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // --- Phần nền trên và Ảnh đại diện (Sinh động hơn) ---
            _buildHeaderBackground(member), 
            
            // --- Thông tin chính (Tên, Vai trò) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: [
                  Text(
                    member['name'] ?? 'Chưa xác định',
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    member['role'] ?? 'Không rõ vai trò',
                    style: TextStyle(fontSize: 18, color: Colors.grey[700], fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- Các thẻ thông tin chi tiết ---
            _buildDetailCard(
              icon: Icons.badge_outlined,
              label: 'Mã số sinh viên (MSSV)',
              value: member['mssv'] ?? 'Đang cập nhật',
            ),
            _buildDetailCard(
              icon: Icons.calendar_today_outlined,
              label: 'Ngày sinh',
              value: member['dob'] ?? 'N/A', 
            ),
            _buildDetailCard(
              icon: Icons.location_on_outlined,
              label: 'Quê quán',
              value: member['address'] ?? 'N/A', // Hiển thị Quê quán
            ),
            _buildDetailCard(
              icon: Icons.email_outlined,
              label: 'Email',
              value: member['email'] ?? 'N/A',
            ),
            _buildDetailCard(
              icon: Icons.phone_outlined,
              label: 'Số điện thoại',
              value: member['phone'] ?? 'N/A',
            ),
            _buildDetailCard(
              icon: Icons.favorite_border_outlined,
              label: 'Sở thích',
              value: member['hobbies'] ?? 'Đang cập nhật', // Hiển thị Sở thích
            ),
            
            const SizedBox(height: 30),

            // Nút hành động bổ sung
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Thêm logic liên hệ/xem chi tiết thêm
                  print('Liên hệ với ${member['name']}');
                },
                icon: const Icon(Icons.message_outlined),
                label: const Text('Gửi tin nhắn'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- WIDGET HỖ TRỢ CHO GIAO DIỆN SINH ĐỘNG ---

  // Phần Header với hiệu ứng Gradient và Avatar nổi bật
  Widget _buildHeaderBackground(Map<String, String> member) {
    return Container(
      width: double.infinity,
      height: 200, // Chiều cao của phần header
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade300, Colors.orange.shade700], // Màu gradient cam
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            child: CircleAvatar(
              radius: 65,
              backgroundColor: Colors.white, // Viền trắng
              child: CircleAvatar(
                radius: 60,
                // Hiển thị chữ cái đầu tên
                child: Text(
                  member['name']!.isNotEmpty ? member['name']![0] : '?',
                  style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget hỗ trợ tạo thẻ thông tin chi tiết với thiết kế bo tròn, đổ bóng
  Widget _buildDetailCard({required IconData icon, required String label, required String value}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8), 
      elevation: 2, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), 
      child: ListTile(
        leading: Icon(icon, color: Colors.orange.shade700, size: 28), // Màu cam đậm, icon lớn
        title: Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
        subtitle: Text(value, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87)),
      ),
    );
  }
}