// ignore_for_file: deprecated_member_use
import 'package:aprender_plus_manager/screens/home_menus.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _pinController = PinInputController();
  final String pin = '3245';
  
  bool get preencheu => _pinController.text.trim().length == 4;
  
  bool? correta; 

  void handlePin() {
    if (!preencheu) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preencha todos os campos'),
        ),
      );
    } 

    final inputPin = _pinController.text.trim();

    if (inputPin == pin) {
      setState(() {
        correta = true;
      });
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeMenus(),
        ),
      );
    } else if (inputPin.isEmpty) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pin vazio'),
        ),
      );
      _pinController.clear();
      reset();
    }
    else {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pin incorreto'),
        ),
      );
      _pinController.clear();
      reset();
    }
  }

  void reset() async {
    setState(() {
      correta = false;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      correta = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color borderStyleColor = correta == false 
        ? Colors.red.withOpacity(0.4) 
        : Colors.grey.withOpacity(0.4);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xFF101010),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'A+',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(0xFFFCFCFC),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Aprender+',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 55),
              Text(
                'Digite seu PIN de acesso',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              MaterialPinField(
                keyboardType: TextInputType.numberWithOptions(),
                pinController: _pinController,
                length: 4,
                onChanged: (value) {
                  if (correta != null) {
                    setState(() {
                      correta = null; 
                    });
                  }
                },
                onCompleted: (value) {},
                theme: MaterialPinTheme(
                  shape: MaterialPinShape.outlined,
                  cellSize: Size(56, 64),
                  borderRadius: BorderRadius.circular(8),
                  fillColor: Colors.white,
                  borderColor: borderStyleColor,
                  animateCursor: false,
                  filledBorderColor: borderStyleColor,
                  filledFillColor: Colors.white,
                  focusedBorderColor: borderStyleColor,
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: 340,
                height: 40,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: handlePin,
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}