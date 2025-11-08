import 'package:flutter/material.dart';
import '../widgets/base_page_scaffold.dart';
import '../generated/l10n.dart';

class XeKhachPage extends StatefulWidget {
  XeKhachPage({super.key});

  @override
  State<XeKhachPage> createState() => _XeKhachPageState();
}

class _XeKhachPageState extends State<XeKhachPage> {
  final List<Map<String, dynamic>> busOptions = [
    {
      'name': 'Xe khách A',
      'route': 'Hà Nội - Hải Phòng',
      'price': '200.000đ',
      'rating': 4.5,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách B',
      'route': 'Hà Nội - Nam Định',
      'price': '180.000đ',
      'rating': 4.3,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách C',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách D',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách E',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách F',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách G',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách H',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách I',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách K',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách L',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
    {
      'name': 'Xe khách M',
      'route': 'Hà Nội - Thái Bình',
      'price': '150.000đ',
      'rating': 4.2,
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
    },
  ];

  List<Map<String, dynamic>> displayedBusOptions = [];

  @override
  void initState() {
    super.initState();
    displayedBusOptions = List.from(busOptions);
  }

  void _searchBus(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedBusOptions = List.from(busOptions);
      } else {
        displayedBusOptions = busOptions
            .where((bus) =>
                bus['name'].toLowerCase().contains(query.toLowerCase()) ||
                bus['route'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePageScaffold(
      title: S.of(context).busTitle,
      currentIndex: 1,
      onSearchChanged: _searchBus,
      showHotPlaces: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              S.of(context).recommendedBuses,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: displayedBusOptions.length,
            itemBuilder: (context, index) {
              final bus = displayedBusOptions[index];
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
                        bus['image'],
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
                              bus['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text('${S.of(context).route}: ${bus['route']}'),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange.shade400,
                                  size: 16,
                                ),
                                const SizedBox(width: 3),
                                Text('${bus['rating']}'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${S.of(context).price}: ${bus['price']}',
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
                                child: Text(S.of(context).viewDetails),
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
