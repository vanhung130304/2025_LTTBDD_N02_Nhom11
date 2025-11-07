// File: lib/screens/group_profile_page.dart

import 'package:flutter/material.dart';

// Màn hình chính
class GroupProfilePage extends StatelessWidget {
  const GroupProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Nhóm 8'),
        // Đã đồng bộ màu sắc với dự án của bạn (nếu bạn dùng màu cam)
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 1, // Thêm đổ bóng nhẹ
      ),
      body: const GroupProfileBody(),
    );
  }
}

// Widget chứa nội dung
class GroupProfileBody extends StatelessWidget {
  const GroupProfileBody({super.key});

  // Dữ liệu giả định về thành viên
  final List<Map<String, String>> _members = const [
    {
      'name': 'Dương Văn Hưng',
      'mssv': '2052xxxx',
      'role': 'Nhóm trưởng (Backend)',
    },
    {'name': 'Trần Ánh Tuyết ', 'mssv': '2052yyyy', 'role': 'Thiết kế UI/UX'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Phần 1: Thông tin chung của Nhóm
          _buildGroupInfoSection(),

          // Đường kẻ phân cách
          const Divider(height: 1, thickness: 8, color: Color(0xFFF0F0F0)),

          // Phần 2: Danh sách thành viên
          _buildMemberListSection(),
        ],
      ),
    );
  }

  // --- HÀM XÂY DỰNG GIAO DIỆN ---

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
              backgroundColor: Colors.orange, // Đồng bộ màu cam
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
              'Nhóm Phát triển Ứng dụng Di động (Nhóm 8)',
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
          Icon(icon, size: 18, color: Colors.orange), // Đồng bộ màu cam
          const SizedBox(width: 10),
          Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 5),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  // ĐÃ SỬA LỖI: Bỏ từ khóa 'const' khỏi Padding.
  Widget _buildMemberListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          // <-- ĐÃ XÓA 'const' Ở ĐÂY
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            // Giờ có thể dùng giá trị động _members.length
            'Danh sách Thành viên (${_members.length})',
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
            onTap: () {
              // Có thể thêm logic hiển thị chi tiết thành viên tại đây
            },
          );
        }).toList(),
      ],
    );
  }
}
