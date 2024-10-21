import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _addNumber(String number) {
    setState(() {
      _controller.text += number;
    });
  }

  void _clear() {
    setState(() {
      _controller.text = '';
      _result = '';
    });
  }

  void _delete() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _controller.text = _controller.text.substring(0, _controller.text.length - 1);
      }
    });
  }

  void _calculate() {
    String textInTextField = _controller.text;
    print('Input: $textInTextField');
    List<String> parts = textInTextField.split(RegExp(r'(?<=[\+\-\x\:\~/\%])|(?=[\+\-\x\:\~/\%])'));
    for (int i = 1; i < parts.length; i++) {
      if (parts[i - 1] == '~' && parts[i] == '/') {
        parts[i - 1] = '~/';
        parts.removeAt(i);
        i--;
      }
    }
    if (parts.length == 3) {
      double num1 = double.tryParse(parts[0]) ?? 0;
      String operator = parts[1]; // Lấy toán tử
      double num2 = double.tryParse(parts[2]) ?? 0;
      if (operator == ':' && num2 == 0) {
        setState(() {
          _result = 'Không thể chia cho 0!';
        });
        return;
      }
      double result = _performOperation(num1, operator, num2);
      setState(() {
        // Kiểm tra xem kết quả có phải là số nguyên không
        _result = result % 1 == 0 ? result.toInt().toString() : result.toString();
      });
    } else {
      setState(() {
        _result = 'Biểu thức không hợp lệ!';
      });
    }
  }

  double _performOperation(double num1, String operator, double num2) {
    switch (operator) {
      case '%':
        return num1 % num2;
      case '~/':
        if (num2 == 0) throw Exception('Chia cho 0!');
        return (num1 ~/ num2).toDouble();
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case 'x':
        return num1 * num2;
      case ':':
        if (num2 == 0) throw Exception('Chia cho 0!');
        return num1 / num2;
      default:
        throw Exception('Phép toán không hợp lệ!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50, left: 0, right: 0, bottom: 0,
            child: Image.asset('assets/BackGround/may-tinh-bo-tui-casio-fx-570vn-plus-avar.jpg', fit: BoxFit.cover,),
          ),
          Positioned(
            width: 265, height: 110,
            top: 198, left: 60,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_result),
                      SizedBox(width: 10,)
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              width: 275, height: 180,
              top: 566, left: 58,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Button('7', () => _addNumber('7')),
                          Button('8', () => _addNumber('8')),
                          Button('9', () => _addNumber('9')),
                          Button('Del', _delete),
                          Button('AC', _clear),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Button('4', () => _addNumber('4')),
                          Button('5', () => _addNumber('5')),
                          Button('6', () => _addNumber('6')),
                          Button('x', () => _addNumber('x')),
                          Button(':', () => _addNumber(':')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Button('1', () => _addNumber('1')),
                          Button('2', () => _addNumber('2')),
                          Button('3', () => _addNumber('3')),
                          Button('+', () => _addNumber('+')),
                          Button('-', () => _addNumber('-')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Button('0', () => _addNumber('0')),
                          Button('.', () => _addNumber('.')),
                          Button('~/', () => _addNumber('~/')),
                          Button('%', () => _addNumber('%')),
                          Button('=', _calculate),
                        ],
                      )
                    ],
                  )
              )
          )
        ],
      ),
    );
  }
}

Widget Button(String title, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      width: 40, height: 40,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(title, style: TextStyle(color: Colors.white)),
      ),
    ),
  );
}
