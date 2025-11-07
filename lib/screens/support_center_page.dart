// File: lib/screens/support_center_page.dart

import 'package:flutter/material.dart';

class SupportCenterPage extends StatelessWidget {
  const SupportCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trung tâm hỗ trợ'),
        backgroundColor: Colors.orange, // Đồng bộ màu cam
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // --- Phần 1: Tiêu đề và Mô tả ---
            const Text(
              'Chúng tôi sẵn lòng giúp đỡ bạn!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Tìm câu trả lời nhanh trong mục Câu hỏi thường gặp hoặc liên hệ với đội ngũ hỗ trợ của chúng tôi.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 25),

            // --- Phần 2: Các Tùy chọn Liên hệ Trực tiếp ---
            _buildContactOptions(context),
            const SizedBox(height: 25),

            // --- Phần 3: Câu hỏi Thường gặp (FAQs) ---
            const Text(
              'Câu hỏi thường gặp (FAQs)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(color: Colors.orange),
            _buildFAQSection(),
          ],
        ),
      ),
    );
  }

  // Widget chứa các tùy chọn liên hệ
  Widget _buildContactOptions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildContactCard(
          context,
          icon: Icons.chat_bubble_outline,
          title: 'Trò chuyện',
          subtitle: 'Phản hồi trong 1h',
          onTap: () => print('Mở Live Chat'),
        ),
        _buildContactCard(
          context,
          icon: Icons.email_outlined,
          title: 'Email',
          subtitle: 'Phản hồi trong 24h',
          onTap: () => print('Mở ứng dụng Email'),
        ),
        _buildContactCard(
          context,
          icon: Icons.phone_outlined,
          title: 'Gọi điện',
          subtitle: 'Giờ hành chính',
          onTap: () => print('Thực hiện cuộc gọi'),
        ),
      ],
    );
  }

  // Widget hỗ trợ tạo thẻ liên hệ
  Widget _buildContactCard(BuildContext context, {required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Icon(icon, size: 30, color: Colors.orange),
                const SizedBox(height: 8),
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(fontSize: 10, color: Colors.grey[600]), textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget chứa danh sách FAQs
  Widget _buildFAQSection() {
    // Dữ liệu giả định về FAQs
    final List<Map<String, String>> faqs = const [
      {'question': 'Làm thế nào để thay đổi mật khẩu?', 'answer': 'Vào Tài khoản > Cài đặt tài khoản > Thay đổi mật khẩu.'},
      {'question': 'Tôi có thể hủy chuyến đi đã đặt không?', 'answer': 'Bạn có thể hủy chuyến đi trong vòng 24 giờ trước ngày khởi hành mà không mất phí.'},
      {'question': 'Tại sao tôi không nhận được email xác nhận?', 'answer': 'Vui lòng kiểm tra thư mục Spam/Thư rác của bạn. Nếu vẫn không thấy, hãy liên hệ với chúng tôi.'},
    ];

    return Column(
      children: faqs.map((faq) {
        // Sử dụng ExpansionTile để tạo hiệu ứng mở rộng/thu gọn cho FAQ
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 1,
          child: ExpansionTile(
            iconColor: Colors.orange,
            collapsedIconColor: Colors.black54,
            title: Text(faq['question']!, style: const TextStyle(fontWeight: FontWeight.w500)),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    faq['answer']!,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}