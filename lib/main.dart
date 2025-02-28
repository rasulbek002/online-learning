import 'package:flutter/material.dart';
import 'package:s/ui/main_button.dart';
import 'ui/dialog.dart';
import 'pages/sign_up_second_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Root widget
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('My Home Page'),
        ),
        body: Center(
          child: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    const DialogWidget(
                      text: 'Салам!',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 44),
                      child: Image.asset(
                        'assets/images/hi.png',
                        width: 200,
                        height: 243,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        'Өнүгүү',
                        style:
                            TextStyle(color: Color(0xFF6949FF), fontSize: 48),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MainButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectLanguage()));
                        },
                        buttonText: 'Баштоо',
                        bgColor: 0xFF6949FF,
                        textColor: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
