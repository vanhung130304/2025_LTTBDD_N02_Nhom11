// File: lib/screens/group_profile_page.dart

import 'package:flutter/material.dart';
import 'member_detail_page.dart'; 

// Màn hình chính
class GroupProfilePage extends StatelessWidget {
  const GroupProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Nhóm 11'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 1, 
      ),
      // Xóa 'const' ở đây nếu bạn muốn dữ liệu (như _members) thay đổi
      body: const GroupProfileBody(), 
    );
  }
}

// Widget chứa nội dung
class GroupProfileBody extends StatelessWidget {
  const GroupProfileBody({super.key});

  // Dữ liệu giả định về thành viên (ĐÃ CẬP NHẬT THÊM THÔNG TIN CHI TIẾT)
  final List<Map<String, String>> _members = const [
    {
      'name': 'Dương Văn Hưng',
      'mssv': '22010166',
      'role': 'Nhóm trưởng (UI/UX?Frontend?Backend)',
      'email': 'hungdv@mobilegk.com',
      'phone': '0901xxxx123',
      'address': 'Nghệ An', // THÔNG TIN MỚI
      'dob': '13/03/2004',    // THÔNG TIN MỚI
      'hobbies': 'Đá bóng, lập trình, chơi game', // THÔNG TIN MỚI
    },
    {
      'name': 'Trần Ánh Tuyết ', 
      'mssv': '22010309', 
      'role': 'Thiết kế UI/UX//Báo Cáo',
      'email': 'tuyetta@mobilegk.com',
      'phone': '0902xxxx456',
      'address': 'Nam Định', // THÔNG TIN MỚI
      'dob': '25/08/2004',    // THÔNG TIN MỚI
      'hobbies': 'Đọc sách, vẽ, du lịch', // THÔNG TIN MỚI
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGroupInfoSection(),
          const Divider(height: 1, thickness: 8, color: Color(0xFFF0F0F0)),
          _buildMemberListSection(context), // <--- TRUYỀN context VÀO ĐÂY
        ],
      ),
    );
  }

  // --- HÀM XÂY DỰNG GIAO DIỆN ---
  
  // (Các hàm _buildGroupInfoSection và _buildInfoRow được giữ nguyên)
  Widget _buildGroupInfoSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo/Ảnh đại diện nhóm
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orange, 
              child: const Text(
                'N8',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Tên Nhóm và Mô tả
          const Center(
            child: Text(
              'Nhóm Phát triển Ứng dụng Di động (Nhóm 11)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            'Mục tiêu: Xây dựng ứng dụng du lịch "Mobile_GK" hoàn chỉnh, tối ưu hóa trải nghiệm người dùng với công nghệ Flutter.',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Thông tin khác
          _buildInfoRow(Icons.calendar_today, 'Ngày thành lập', '15/10/2025'),
          _buildInfoRow(Icons.code, 'Công nghệ', 'Flutter & Dart'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.orange),
          const SizedBox(width: 10),
          Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 5),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  // HÀM ĐÃ SỬA LỖI CONST và THÊM LOGIC ĐIỀU HƯỚNG
  Widget _buildMemberListSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ĐÃ XÓA 'const' KHỎI PADDING để giải quyết lỗi biên dịch
        Padding( 
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Danh sách Thành viên (${_members.length})', // Giá trị động không còn lỗi
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),

        // Vòng lặp tạo ListTile cho mỗi thành viên
        ..._members.map((member) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange.withOpacity(0.1),
              child: Text(
                member['name']![0],
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(member['name']!),
            subtitle: Text('${member['mssv']} - ${member['role']}'),
            
            // LOGIC ĐIỀU HƯỚNG VÀ TRUYỀN DỮ LIỆU
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // Chuyển sang MemberDetailPage và truyền toàn bộ Map dữ liệu member
                  builder: (context) => MemberDetailPage(member: member), 
                ),
              );
            },
          );
        }).toList(),
      ],
    );
  }
}