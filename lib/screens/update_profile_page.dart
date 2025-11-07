// File: lib/screens/update_profile_page.dart

import 'package:flutter/material.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();

  // Dữ liệu giả định ban đầu (thường được load từ API)
  String _fullName = 'Nguyễn Văn A';
  String _phone = '090xxxxxx99';
  String _email = 'nguyenvana@example.com';
  String _gender = 'Nam'; // Giá trị có thể là 'Nam', 'Nữ', 'Khác'
  DateTime _dob = DateTime(1998, 11, 25); // Ngày sinh

  // Controllers cho TextFormField
  late TextEditingController _fullNameController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: _fullName);
    _phoneController = TextEditingController(text: _phone);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // Hàm chọn ngày sinh
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dob,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange, // Màu cam cho Header
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _dob) {
      setState(() {
        _dob = picked;
      });
    }
  }

  // Xử lý khi nhấn nút Cập nhật
  void _handleUpdateProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      // Cập nhật giá trị từ Controller vào biến state
      _fullName = _fullNameController.text;
      _phone = _phoneController.text;

      // TODO: 1. Gửi dữ liệu _fullName, _phone, _dob, _gender lên API.

      // Hiển thị thông báo thành công
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cập nhật thông tin cá nhân thành công!')),
      );

      // Có thể quay lại trang trước
      // Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cập nhật Thông tin Cá nhân'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // --- 1. Phần Ảnh đại diện ---
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.orange.shade100,
                      // Nếu có ảnh, dùng NetworkImage hoặc FileImage
                      child: const Icon(Icons.person, size: 70, color: Colors.orange),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Xử lý logic chọn/chụp ảnh
                          print('Chọn ảnh đại diện mới');
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.orange,
                          child: const Icon(Icons.edit, color: Colors.white, size: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // --- 2. Tên đầy đủ ---
              _buildTextField(
                controller: _fullNameController,
                label: 'Tên đầy đủ',
                icon: Icons.person_outline,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên đầy đủ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              // --- 3. Email (Chỉ hiển thị, không cho phép sửa trực tiếp) ---
              _buildTextField(
                controller: TextEditingController(text: _email),
                label: 'Email',
                icon: Icons.email_outlined,
                readOnly: true, // Không cho phép sửa email
                hint: 'Email không thể thay đổi',
              ),
              const SizedBox(height: 20),

              // --- 4. Số điện thoại ---
              _buildTextField(
                controller: _phoneController,
                label: 'Số điện thoại',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  // TODO: Thêm logic kiểm tra định dạng SĐT
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // --- 5. Ngày sinh ---
              _buildDateOfBirthField(context),
              const SizedBox(height: 20),

              // --- 6. Giới tính ---
              _buildGenderField(),
              const SizedBox(height: 40),

              // Nút Cập nhật
              ElevatedButton(
                onPressed: _handleUpdateProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                ),
                child: const Text(
                  'Cập nhật Thông tin',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget hỗ trợ tạo trường nhập liệu chung
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    FormFieldValidator<String>? validator,
    bool readOnly = false,
    String? hint,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.orange, width: 2),
        ),
        prefixIcon: Icon(icon, color: Colors.orange),
      ),
    );
  }

  // Widget hỗ trợ tạo trường Ngày sinh
  Widget _buildDateOfBirthField(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Ngày sinh',
        hintText: '${_dob.day}/${_dob.month}/${_dob.year}',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.orange, width: 2),
        ),
        prefixIcon: const Icon(Icons.calendar_today, color: Colors.orange),
      ),
      onTap: () => _selectDate(context),
    );
  }

  // Widget hỗ trợ tạo trường Giới tính
  Widget _buildGenderField() {
    return DropdownButtonFormField<String>(
      value: _gender,
      decoration: InputDecoration(
        labelText: 'Giới tính',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.orange, width: 2),
        ),
        prefixIcon: const Icon(Icons.people_alt_outlined, color: Colors.orange),
      ),
      items: <String>['Nam', 'Nữ', 'Khác'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _gender = newValue;
          });
        }
      },
    );
  }
}