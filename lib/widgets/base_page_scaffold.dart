import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BasePageScaffold extends StatelessWidget {
  final String title;
  final int currentIndex;
  final Widget body;
  final bool showHotPlaces;
  final List<Map<String, dynamic>>? hotPlaces;

  const BasePageScaffold({
    super.key,
    required this.title,
    required this.currentIndex,
    required this.body,
    this.showHotPlaces = false,
    this.hotPlaces,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> bannerImages = [
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1000&q=80',
      'https://images.unsplash.com/photo-1518684079-3c830dcef090?auto=format&fit=crop&w=1000&q=80',
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=1000&q=80',
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
                    hintText: 'Tìm kiếm $title',
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
            // 🔹 Luôn hiển thị phần "Khám phá địa điểm mới" + "Mới" + "Cập nhật vị trí"
            Column(
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
              ],
            ),

            // 🔹 Banner
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
            const SizedBox(height: 15),

            // 🔹 Danh mục
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  buildCategoryIcon(
                    Icons.airplanemode_active,
                    'Tham quan & giải trí',
                    context,
                  ),
                  buildCategoryIcon(Icons.directions_car, 'Di chuyển', context),
                  buildCategoryIcon(
                    Icons.hotel,
                    'Lưu trú & nghỉ dưỡng',
                    context,
                  ),
                  buildCategoryIcon(Icons.tour, 'Tour', context),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // 🔹 Nội dung riêng của trang
            body,

            // 🔹 Dịch vụ yêu thích
            if (showHotPlaces && hotPlaces != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    'Dịch vụ được yêu thích',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: hotPlaces!.length,
                    itemBuilder: (context, index) {
                      final place = hotPlaces![index];
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
                                          color: Colors.orange.shade400,
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (route) => false,
              );
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
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Khám phá'),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Điểm đến'),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Danh mục',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }

  Widget buildCategoryIcon(IconData icon, String label, BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
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
      ),
    );
  }
}
