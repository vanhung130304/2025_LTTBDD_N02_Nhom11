import 'package:flutter/material.dart';
import '../widgets/base_page_scaffold.dart';

class ChuyenBayPage extends StatefulWidget {
  ChuyenBayPage({super.key});

  @override
  State<ChuyenBayPage> createState() => _ChuyenBayPageState();
}

class _ChuyenBayPageState extends State<ChuyenBayPage> {
  final List<Map<String, dynamic>> flightOptions = [
    {
      'name': 'Chuyến bay A',
      'route': 'Hà Nội - TP.HCM',
      'price': '1.200.000đ',
      'rating': 4.7,
      'image': 'https://tse3.mm.bing.net/th/id/OIP.-mqxIIYIQBh4bORsE8l8kAHaEo?pid=Api&P=0&h=180',
    },
    {
      'name': 'Chuyến bay B',
      'route': 'Hà Nội - Đà Nẵng',
      'price': '900.000đ',
      'rating': 4.5,
      'image': 'https://tse3.mm.bing.net/th/id/OIP.-mqxIIYIQBh4bORsE8l8kAHaEo?pid=Api&P=0&h=180',
    },
    {
      'name': 'Chuyến bay C',
      'route': 'Hà Nội - Nha Trang',
      'price': '1.500.000đ',
      'rating': 4.6,
      'image': 'https://tse3.mm.bing.net/th/id/OIP.-mqxIIYIQBh4bORsE8l8kAHaEo?pid=Api&P=0&h=180',
    },
    {
      'name': 'Chuyến bay D',
      'route': 'TP.HCM - Đà Nẵng',
      'price': '800.000đ',
      'rating': 4.4,
      'image': 'https://tse3.mm.bing.net/th/id/OIP.-mqxIIYIQBh4bORsE8l8kAHaEo?pid=Api&P=0&h=180',
    },
    {
      'name': 'Chuyến bay E',
      'route': 'TP.HCM - Hà Nội',
      'price': '1.300.000đ',
      'rating': 4.7,
      'image': 'https://tse3.mm.bing.net/th/id/OIP.-mqxIIYIQBh4bORsE8l8kAHaEo?pid=Api&P=0&h=180',
    },
    {
      'name': 'Chuyến bay F',
      'route': 'Hải Phòng - TP.HCM',
      'price': '1.100.000đ',
      'rating': 4.5,
      'image': 'https://tse3.mm.bing.net/th/id/OIP.-mqxIIYIQBh4bORsE8l8kAHaEo?pid=Api&P=0&h=180',
    },
    {
      'name': 'Chuyến bay G',
      'route': 'Đà Nẵng - TP.HCM',
      'price': '950.000đ',
      'rating': 4.3,
      'image': 'https://tse3.mm.bing.net/th/id/OIP.-mqxIIYIQBh4bORsE8l8kAHaEo?pid=Api&P=0&h=180',
    },
    {
      'name': 'Chuyến bay H',
      'route': 'Nha Trang - Hà Nội',
      'price': '1.400.000đ',
      'rating': 4.6,
      'image': 'https://tse3.mm.bing.net/th/id/OIP.-mqxIIYIQBh4bORsE8l8kAHaEo?pid=Api&P=0&h=180',
    },
    {
      'name': 'Chuyến bay I',
      'route': 'Cần Thơ - TP.HCM',
      'price': '750.000đ',
      'rating': 4.4,
      'image': 'https://tse3.mm.bing.net/th/id/OIP.-mqxIIYIQBh4bORsE8l8kAHaEo?pid=Api&P=0&h=180',
    },
    {
      'name': 'Chuyến bay K',
      'route': 'Hà Nội - Huế',
      'price': '1.000.000đ',
      'rating': 4.5,
      'image': 'https://tse3.mm.bing.net/th/id/OIP.-mqxIIYIQBh4bORsE8l8kAHaEo?pid=Api&P=0&h=180',
    },
  ];

  List<Map<String, dynamic>> displayedFlights = [];

  @override
  void initState() {
    super.initState();
    displayedFlights = List.from(flightOptions);
  }

  void _searchFlight(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedFlights = List.from(flightOptions);
      } else {
        displayedFlights = flightOptions
            .where((flight) =>
                flight['name'].toLowerCase().contains(query.toLowerCase()) ||
                flight['route'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePageScaffold(
      title: 'Chuyến bay',
      currentIndex: 1,
      onSearchChanged: _searchFlight,
      showHotPlaces: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Các chuyến bay đề xuất',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: displayedFlights.length,
            itemBuilder: (context, index) {
              final flight = displayedFlights[index];
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
                        flight['image'],
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
                              flight['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text('Tuyến: ${flight['route']}'),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange.shade400,
                                  size: 16,
                                ),
                                const SizedBox(width: 3),
                                Text('${flight['rating']}'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Giá: ${flight['price']}',
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
