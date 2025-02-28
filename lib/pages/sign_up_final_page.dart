import 'package:flutter/material.dart';
import 'package:s/lessons/lesson.dart';
import 'package:s/ui/main_button.dart';
import '../ui/dialog.dart';

class SignUpFinalPage extends StatelessWidget {
  const SignUpFinalPage({super.key});

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
              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    const DialogWidget(
                      text: 'Соонун!',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 44),
                      child: Image.asset(
                        'assets/images/happy-logo.png',
                        width: 200,
                        height: 243,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Келиңиз эми аккаунт жасайлы. Каалаган убакытта окусаңызда биз баарын сактап турабыз, токтогон жерден кайра уланта аласыз',
                        style:
                        TextStyle(color: Color(0xFF616161), fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: MainButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                   LessonsPage()));
                        },
                        buttonText: 'Баштоо',
                        bgColor: 0xFF6949FF,
                        textColor: const Color(0xFFFFFFFF),
                      ),
                    )
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
