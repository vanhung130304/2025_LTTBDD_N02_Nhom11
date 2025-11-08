import 'package:flutter/material.dart';
import '../widgets/base_page_scaffold.dart';

class TourPage extends StatefulWidget {
  const TourPage({super.key});

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> tours = [
    {
      'name': 'Tour Hạ Long 3N2Đ',
      'location': 'Quảng Ninh',
      'duration': '3 ngày 2 đêm',
      'price': '2.500.000đ',
      'rating': 4.7,
      'image':
      'https://tse2.mm.bing.net/th/id/OIP.jQ1teKISIftBRL_Vww3lVgHaFj?pid=Api&P=0&h=180',

      'departureDate': '15/11/2025',
      'transport': 'Xe khách',
    },
    {
      'name': 'Tour Đà Lạt 4N3Đ',
      'location': 'Lâm Đồng',
      'duration': '4 ngày 3 đêm',
      'price': '3.200.000đ',
      'rating': 4.8,
      'image':
          'https://tse1.mm.bing.net/th/id/OIP.6V4YH0fqjD-eyDXFGXo0eQHaDt?pid=Api&P=0&h=180',
      'departureDate': '20/11/2025',
      'transport': 'Máy bay',
    },
    {
      'name': 'Tour Phú Quốc 5N4Đ',
      'location': 'Kiên Giang',
      'duration': '5 ngày 4 đêm',
      'price': '5.900.000đ',
      'rating': 4.9,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.ZMIbdN5d_34BeIDzVXmlSQHaEK?pid=Api&P=0&h=180',
      'departureDate': '10/12/2025',
      'transport': 'Máy bay + Tàu cao tốc',
    },
    {
      'name': 'Tour Sapa 3N2Đ',
      'location': 'Lào Cai',
      'duration': '3 ngày 2 đêm',
      'price': '2.000.000đ',
      'rating': 4.6,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.OnRJQ8Vjuo69cEEjHhy5vAHaEz?pid=Api&P=0&h=180',
      'departureDate': '05/12/2025',
      'transport': 'Tàu hỏa',
    },
    {
      'name': 'Tour Nha Trang 4N3Đ',
      'location': 'Khánh Hòa',
      'duration': '4 ngày 3 đêm',
      'price': '3.800.000đ',
      'rating': 4.8,
      'image':
          'https://tse2.mm.bing.net/th/id/OIP.al34spc6Z-EmaPTM6VIkAgHaE8?pid=Api&P=0&h=180',
      'departureDate': '18/11/2025',
      'transport': 'Máy bay',
    },
    {
      'name': 'Tour Miền Tây 2N1Đ',
      'location': 'Cần Thơ – Tiền Giang',
      'duration': '2 ngày 1 đêm',
      'price': '1.200.000đ',
      'rating': 4.5,
      'image':
          'https://tse2.mm.bing.net/th/id/OIP.1W714dJBW1vcJoTTo1QO2gHaE8?pid=Api&P=0&h=180',
      'departureDate': '25/11/2025',
      'transport': 'Xe khách',
    },
    {
      'name': 'Tour Huế 3N2Đ',
      'location': 'Thừa Thiên Huế',
      'duration': '3 ngày 2 đêm',
      'price': '2.400.000đ',
      'rating': 4.6,
      'image':
          'https://tse3.mm.bing.net/th/id/OIP.n9v6fdGqhagLbNLBvKm1DgHaE7?pid=Api&P=0&h=180',
      'departureDate': '12/12/2025',
      'transport': 'Xe khách',
    },
    {
      'name': 'Tour Quảng Bình 3N2Đ',
      'location': 'Quảng Bình',
      'duration': '3 ngày 2 đêm',
      'price': '2.300.000đ',
      'rating': 4.5,
      'image':
          'https://tse2.mm.bing.net/th/id/OIP.DyOpRNM-ZWYFXMKTKyFXNwHaFO?pid=Api&P=0&h=180',
      'departureDate': '28/11/2025',
      'transport': 'Xe khách',
    },
    {
      'name': 'Tour Hà Giang 4N3Đ',
      'location': 'Hà Giang',
      'duration': '4 ngày 3 đêm',
      'price': '3.100.000đ',
      'rating': 4.9,
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.bW9y77mWwaFEEKjKE2twPQHaFL?pid=Api&P=0&h=180',
      'departureDate': '08/12/2025',
      'transport': 'Xe giường nằm',
    },
    {
      'name': 'Tour Côn Đảo 3N2Đ',
      'location': 'Bà Rịa - Vũng Tàu',
      'duration': '3 ngày 2 đêm',
      'price': '4.200.000đ',
      'rating': 4.8,
      'image':
          'https://tse3.mm.bing.net/th/id/OIP.FeBgnKKCkDlj58wkZBOmXgHaED?pid=Api&P=0&h=180',
      'departureDate': '30/11/2025',
      'transport': 'Máy bay',
    },
  ];

  List<Map<String, dynamic>> displayedTours = [];

  @override
  void initState() {
    super.initState();
    displayedTours = List.from(tours);
  }

  void filterTours(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        displayedTours = List.from(tours);
      } else {
        displayedTours = tours
            .where((tour) =>
                tour['name'].toLowerCase().contains(keyword.toLowerCase()) ||
                tour['location'].toLowerCase().contains(keyword.toLowerCase()))
            .toList();
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
      title: 'Tour du lịch',
      currentIndex: _selectedIndex,
      showHotPlaces: false,
      onSearchChanged: filterTours,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Tour du lịch nổi bật',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: displayedTours.length,
            itemBuilder: (context, index) {
              final tour = displayedTours[index];
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
                        tour['image'],
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
                              tour['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text('Địa điểm: ${tour['location']}'),
                            Text('Thời gian: ${tour['duration']}'),
                            Text('Khởi hành: ${tour['departureDate']}'),
                            Text('Phương tiện: ${tour['transport']}'),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.orange, size: 16),
                                const SizedBox(width: 3),
                                Text('${tour['rating']}'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Giá: ${tour['price']}',
                              style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
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
