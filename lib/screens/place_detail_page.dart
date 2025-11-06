import 'package:flutter/material.dart';
import '../screens/thamquan_page.dart';
import '../screens/dichuyen_page.dart';
import '../screens/xekhach_page.dart';
import '../screens/chuyen_bay_page.dart';
import '../screens/luu_tru_page.dart';
import '../screens/tour_page.dart';
import '../auth/profile_page.dart';

class PlaceDetailPage extends StatefulWidget {
  final Map<String, dynamic> place;
  const PlaceDetailPage({super.key, required this.place});

  @override
  State<PlaceDetailPage> createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  final TextEditingController _reviewController = TextEditingController();
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _comments = [];

  String getInitial(String name) {
    return name.isNotEmpty ? name.trim()[0].toUpperCase() : '?';
  }

  void _addComment(String author) {
    final text = _reviewController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _comments.add({
          'author': author,
          'content': text,
          'replies': [],
        });
      });
      _reviewController.clear();
    }
  }

  void _addReply(int commentIndex, String author, String replyText) {
    if (replyText.trim().isEmpty) return;
    setState(() {
      _comments[commentIndex]['replies'].add({
        'author': author,
        'content': replyText,
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0: // Khám phá
        Navigator.pushNamed(context, '/home');
        break;
      case 1: // Điểm đến
        Navigator.pushNamed(context, '/dichuyen');
        break;
      case 2: // Danh mục
        Navigator.pushNamed(context, '/xekhach');
        break;
      case 3: // Tài khoản
        Navigator.pushNamed(context, '/taikhoan');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final place = widget.place;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(place['name']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                place['image'],
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              place['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text('${place['rating']}'),
                const SizedBox(width: 10),
                Text('Giá: ${place['price']}',
                    style: const TextStyle(color: Colors.orange)),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              place['description'] ?? '',
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 25),
            const Text(
              "Nhận xét của bạn",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _reviewController,
              decoration: InputDecoration(
                hintText: "Viết nhận xét...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                suffixIcon: IconButton(
                  onPressed: () => _addComment('Văn Hưng'), // giả lập user hiện tại
                  icon: const Icon(Icons.send, color: Colors.orange),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ..._comments.asMap().entries.map((entry) {
              int idx = entry.key;
              var comment = entry.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade200,
                      child: Text(
                        getInitial(comment['author']),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(comment['author'],
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(comment['content']),
                    trailing: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            final replyController = TextEditingController();
                            return AlertDialog(
                              title: const Text('Reply'),
                              content: TextField(
                                controller: replyController,
                                decoration: const InputDecoration(
                                  hintText: 'Viết trả lời...',
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: const Text('Hủy')),
                                TextButton(
                                    onPressed: () {
                                      _addReply(
                                          idx, 'Văn Hưng', replyController.text);
                                      Navigator.of(ctx).pop();
                                    },
                                    child: const Text('Gửi')),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('Reply',
                          style: TextStyle(color: Colors.blue, fontSize: 12)),
                    ),
                  ),
                  // Reply list
                  if (comment['replies'] != null &&
                      comment['replies'].isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        children: List.generate(
                            comment['replies'].length, (i) {
                          final reply = comment['replies'][i];
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey.shade400,
                              child: Text(
                                getInitial(reply['author']),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                            title: Text(reply['author'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12)),
                            subtitle: Text(reply['content'],
                                style: const TextStyle(fontSize: 12)),
                          );
                        }),
                      ),
                    ),
                ],
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Khám phá'),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Điểm đến'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Danh mục'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }
}
