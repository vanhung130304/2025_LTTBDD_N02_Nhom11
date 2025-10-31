import 'package:flutter/material.dart';
import '../services/flight_api_service.dart';

class ChuyenBayPage extends StatefulWidget {
  const ChuyenBayPage({super.key});

  @override
  State<ChuyenBayPage> createState() => _ChuyenBayPageState();
}

class _ChuyenBayPageState extends State<ChuyenBayPage> {
  List<dynamic> flights = [];
  bool isLoading = true;
  int _selectedIndex = 0; // BottomNavigationBar index

  @override
  void initState() {
    super.initState();
    loadFlights();
  }

  Future<void> loadFlights() async {
    try {
      final data = await FlightApiService.fetchFlights();
      setState(() {
        flights = data.take(30).toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      debugPrint('❌ Lỗi khi tải dữ liệu: $e');
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Chuyến bay thực tế'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: loadFlights,
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: flights.length,
                itemBuilder: (context, index) {
                  final flight = flights[index];
                  final callsign = flight[1]?.trim() ?? 'Không rõ';
                  final originCountry = flight[2] ?? 'Không rõ';
                  final altitude = flight[13]?.toStringAsFixed(0) ?? '0';
                  final velocity = flight[9]?.toStringAsFixed(1) ?? '0';

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 3,
                    child: ListTile(
                      leading: const Icon(
                        Icons.flight_takeoff,
                        color: Colors.blue,
                        size: 40,
                      ),
                      title: Text(
                        'Chuyến: $callsign',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Quốc gia: $originCountry\n'
                        'Độ cao: $altitude m\n'
                        'Tốc độ: $velocity m/s',
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Chi tiết chuyến: $callsign')),
                        );
                      },
                    ),
                  );
                },
              ),
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
