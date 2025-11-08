import 'package:flutter/material.dart';
import '../widgets/base_page_scaffold.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final List<Map<String, dynamic>> reviews = [
    {
      'user': 'Nguyen Van A',
      'avatar':
          'https://cdn-icons-png.flaticon.com/512/147/147144.png',
      'rating': 4,
      'comment': 'Xe rất tốt, tài xế thân thiện.',
      'image':
          'https://tse3.mm.bing.net/th/id/OVP.bqSKBCRPBYn81p2haXMtZwHgFo?pid=Api&h=360&w=480&c=7&rs=1',
      'likes': 3,
      'comments': [
        {'user': 'Nguyen Van B', 'reply': 'Đúng rồi, mình cũng thấy vậy!'}
      ],
    },
  ];

  final TextEditingController _commentController = TextEditingController();
  int _newRating = 5;
  String? _newImageUrl;

  void _addReview(String comment) {
    setState(() {
      reviews.insert(0, {
        'user': 'Bạn',
        'avatar': 'https://cdn-icons-png.flaticon.com/512/147/147144.png',
        'rating': _newRating,
        'comment': comment,
        'image': _newImageUrl,
        'likes': 0,
        'comments': [],
      });
      _commentController.clear();
      _newRating = 5;
      _newImageUrl = null;
    });
  }

  void _toggleLike(int index) {
    setState(() {
      reviews[index]['likes'] += 1;
    });
  }

  void _addReply(int index, String reply) {
    setState(() {
      reviews[index]['comments'].add({'user': 'Bạn', 'reply': reply});
    });
  }

  Widget _buildComment(Map<String, String> comment) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: RichText(
        text: TextSpan(
          text: '${comment['user']}: ',
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            TextSpan(
              text: comment['reply'],
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePageScaffold(
      title: 'Đánh giá',
      currentIndex: 1,
      showHotPlaces: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Form đăng bài
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.all(12),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _commentController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Viết đánh giá của bạn...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text('Số sao:'),
                        const SizedBox(width: 10),
                        DropdownButton<int>(
                          value: _newRating,
                          items: [1, 2, 3, 4, 5]
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text('$e'),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            if (val != null) {
                              setState(() {
                                _newRating = val;
                              });
                            }
                          },
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            onChanged: (val) => _newImageUrl = val,
                            decoration: InputDecoration(
                              hintText: 'URL ảnh (tùy chọn)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_commentController.text.isNotEmpty) {
                          _addReview(_commentController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Đăng đánh giá'),
                    ),
                  ],
                ),
              ),
            ),

            // Danh sách review
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(review['avatar']),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              review['user'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            Row(
                              children: List.generate(
                                  review['rating'],
                                  (i) => const Icon(Icons.star,
                                      size: 16, color: Colors.orange)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        if (review['image'] != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(review['image']),
                          ),
                        const SizedBox(height: 10),
                        Text(review['comment']),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.thumb_up),
                              onPressed: () => _toggleLike(index),
                            ),
                            Text('${review['likes']} Thích'),
                          ],
                        ),
                        if (review['comments'].isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              children: review['comments']
                                  .map<Widget>((c) => _buildComment(c))
                                  .toList(),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Trả lời...',
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onSubmitted: (val) {
                              if (val.isNotEmpty) _addReply(index, val);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
