import 'package:flutter/material.dart';
import '../services/travel_api_service.dart';
import '../main.dart'; // ✅ thêm để quay lại HomeScreen

class ThamQuanPage extends StatefulWidget {
  const ThamQuanPage({super.key});

  @override
  State<ThamQuanPage> createState() => _ThamQuanPageState();
}

class _ThamQuanPageState extends State<ThamQuanPage> {
  List<dynamic> places = [];
  bool isLoading = true;
  int _selectedIndex = 1; // tab mặc định là "Danh mục" hoặc "Tham quan"

  @override
  void initState() {
    super.initState();
    loadPlaces();
  }

  Future<void> loadPlaces() async {
    try {
      final data = await TravelApiService.fetchPlaces();
      setState(() {
        places = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      debugPrint('❌ Lỗi: $e');
    }
  }

  // ✅ Sửa lại phần này
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    if (index == 0) {
      // Quay lại trang HomeScreen
      Navigator.pushAndRemoveUntil(
        context,
MaterialPageRoute(builder: (_) => HomeScreen(onLocaleChange: (locale) {})),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Tham quan & Giải trí'),
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(
                      Icons.place,
                      color: Colors.orange,
                      size: 40,
                    ),
                    title: Text(
                      place['name'] ?? 'Không rõ tên',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Cách ${place['distance']?.toStringAsFixed(0)} m\n'
                      'Thể loại: ${(place['categories'] as List?)?.join(", ") ?? "N/A"}',
                    ),
                    onTap: () {
                      debugPrint('Bạn đã chọn: ${place['name']}');
                    },
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
