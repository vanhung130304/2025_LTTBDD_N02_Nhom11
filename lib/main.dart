import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'screens/thamquan_page.dart';
import 'screens/dichuyen_page.dart';
import 'screens/xekhach_page.dart';
import 'screens/chuyen_bay_page.dart';
import 'screens/luu_tru_page.dart';
import 'screens/tauthuy_page.dart';
import 'screens/tour_page.dart';
import 'screens/danh_muc_page.dart';
import 'auth/profile_page.dart';
import 'screens/place_detail_page.dart';
import 'screens/review_page.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatefulWidget {
  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  Locale _locale = const Locale('vi');

  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('languageCode') ?? 'vi';
    setState(() {
      _locale = Locale(savedLang);
    });
  }

  void setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Roboto'),
      locale: _locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: HomeScreen(onLocaleChange: setLocale),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomeScreen(onLocaleChange: setLocale),
        '/dichuyen': (context) => DiChuyenPage(),
        '/xekhach': (context) => XeKhachPage(),
        '/chuyenbay': (context) => ChuyenBayPage(),
        '/tauthuy': (context) => TauThuyPage(),
        '/tour': (context) => const TourPage(),
        '/taikhoan': (context) => ProfilePage(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const HomeScreen({super.key, required this.onLocaleChange});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> favoritePlaces = [];
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> hotPlaces = [
    {
      'name': 'Phú Quốc',
      'image': 'https://tse2.mm.bing.net/th/id/OIP.T_Mtex10QU9Dvr-4HqnmwwHaFj?pid=Api&P=0&h=220',
      'price': '1.200.000đ',
      'rating': 4.8,
      'description': 'Phú Quốc – hòn đảo ngọc tuyệt đẹp của Việt Nam...',
    },
    {
      'name': 'Đà Lạt',
      'image': 'https://tse1.mm.bing.net/th/id/OIP.K_GeZEn0BucG7aW0R2H3fgHaE7?pid=Api&P=0&h=220',
      'price': '950.000đ',
      'rating': 4.6,
      'description': 'Đà Lạt – thành phố ngàn hoa, có khí hậu mát mẻ...',
    },
    {
      'name': 'Hạ Long',
      'image': 'https://images.unsplash.com/photo-1551334787-21e6bd3ab135?auto=format&fit=crop&w=800&q=80',
      'price': '1.500.000đ',
      'rating': 4.9,
      'description': 'Vịnh Hạ Long – di sản thiên nhiên thế giới...',
    },
    {
      'name': 'Hội An',
      'image': 'https://tse3.mm.bing.net/th/id/OIP.dzA_Yfyig-awC61M2d4-gAHaEo?pid=Api&P=0&h=220',
      'price': '1.000.000đ',
      'rating': 4.7,
      'description': 'Phố cổ Hội An – nơi lưu giữ vẻ đẹp cổ kính...',
    },
    {
      'name': 'Sapa',
      'image': 'https://images.unsplash.com/photo-1549880338-65ddcdfd017b?auto=format&fit=crop&w=800&q=80',
      'price': '1.300.000đ',
      'rating': 4.5,
      'description': 'Sapa – vùng núi phía Bắc Việt Nam, nổi tiếng với ruộng bậc thang...',
    },
    {
      'name': 'Ninh Bình',
      'image': 'https://tse3.mm.bing.net/th/id/OIP.exvYmYNk5tYHPkts9PPrZgHaEK?pid=Api&P=0&h=220',
      'price': '850.000đ',
      'rating': 4.4,
      'description': 'Ninh Bình – nơi giao thoa giữa thiên nhiên và văn hóa...',
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedNames = prefs.getStringList('favorites') ?? [];
    setState(() {
      favoritePlaces = hotPlaces.where((p) => savedNames.contains(p['name'])).toList();
    });
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'favorites',
      favoritePlaces.map((p) => p['name'].toString()).toList(),
    );
  }

  void _onItemTapped(int index) async {
    switch (index) {
      case 0:
        setState(() => _selectedIndex = 0);
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ReviewPage()),
        );
        break;
      case 2:
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DanhMucPage(favoritePlaces: favoritePlaces),
          ),
        );
        _loadFavorites();
        break;
      case 3:
        Navigator.pushNamed(context, '/taikhoan');
        break;
    }
  }

  void _changeLanguage(String langCode) {
    Locale newLocale;
    switch (langCode) {
      case 'vi':
        newLocale = const Locale('vi');
        break;
      case 'en':
        newLocale = const Locale('en');
        break;
      case 'zh':
        newLocale = const Locale('zh');
        break;
      default:
        newLocale = const Locale('vi');
    }
    widget.onLocaleChange(newLocale);
  }

  @override
  Widget build(BuildContext context) {
    final filteredPlaces = hotPlaces.where((place) {
      final name = place['name'].toString().toLowerCase();
      final desc = place['description'].toString().toLowerCase();
      return name.contains(_searchQuery) || desc.contains(_searchQuery);
    }).toList();

    final List<String> bannerImages = [
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1000&q=80',
      'https://images.unsplash.com/photo-1518684079-3c830dcef090?auto=format&fit=crop&w=1000&q=80',
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=1000&q=80',
      'https://tse1.mm.bing.net/th/id/OIP.kNZyRFXEOhmeCE-aHRHXEgHaEl?pid=Api&P=0&h=220',
      'https://tse3.mm.bing.net/th/id/OIP.4yLIzDVOG1EBZBVwjqscbwHaEK?pid=Api&P=0&h=220',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Container(
          height: 40,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.toLowerCase();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: S.of(context).searchHint,
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
              ),
              PopupMenuButton<String>(
                icon: const Icon(Icons.language, color: Colors.orange),
                onSelected: _changeLanguage,
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 'vi', child: Text('Tiếng Việt')),
                  PopupMenuItem(value: 'en', child: Text('English')),
                  PopupMenuItem(value: 'zh', child: Text('中文')),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).discover, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                  label: Text(S.of(context).newest, style: const TextStyle(color: Colors.black)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(S.of(context).updateLocation, style: const TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            CarouselSlider(
              items: bannerImages.map((url) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.network(url, fit: BoxFit.cover),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: false,
                viewportFraction: 1.0,
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
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ThamQuanPage())),
                  child: buildCategoryIcon(Icons.airplanemode_active, S.of(context).tour),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DiChuyenPage())),
                  child: buildCategoryIcon(Icons.directions_car, S.of(context).transport),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LuuTruPage())),
                  child: buildCategoryIcon(Icons.hotel, S.of(context).hotel),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TourPage())),
                  child: buildCategoryIcon(Icons.tour, S.of(context).tour),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(S.of(context).popular, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: filteredPlaces.length,
              itemBuilder: (context, index) {
                final place = filteredPlaces[index];
                bool isFavorite = favoritePlaces.any((p) => p['name'] == place['name']);

                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 3,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                        child: Image.network(place['image'], width: 130, height: 110, fit: BoxFit.cover),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(place['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.orange, size: 16),
                                  const SizedBox(width: 3),
                                  Text('${place['rating']}'),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text('${S.of(context).price}: ${place['price']}', style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                                    onPressed: () async {
                                      setState(() {
                                        if (isFavorite) {
                                          favoritePlaces.removeWhere((p) => p['name'] == place['name']);
                                        } else {
                                          favoritePlaces.add(place);
                                        }
                                      });
                                      await _saveFavorites();
                                    },
                                  ),
                                  ElevatedButton(
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => PlaceDetailPage(place: place)),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      minimumSize: Size.zero,
                                    ),
                                    child: Text(S.of(context).details),
                                  ),
                                ],
                              )
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.explore), label: S.of(context).explore),
          BottomNavigationBarItem(icon: const Icon(Icons.rate_review), label: S.of(context).review),
          BottomNavigationBarItem(icon: const Icon(Icons.grid_view), label: S.of(context).category),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: S.of(context).account),
        ],
      ),
    );
  }

  Widget buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(12),
          child: Icon(icon, color: Colors.orange, size: 30),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
