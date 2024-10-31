import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController inputController = TextEditingController();

  String reversedString = '';
  String formattedPhone = '';
  bool isPalindrome = false;
  bool containsFlutter = false;
  String? phoneError;
  String? passwordError;
  String? confirmPasswordError;
  bool success = false;

  void validate() {
    setState(() {
      phoneError = null;
      passwordError = null;
      confirmPasswordError = null;
      success = false; // Reset success
      formattedPhone = ''; // Reset formattedPhone

      // Check phoneNumber
      String phone = phoneController.text;
      if (phone.length != 10 || !phone.startsWith('0')) {
        phoneError = 'Số điện thoại không hợp lệ.';
      } else {
        formattedPhone = '+84${phone.substring(1)}'; // Cập nhật biến formattedPhone
      }

      // Check password
      String password = passwordController.text;
      if (password.length < 6 || password.length > 20 || password.trim().isEmpty
          || !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)
          || !RegExp(r'[A-Z]').hasMatch(password)
          || !RegExp(r'\d').hasMatch(password)) {
        passwordError = 'Mật khẩu không hợp lệ. Cần có ít nhất 6 ký tự, 1 chữ hoa, 1 số và 1 ký tự đặc biệt.';
      }

      // Check confirmPassword
      String confirmPassword = confirmPasswordController.text;
      if (password != confirmPassword) {
        confirmPasswordError = 'Mật khẩu không trùng khớp.';
      }

      // Success
      if (phoneError == null && passwordError == null && confirmPasswordError == null) {
        success = true;
      }
    });
  }

  void checkString() {
    String input = inputController.text;

    // Đảo ngược chuỗi
    reversedString = input.split('').reversed.join();

    // Kiểm tra chuỗi đối xứng
    isPalindrome = input == reversedString;

    // Kiểm tra chuỗi có chứa "Flutter"
    containsFlutter = input.contains('Flutter');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bài 1:', style: TextStyle(
                    fontSize: 40, fontWeight: FontWeight.w500, color: Colors.red
                )),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Số Điện Thoại',
                    errorText: phoneError,
                  ),
                  keyboardType: TextInputType.phone,
                ),
                if (formattedPhone.isNotEmpty) // hiển thị số đầu +84 nếu đúng định dạng
                  Text('$formattedPhone'),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Mật Khẩu',
                    errorText: passwordError,
                  ),
                  obscureText: true,
                ),
                TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Xác Nhận Mật Khẩu',
                    errorText: confirmPasswordError,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: validate,
                      child: Text('Gửi'),
                    ),
                    SizedBox(width: 40),
                    if (success) // Hiển thị thông báo khi thành công
                      Text('Thông tin hợp lệ', style: TextStyle(color: Colors.green)),
                  ],
                ),
                SizedBox(height: 20),
                Text('Bài 2:', style: TextStyle(
                    fontSize: 40, fontWeight: FontWeight.w500, color: Colors.red
                )),
                SizedBox(height: 10),
                TextField(
                  controller: inputController,
                  decoration: InputDecoration(
                    labelText: 'Nhập chuỗi',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: checkString,
                  child: Text('Kiểm tra'),
                ),
                SizedBox(height: 20),
                Text('Chuỗi đảo ngược: $reversedString'),
                Text('Chuỗi đối xứng: $isPalindrome'),
                Text('Chứa "Flutter": $containsFlutter'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
