import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'screens/thamquan_page.dart';
import 'screens/dichuyen_page.dart';
import 'screens/xekhach_page.dart';
import 'screens/chuyen_bay_page.dart';
import 'screens/luu_tru_page.dart';
import 'screens/tauthuy_page.dart';
import 'screens/tour_page.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Roboto'),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomeScreen(),
        '/dichuyen': (context) => DiChuyenPage(),
        '/xekhach': (context) => XeKhachPage(),
        '/chuyenbay': (context) => ChuyenBayPage(),
        '/tauthuy': (context) => TauThuyPage(),
        '/tour': (context) => const TourPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> bannerImages = [
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1000&q=80',
      'https://images.unsplash.com/photo-1518684079-3c830dcef090?auto=format&fit=crop&w=1000&q=80',
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=1000&q=80',
      'https://tse1.mm.bing.net/th/id/OIP.kNZyRFXEOhmeCE-aHRHXEgHaEl?pid=Api&P=0&h=220',
      'https://tse3.mm.bing.net/th/id/OIP.4yLIzDVOG1EBZBVwjqscbwHaEK?pid=Api&P=0&h=220',
    ];

    final List<Map<String, dynamic>> hotPlaces = [
      {
        'name': 'Phú Quốc',
        'image': 'https://tse2.mm.bing.net/th/id/OIP.T_Mtex10QU9Dvr-4HqnmwwHaFj?pid=Api&P=0&h=220',
        'price': '1.200.000đ',
        'rating': 4.8,
      },
      {
        'name': 'Đà Lạt',
        'image': 'https://tse1.mm.bing.net/th/id/OIP.K_GeZEn0BucG7aW0R2H3fgHaE7?pid=Api&P=0&h=220',
        'price': '950.000đ',
        'rating': 4.6,
      },
      {
        'name': 'Hạ Long',
        'image': 'https://images.unsplash.com/photo-1551334787-21e6bd3ab135?auto=format&fit=crop&w=800&q=80',
        'price': '1.500.000đ',
        'rating': 4.9,
      },
      {
        'name': 'Hội An',
        'image': 'https://tse3.mm.bing.net/th/id/OIP.dzA_Yfyig-awC61M2d4-gAHaEo?pid=Api&P=0&h=220',
        'price': '1.000.000đ',
        'rating': 4.7,
      },
      {
        'name': 'Sapa',
        'image': 'https://images.unsplash.com/photo-1549880338-65ddcdfd017b?auto=format&fit=crop&w=800&q=80',
        'price': '1.300.000đ',
        'rating': 4.5,
      },
      {
        'name': 'Ninh Bình',
        'image': 'https://tse3.mm.bing.net/th/id/OIP.exvYmYNk5tYHPkts9PPrZgHaEK?pid=Api&P=0&h=220',
        'price': '850.000đ',
        'rating': 4.4,
      },
      {
        'name': 'Văn HưngNA (check clone)',
        'image': 'https://tse3.mm.bing.net/th/id/OIP.exvYmYNk5tYHPkts9PPrZgHaEK?pid=Api&P=0&h=220',
        'price': '850.000đ',
        'rating': 4.4,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Tìm theo điểm đến hoặc hoạt động',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
              ),
              const Icon(Icons.shopping_cart, color: Colors.orange),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Khám phá địa điểm mới',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                  label: const Text(
                    'Mới',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Cập nhật vị trí',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            CarouselSlider(
              items: bannerImages.map((url) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(url, fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: const EdgeInsets.all(12),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          color: Colors.orange.withOpacity(0.7),
                          child: const Text(
                            'GIẢM ĐẾN 70%',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 160,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                autoPlayInterval: const Duration(seconds: 4),
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ThamQuanPage()));
                  },
                  child: buildCategoryIcon(Icons.airplanemode_active, 'Tham quan & giải trí'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DiChuyenPage()));
                  },
                  child: buildCategoryIcon(Icons.directions_car, 'Di chuyển'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const LuuTruPage()));
                  },
                  child: buildCategoryIcon(Icons.hotel, 'Lưu trú & nghỉ dưỡng'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const TourPage()));
                  },
                  child: buildCategoryIcon(Icons.tour, 'Tour'),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Text(
              'Dịch vụ được yêu thích',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: hotPlaces.length,
              itemBuilder: (context, index) {
                final place = hotPlaces[index];
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
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 3),
                                  Text('${place['rating']}'),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Khám phá'),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Điểm đến'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Danh mục'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }

  Widget buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: Icon(icon, color: Colors.orange, size: 30),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
