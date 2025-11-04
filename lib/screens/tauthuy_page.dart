import 'package:flutter/material.dart';
import '../widgets/base_page_scaffold.dart';

class TauThuyPage extends StatelessWidget {
  TauThuyPage({super.key});

  final List<Map<String, dynamic>> boatOptions = [
    {
      'name': 'Tàu Thủy A',
      'route': 'Hạ Long - Cát Bà',
      'price': '500.000đ',
      'rating': 4.5,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.OhU8Hw1MR6E2kUxdHozVDwHaFj?pid=Api&P=0&h=180',
    },
    {
      'name': 'Tàu Thủy B',
      'route': 'Hạ Long - Tuần Châu',
      'price': '450.000đ',
      'rating': 4.3,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.OhU8Hw1MR6E2kUxdHozVDwHaFj?pid=Api&P=0&h=180',
    },
    {
      'name': 'Tàu Thủy C',
      'route': 'Cần Thơ - Phú Quốc',
      'price': '600.000đ',
      'rating': 4.6,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.OhU8Hw1MR6E2kUxdHozVDwHaFj?pid=Api&P=0&h=180',
    },
    {
      'name': 'Tàu Thủy D',
      'route': 'Nha Trang - Đảo Hòn Tre',
      'price': '550.000đ',
      'rating': 4.4,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.OhU8Hw1MR6E2kUxdHozVDwHaFj?pid=Api&P=0&h=180',
    },
    {
      'name': 'Tàu Thủy E',
      'route': 'Vũng Tàu - Côn Đảo',
      'price': '700.000đ',
      'rating': 4.7,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.OhU8Hw1MR6E2kUxdHozVDwHaFj?pid=Api&P=0&h=180',
    },
    {
      'name': 'Tàu Thủy F',
      'route': 'Vũng Tàu - Côn Đảo',
      'price': '700.000đ',
      'rating': 4.7,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.OhU8Hw1MR6E2kUxdHozVDwHaFj?pid=Api&P=0&h=180',
    },
    {
      'name': 'Tàu Thủy G',
      'route': 'Vũng Tàu - Côn Đảo',
      'price': '700.000đ',
      'rating': 4.7,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.OhU8Hw1MR6E2kUxdHozVDwHaFj?pid=Api&P=0&h=180',
    },
    {
      'name': 'Tàu Thủy H',
      'route': 'Vũng Tàu - Côn Đảo',
      'price': '700.000đ',
      'rating': 4.7,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.OhU8Hw1MR6E2kUxdHozVDwHaFj?pid=Api&P=0&h=180',
    },
    {
      'name': 'Tàu Thủy I',
      'route': 'Vũng Tàu - Côn Đảo',
      'price': '700.000đ',
      'rating': 4.7,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.OhU8Hw1MR6E2kUxdHozVDwHaFj?pid=Api&P=0&h=180',
    },
    {
      'name': 'Tàu Thủy K',
      'route': 'Vũng Tàu - Côn Đảo',
      'price': '700.000đ',
      'rating': 4.7,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.OhU8Hw1MR6E2kUxdHozVDwHaFj?pid=Api&P=0&h=180'
    },
  ];


  @override
  Widget build(BuildContext context) {
    return BasePageScaffold(
      title: 'Tàu Thủy',
      currentIndex: 1,
      showHotPlaces: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Các chuyến tàu thủy đề xuất',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: boatOptions.length,
            itemBuilder: (context, index) {
              final boat = boatOptions[index];
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
                        boat['image'],
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
                              boat['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text('Tuyến: ${boat['route']}'),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange.shade400,
                                  size: 16,
                                ),
                                const SizedBox(width: 3),
                                Text('${boat['rating']}'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Giá: ${boat['price']}',
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
        ],
      ),
    );
  }
}
