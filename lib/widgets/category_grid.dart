import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"icon": Icons.local_activity, "title": "Tham quan & giải trí"},
      {"icon": Icons.directions_bus, "title": "Di chuyển"},
      {"icon": Icons.hotel, "title": "Lưu trú & nghỉ dưỡng"},
      {"icon": Icons.place, "title": "Các điểm tham quan"},
      {"icon": Icons.tour, "title": "Tour"},
      {"icon": Icons.beach_access, "title": "Staycations"},
      {"icon": Icons.restaurant, "title": "Ẩm thực & Nhà hàng"},
      {"icon": Icons.sim_card, "title": "Thuê xe & SIM"},
    ];

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final cat = categories[index];
        return Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xFFFFF0E0),
              child: Icon(
                cat["icon"],
                color: const Color(0xFFFF8C42),
                size: 22,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              cat["title"] as String,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        );
      },
    );
  }
}
