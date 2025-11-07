// File: lib/screens/privacy_policy_page.dart

import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chính sách & Quyền riêng tư'),
        backgroundColor: Colors.orange, // Đồng bộ màu cam
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // --- Tiêu đề Chính ---
            Text(
              'Chính sách Quyền riêng tư của Ứng dụng Mobile_GK',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 10),
            Text(
              'Cập nhật lần cuối: 08/11/2025',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Divider(height: 30, thickness: 1),

            // --- Phần 1: Loại dữ liệu thu thập ---
            _SectionHeader(title: '1. Thông tin chúng tôi thu thập'),
            _SectionContent(
              content: 'Chúng tôi thu thập thông tin bạn cung cấp trực tiếp cho chúng tôi khi bạn đăng ký tài khoản, sử dụng các dịch vụ của chúng tôi, hoặc liên hệ với bộ phận hỗ trợ.',
            ),
            _SubSection(
              title: '1.1. Dữ liệu cá nhân',
              content: 'Bao gồm tên, địa chỉ email, số điện thoại và thông tin thanh toán (nếu có).',
            ),
            _SubSection(
              title: '1.2. Dữ liệu sử dụng',
              content: 'Bao gồm thông tin về cách bạn truy cập và sử dụng Ứng dụng, như các trang đã xem, thời gian sử dụng và lỗi ứng dụng.',
            ),
            SizedBox(height: 20),

            // --- Phần 2: Cách chúng tôi sử dụng dữ liệu ---
            _SectionHeader(title: '2. Mục đích sử dụng thông tin'),
            _SectionContent(
              content: 'Chúng tôi sử dụng dữ liệu thu thập được để:',
            ),
            _BulletPoint(content: 'Cung cấp, vận hành và duy trì dịch vụ của chúng tôi.'),
            _BulletPoint(content: 'Cá nhân hóa trải nghiệm người dùng và cải thiện dịch vụ.'),
            _BulletPoint(content: 'Thực hiện và quản lý các giao dịch đặt chỗ.'),
            _BulletPoint(content: 'Gửi thông báo và thông tin quảng cáo (nếu bạn đồng ý).'),
            SizedBox(height: 20),

            // --- Phần 3: Bảo mật dữ liệu ---
            _SectionHeader(title: '3. Bảo mật dữ liệu'),
            _SectionContent(
              content: 'Chúng tôi cam kết bảo vệ dữ liệu cá nhân của bạn. Chúng tôi áp dụng các biện pháp bảo mật tiêu chuẩn ngành để ngăn chặn truy cập, sử dụng hoặc tiết lộ trái phép.',
            ),
            SizedBox(height: 20),

            // --- Phần 4: Quyền của người dùng ---
            _SectionHeader(title: '4. Quyền của bạn'),
            _SectionContent(
              content: 'Bạn có quyền truy cập, chỉnh sửa hoặc yêu cầu xóa dữ liệu cá nhân của mình bất cứ lúc nào thông qua phần Cài đặt tài khoản hoặc liên hệ trực tiếp với chúng tôi.',
            ),
            SizedBox(height: 40),

            // --- Liên hệ ---
            Text(
              'Liên hệ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _SectionContent(
              content: 'Nếu có bất kỳ câu hỏi nào về Chính sách này, vui lòng liên hệ qua email: support@mobilegk.com',
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET HỖ TRỢ ĐỂ CODE GỌN HƠN ---

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
    );
  }
}

class _SubSection extends StatelessWidget {
  final String title;
  final String content;
  const _SubSection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: TextStyle(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

class _SectionContent extends StatelessWidget {
  final String content;
  const _SectionContent({required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(fontSize: 15, color: Colors.grey[800]),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String content;
  const _BulletPoint({required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 15, color: Colors.orange)),
          Expanded(
            child: Text(
              content,
              style: TextStyle(fontSize: 15, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}