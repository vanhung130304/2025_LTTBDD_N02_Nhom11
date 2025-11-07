// File: lib/screens/manage_address_page.dart

import 'package:flutter/material.dart';

// Định nghĩa một Model đơn giản cho Địa chỉ
class Address {
  final String id;
  final String label; // Ví dụ: "Nhà riêng", "Công ty"
  final String receiverName;
  final String phone;
  final String fullAddress; // Ví dụ: "Số 10, đường ABC, Phường 1, TP.HCM"
  final bool isDefault;

  Address({
    required this.id,
    required this.label,
    required this.receiverName,
    required this.phone,
    required this.fullAddress,
    this.isDefault = false,
  });
}

class ManageAddressPage extends StatefulWidget {
  const ManageAddressPage({super.key});

  @override
  State<ManageAddressPage> createState() => _ManageAddressPageState();
}

class _ManageAddressPageState extends State<ManageAddressPage> {
  // Dữ liệu giả định về danh sách địa chỉ
  List<Address> _addresses = [
    Address(
      id: '1',
      label: 'Nhà riêng',
      receiverName: 'Dương Văn Hưng',
      phone: '0901xxxx123',
      fullAddress: 'Số 123, Ngõ 456, Đường Giải Phóng, Hà Nội',
      isDefault: true,
    ),
    Address(
      id: '2',
      label: 'Công ty',
      receiverName: 'Trần Ánh Tuyết',
      phone: '0902xxxx456',
      fullAddress: 'Tầng 10, Tòa nhà ABC, Quận 1, TP. Hồ Chí Minh',
      isDefault: false,
    ),
  ];

  // Hàm giả định cho việc thêm/chỉnh sửa địa chỉ
  void _addOrEditAddress([Address? address]) {
    // TODO: Triển khai một form modal hoặc trang mới để nhập thông tin địa chỉ
    print(address == null ? 'Mở Form Thêm Địa Chỉ Mới' : 'Mở Form Chỉnh Sửa Địa Chỉ: ${address.label}');
    
    // Sau khi xử lý form và nhận được địa chỉ mới, bạn cần cập nhật _addresses bằng setState()
    // Ví dụ: setState(() { _addresses.add(newAddress); });
  }

  // Hàm xóa địa chỉ
  void _deleteAddress(String id) {
    setState(() {
      _addresses.removeWhere((addr) => addr.id == id);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã xóa địa chỉ thành công.')),
      );
      // Logic kiểm tra nếu xóa địa chỉ mặc định, cần gán lại mặc định cho địa chỉ khác
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Địa chỉ'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
      ),
      body: _addresses.isEmpty
          ? _buildEmptyState() // Hiển thị khi chưa có địa chỉ nào
          : ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: _addresses.length,
              itemBuilder: (context, index) {
                return _buildAddressCard(_addresses[index]);
              },
            ),
      // Floating Action Button để thêm địa chỉ mới
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addOrEditAddress(),
        icon: const Icon(Icons.add_location_alt_outlined),
        label: const Text('Thêm Địa chỉ mới'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
    );
  }

  // --- WIDGET HỖ TRỢ ---

  // Hiển thị trạng thái rỗng
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_off, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          const Text('Bạn chưa có địa chỉ nào được lưu.', style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () => _addOrEditAddress(),
            icon: const Icon(Icons.add),
            label: const Text('Thêm Địa chỉ đầu tiên'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.orange,
              side: const BorderSide(color: Colors.orange),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  // Thiết kế từng thẻ Địa chỉ
  Widget _buildAddressCard(Address address) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: address.isDefault
            ? const BorderSide(color: Colors.orange, width: 2) // Viền cam cho địa chỉ mặc định
            : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dòng 1: Label và Trạng thái Mặc định
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    address.label,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                if (address.isDefault)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'MẶC ĐỊNH',
                      style: TextStyle(color: Colors.green.shade700, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
              ],
            ),
            const Divider(height: 16),
            
            // Thông tin người nhận
            Text(
              '${address.receiverName} | ${address.phone}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            
            // Địa chỉ chi tiết
            Text(
              address.fullAddress,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 12),

            // Các nút hành động
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Nút Chỉnh sửa
                TextButton(
                  onPressed: () => _addOrEditAddress(address),
                  child: const Text('CHỈNH SỬA', style: TextStyle(color: Colors.blue)),
                ),
                const SizedBox(width: 8),

                // Nút Xóa
                TextButton(
                  onPressed: () => _showDeleteConfirmation(address.id),
                  child: const Text('XOÁ', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Hiển thị hộp thoại xác nhận xóa
  void _showDeleteConfirmation(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận Xóa'),
          content: const Text('Bạn có chắc chắn muốn xóa địa chỉ này không?'),
          actions: <Widget>[
            TextButton(
              child: const Text('HUỶ', style: TextStyle(color: Colors.grey)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('XOÁ', style: TextStyle(color: Colors.red)),
              onPressed: () {
                _deleteAddress(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}