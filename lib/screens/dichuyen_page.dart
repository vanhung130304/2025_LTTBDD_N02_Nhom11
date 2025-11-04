import 'package:flutter/material.dart';
import 'chuyen_bay_page.dart';
import 'xekhach_page.dart';
import 'tauthuy_page.dart'; // 🔸 Thêm import TauThuyPage

class DiChuyenPage extends StatefulWidget {
  @override
  State<DiChuyenPage> createState() => _DiChuyenPageState();
}

class _DiChuyenPageState extends State<DiChuyenPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
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
        Navigator.pushNamed(context, '/taikhoan');
        break;
    }
  }

  final List<Map<String, dynamic>> transportOptions = [
    {'emoji': '✈️', 'label': 'Chuyến bay', 'page': ChuyenBayPage()},
    {'emoji': '🚆', 'label': 'Tàu hỏa', 'page': null},
    {'emoji': '🚌', 'label': 'Xe khách', 'page': XeKhachPage()},
    {'emoji': '⛴️', 'label': 'Tàu thủy', 'page': TauThuyPage()}, // 🔸 Gán page để nút ấn được
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Dịch vụ di chuyển',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.1,
        ),
        itemCount: transportOptions.length,
        itemBuilder: (context, index) {
          final option = transportOptions[index];
          return InkWell(
            onTap: () {
              if (option['page'] != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => option['page']),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Chức năng ${option['label']} đang được phát triển',
                    ),
                  ),
                );
              }
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(option['emoji'], style: const TextStyle(fontSize: 45)),
                  const SizedBox(height: 10),
                  Text(
                    option['label'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Khám phá'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Danh mục',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Đơn hàng',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }
}
