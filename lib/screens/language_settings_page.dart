// File: lib/screens/language_settings_page.dart

import 'package:flutter/material.dart';

// Định nghĩa một Model đơn giản cho Ngôn ngữ
class Language {
  final String code; // Ví dụ: 'vi', 'en'
  final String name; // Ví dụ: 'Tiếng Việt'
  final String flagEmoji; // Ví dụ: 🇻🇳, 🇺🇸

  const Language({
    required this.code,
    required this.name,
    required this.flagEmoji,
  });
}

class LanguageSettingsPage extends StatefulWidget {
  const LanguageSettingsPage({super.key});

  @override
  State<LanguageSettingsPage> createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  // Dữ liệu giả định về các ngôn ngữ được hỗ trợ
  final List<Language> _supportedLanguages = const [
    Language(code: 'vi', name: 'Tiếng Việt', flagEmoji: '🇻🇳'),
    Language(code: 'en', name: 'English', flagEmoji: '🇺🇸'),
    Language(code: 'ko', name: '한국어 (Korean)', flagEmoji: '🇰🇷'),
    Language(code: 'zh', name: '中文 (Chinese)', flagEmoji: '🇨🇳'),
  ];

  // Giả định ngôn ngữ đang được chọn
  String _selectedLanguageCode = 'vi'; // Mặc định là Tiếng Việt

  // Xử lý khi người dùng chọn ngôn ngữ mới
  void _changeLanguage(String newCode) {
    setState(() {
      _selectedLanguageCode = newCode;
    });

    // TODO: 1. Lưu code ngôn ngữ mới vào SharedPreferences/Storage.
    // TODO: 2. Cập nhật Locale của ứng dụng (sử dụng thư viện localization).
    
    // Hiển thị thông báo
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Đã chuyển sang ngôn ngữ ${_supportedLanguages.firstWhere((lang) => lang.code == newCode).name}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt Ngôn ngữ'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Chọn ngôn ngữ hiển thị cho ứng dụng của bạn.',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            
            // Danh sách các Ngôn ngữ
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), // Vô hiệu hóa cuộn cho ListView lồng ghép
              itemCount: _supportedLanguages.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final language = _supportedLanguages[index];
                final isSelected = language.code == _selectedLanguageCode;
                
                return ListTile(
                  leading: Text(
                    language.flagEmoji,
                    style: const TextStyle(fontSize: 28), // Sử dụng Emoji cờ làm biểu tượng
                  ),
                  title: Text(
                    language.name,
                    style: TextStyle(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.orange.shade800 : Colors.black87,
                    ),
                  ),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle, color: Colors.orange) // Icon đã chọn
                      : const Icon(Icons.circle_outlined, color: Colors.grey), // Icon chưa chọn
                  onTap: () => _changeLanguage(language.code),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}