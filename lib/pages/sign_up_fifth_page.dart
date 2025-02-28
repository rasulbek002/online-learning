import 'package:flutter/material.dart';
import 'package:s/pages/sign_up_final_page.dart';
import 'package:s/pages/sign_up_forth_page.dart';
import 'package:s/ui/main_button.dart';
import 'package:s/ui/dialog.dart';
import 'package:s/ui/progress_bar.dart';
import 'package:s/ui/select_item.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  _SelectTimeState createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  // Variable to track the selected item
  int? selectedItemIndex;

  // Function to handle item click and update selectedItemIndex
  void handleItemClick(int index) {
    setState(() {
      selectedItemIndex = index; // Set the clicked item index
    });
  }

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
                    currentStep: 4,
                    onBackPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/which-language.png',
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                      const DialogWidget(
                        text: 'Канча убакыт бөлө аласыз?',
                      ),
                    ],
                  ),
                  const SizedBox(height: 54.0),
                  SelectItem(
                    text: '5 мүнөт / күнүнө',
                    showIcon: false,
                    onClick: () {
                      // Handle onClick action
                      handleItemClick(0); // Update selected index to 0 (English)
                      print('English item clicked!');
                    },
                    backgroundColor: selectedItemIndex == 0 ? Colors.blue : (Colors.grey[200] ?? Colors.grey), // Change color if selected
                  ),
                  const SizedBox(height: 20.0),
                  SelectItem(
                    onClick: () {
                      // Handle onClick action
                      handleItemClick(1); // Update selected index to 1 (Mandarin)
                      print('Mandarin item clicked!');
                    },
                    text: '10 мүнөт / күнүнө',
                    showIcon: false,
                    backgroundColor: selectedItemIndex == 1 ? Colors.blue : (Colors.grey[200] ?? Colors.grey), // Change color if selected
                  ),
                  const SizedBox(height: 20.0),
                  SelectItem(
                    onClick: () {
                      // Handle onClick action
                      handleItemClick(2); // Update selected index to 2 (Spanish)
                      print('Spanish item clicked!');
                    },
                    text: '15 мүнөт / күнүнө',
                    showIcon: false,
                    backgroundColor: selectedItemIndex == 2 ? Colors.blue : (Colors.grey[200] ?? Colors.grey), // Change color if selected
                  ),
                  const SizedBox(height: 20.0),
                  SelectItem(
                    onClick: () {
                      // Handle onClick action
                      handleItemClick(3); // Update selected index to 3 (French)
                      print('French item clicked!');
                    },
                    text: '30 мүнөт / күнүнө',
                    showIcon: false,
                    backgroundColor: selectedItemIndex == 3 ? Colors.blue : (Colors.grey[200] ?? Colors.grey), // Change color if selected
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MainButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const SignUpFinalPage()));
                      },
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
