import 'package:flutter/material.dart';
import 'package:s/pages/sign_up_third_page.dart';
import 'package:s/ui/main_button.dart';
import 'package:s/ui/dialog.dart';
import 'package:s/ui/progress_bar.dart';
import 'package:s/ui/select_item.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
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
                    currentStep: 1,
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
                        text: 'Кайсы тилди үйрөнөсүз? ',
                      ),
                    ],
                  ),
                  const SizedBox(height: 54.0),
                  SelectItem(
                    text: 'English',
                    showIcon: true,
                    image: 'assets/images/english.png',
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
                    text: 'Mandarin',
                    showIcon: true,
                    image: 'assets/images/mandarin.png',
                    backgroundColor: selectedItemIndex == 1 ? Colors.blue : (Colors.grey[200] ?? Colors.grey), // Change color if selected
                  ),
                  const SizedBox(height: 20.0),
                  SelectItem(
                    onClick: () {
                      // Handle onClick action
                      handleItemClick(2); // Update selected index to 2 (Spanish)
                      print('Spanish item clicked!');
                    },
                    text: 'Spanish',
                    showIcon: true,
                    image: 'assets/images/spanish.png',
                    backgroundColor: selectedItemIndex == 2 ? Colors.blue : (Colors.grey[200] ?? Colors.grey), // Change color if selected
                  ),
                  const SizedBox(height: 20.0),
                  SelectItem(
                    onClick: () {
                      // Handle onClick action
                      handleItemClick(3); // Update selected index to 3 (French)
                      print('French item clicked!');
                    },
                    text: 'French',
                    showIcon: true,
                    image: 'assets/images/french.png',
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
                                const SelectLevel()));
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
