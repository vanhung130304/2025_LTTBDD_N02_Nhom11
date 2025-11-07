// File: lib/screens/manage_permissions_page.dart

import 'package:flutter/material.dart';

// Định nghĩa Model cho một Quyền truy cập
class PermissionItem {
  final String name;
  final String description;
  final IconData icon;
  bool isGranted; // Trạng thái quyền: đã cấp hay chưa

  PermissionItem({
    required this.name,
    required this.description,
    required this.icon,
    required this.isGranted,
  });
}

class ManagePermissionsPage extends StatefulWidget {
  const ManagePermissionsPage({super.key});

  @override
  State<ManagePermissionsPage> createState() => _ManagePermissionsPageState();
}

class _ManagePermissionsPageState extends State<ManagePermissionsPage> {
  // Dữ liệu giả định về các quyền cần thiết cho ứng dụng du lịch/dịch vụ
  final List<PermissionItem> _permissions = [
    PermissionItem(
      name: 'Vị trí (Location)',
      description: 'Cho phép ứng dụng tìm kiếm các điểm đến gần bạn và đề xuất tour.',
      icon: Icons.location_on_outlined,
      isGranted: true,
    ),
    PermissionItem(
      name: 'Máy ảnh (Camera)',
      description: 'Cần thiết để bạn chụp ảnh xác minh hồ sơ hoặc tải ảnh lên album du lịch.',
      icon: Icons.camera_alt_outlined,
      isGranted: false,
    ),
    PermissionItem(
      name: 'Bộ nhớ (Storage)',
      description: 'Cho phép tải xuống và lưu trữ bản đồ ngoại tuyến, vé điện tử.',
      icon: Icons.folder_open_outlined,
      isGranted: true,
    ),
    PermissionItem(
      name: 'Microphone',
      description: 'Cần thiết cho chức năng tìm kiếm bằng giọng nói hoặc hỗ trợ khách hàng qua voice call.',
      icon: Icons.mic_none_outlined,
      isGranted: false,
    ),
    PermissionItem(
      name: 'Thông báo (Notifications)',
      description: 'Gửi thông báo về trạng thái đơn hàng và các ưu đãi khuyến mãi.',
      icon: Icons.notifications_none_outlined,
      isGranted: true,
    ),
  ];

  // Hàm xử lý khi người dùng chuyển đổi Switch
  void _togglePermission(int index, bool newValue) {
    // Trong ứng dụng thực tế, bạn sẽ cần gọi một hàm của plugin (ví dụ: permission_handler) 
    // để yêu cầu/thu hồi quyền hoặc điều hướng người dùng đến Cài đặt hệ thống.
    
    setState(() {
      _permissions[index].isGranted = newValue;
      
      // Hiển thị thông báo (Minh họa)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            newValue 
            ? 'Quyền ${_permissions[index].name} đã được cấp.'
            : 'Quyền ${_permissions[index].name} đã bị thu hồi.'
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Quyền truy cập'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Kiểm soát các quyền mà ứng dụng "Mobile_GK" đang sử dụng trên thiết bị của bạn. Vui lòng lưu ý: việc thay đổi quyền truy cập có thể ảnh hưởng đến một số chức năng của ứng dụng.',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ),
            
            // Thông báo chỉ dẫn
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.blue),
              title: const Text('Lưu ý: Bạn có thể cần vào Cài đặt hệ thống để thay đổi quyền.'),
              subtitle: Text('Bấm vào đây để mở Cài đặt ứng dụng', style: TextStyle(color: Colors.blue.shade700)),
              onTap: () {
                // TODO: Triển khai logic mở Cài đặt ứng dụng của hệ thống (Android/iOS)
                print('Điều hướng đến Cài đặt hệ thống.');
              },
            ),
            
            const Divider(),

            // Danh sách các Quyền
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _permissions.length,
              itemBuilder: (context, index) {
                final permission = _permissions[index];
                return _buildPermissionItem(permission, index);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget hỗ trợ tạo từng mục Quyền
  Widget _buildPermissionItem(PermissionItem permission, int index) {
    return SwitchListTile(
      // Màu cam cho Switch khi bật
      activeColor: Colors.orange,
      // Icon của quyền
      secondary: Icon(permission.icon, color: permission.isGranted ? Colors.orange : Colors.grey),
      // Tên quyền
      title: Text(
        permission.name,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: permission.isGranted ? Colors.black87 : Colors.grey,
        ),
      ),
      // Mô tả chi tiết
      subtitle: Text(permission.description),
      // Giá trị hiện tại của Switch
      value: permission.isGranted,
      // Hàm xử lý khi thay đổi
      onChanged: (newValue) => _togglePermission(index, newValue),
    );
  }
}