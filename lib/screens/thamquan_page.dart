import 'package:flutter/material.dart';
import '../widgets/base_page_scaffold.dart';

class ThamQuanPage extends StatefulWidget {
  const ThamQuanPage({super.key});

  @override
  State<ThamQuanPage> createState() => _ThamQuanPageState();
}

class _ThamQuanPageState extends State<ThamQuanPage> {
  int _selectedIndex = 1;

  List<Map<String, dynamic>> places = [
    {
      'name': 'Vịnh Hạ Long',
      'location': 'Quảng Ninh',
      'price': '500.000đ',
      'rating': 4.8,
      'image':
          'https://tse2.mm.bing.net/th/id/OIP.4U8W39EUI9600HKjGBDKDgHaEK?pid=Api&P=0&h=180',
    },
    {
      'name': 'Phố cổ Hội An',
      'location': 'Quảng Nam',
      'price': '300.000đ',
      'rating': 4.7,
      'image':
          'https://tse3.mm.bing.net/th/id/OIP.YKnFhOQje4hxq9TNydmKtAHaEo?pid=Api&P=0&h=180',
    },
    {
      'name': 'Đà Lạt',
      'location': 'Lâm Đồng',
      'price': '400.000đ',
      'rating': 4.6,
      'image':
          'https://tse1.mm.bing.net/th/id/OIP.ZOd06A0402muhrl-kIXXywHaEO?pid=Api&P=0&h=180',
    },
    {
      'name': 'Sapa',
      'location': 'Lào Cai',
      'price': '350.000đ',
      'rating': 4.5,
      'image':
          'https://tse1.mm.bing.net/th/id/OIP.aPsexA7y7XIJpmq4gOY_FAHaEK?pid=Api&P=0&h=180',
    },
    {
      'name': 'Cù Lao Chàm',
      'location': 'Quảng Nam',
      'price': '250.000đ',
      'rating': 4.4,
      'image':
          'https://tse2.mm.bing.net/th/id/OIP.0vrRTc5eBnizyMjzHThCVwHaE7?pid=Api&P=0&h=180',
    },
  ];

  List<Map<String, dynamic>> displayedPlaces = [];

  @override
  void initState() {
    super.initState();
    displayedPlaces = List.from(places);
  }

  void filterPlaces(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        displayedPlaces = List.from(places);
      } else {
        displayedPlaces = places.where((place) {
          final nameLower = place['name'].toLowerCase();
          final locationLower = place['location'].toLowerCase();
          final searchLower = keyword.toLowerCase();
          return nameLower.contains(searchLower) || locationLower.contains(searchLower);
        }).toList();
      }
    });
  }

  void _onItemTapped(int index) {
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

  @override
  Widget build(BuildContext context) {
    return BasePageScaffold(
      title: 'Tham Quan',
      currentIndex: _selectedIndex,
      showHotPlaces: false,
      onSearchChanged: filterPlaces,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Các địa điểm tham quan đề xuất',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: displayedPlaces.length,
            itemBuilder: (context, index) {
              final place = displayedPlaces[index];
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
                        place['image'],
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
                              place['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text('Địa điểm: ${place['location']}'),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange.shade400,
                                  size: 16,
                                ),
                                const SizedBox(width: 3),
                                Text('${place['rating'].toStringAsFixed(1)}'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Giá: ${place['price']}',
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
