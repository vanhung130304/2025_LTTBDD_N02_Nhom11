import 'package:flutter/material.dart';

class XeKhachPage extends StatefulWidget {
  const XeKhachPage({super.key});

  @override
  State<XeKhachPage> createState() => _XeKhachPageState();
}

class _XeKhachPageState extends State<XeKhachPage> {
  int _selectedIndex = 0; // BottomNavigationBar index

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

  final List<Map<String, dynamic>> busOptions = [
    {
      'name': 'Xe khách A',
      'route': 'Hà Nội - Hải Phòng',
      'price': '200.000đ',
      'rating': 4.5,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách B',
      'route': 'Hà Nội - Nam Định',
      'price': '180.000đ',
      'rating': 4.3,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách C',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách D',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách E',
      'route': 'Hà Nội  Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách F',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách G',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách H',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách I',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách K',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách L',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách M',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Xe khách',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: busOptions.length,
        itemBuilder: (context, index) {
          final bus = busOptions[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    bus['image'],
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bus['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text('Tuyến: ${bus['route']}'),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange.shade400,
                              size: 16,
                            ),
                            const SizedBox(width: 3),
                            Text('${bus['rating']}'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Giá: ${bus['price']}',
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              minimumSize: Size.zero,
                            ),
                            child: const Text('Xem chi tiết'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
