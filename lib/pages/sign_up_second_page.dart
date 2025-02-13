import 'package:flutter/material.dart';
import 'package:s/ui/main_button.dart';
import 'package:s/ui/dialog.dart';
import 'package:s/ui/progress_bar.dart';
import 'package:s/ui/select_item.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  ProgressBarAppBar(
                      totalSteps: 5,
                      currentStep: 1,
                      onBackPressed: () {
                        Navigator.pop(context);
                      }),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/which-language.png',
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                      const DialogWidget(
                        text: 'Кайсы тилди үйрөнөсүз? ',
                      ),
                    ],
                  ),
                  const SizedBox(height: 54.0),
                  const SelectItem(
                      text: 'English',
                      showIcon: true,
                      image: 'assets/images/english.png'),
                  const SizedBox(height: 20.0),
                  const SelectItem(
                      text: 'Mandarin',
                      showIcon: true,
                      image: 'assets/images/english.png'),
                  const SizedBox(height: 20.0),
                  const SelectItem(
                      text: 'Spanish',
                      showIcon: true,
                      image: 'assets/images/english.png'),
                  const SizedBox(height: 20.0),
                  const SelectItem(
                      text: 'French',
                      showIcon: true,
                      image: 'assets/images/english.png'),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MainButton(
                      onPressed: () {},
                      buttonText: 'Улантуу',
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
    );
  }
}
