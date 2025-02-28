import 'package:flutter/material.dart';
import 'package:s/pages/sign_up_forth_page.dart';
import 'package:s/ui/main_button.dart';
import 'package:s/ui/dialog.dart';
import 'package:s/ui/progress_bar.dart';
import 'package:s/ui/select_item.dart';

class SelectLevel extends StatefulWidget {
  const SelectLevel({super.key});

  @override
  _SelectLevelState createState() => _SelectLevelState();
}

class _SelectLevelState extends State<SelectLevel> {
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
                    currentStep: 2,
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
                        text: 'Бул тилди канчалык билесиз? ',
                      ),
                    ],
                  ),
                  const SizedBox(height: 54.0),
                  SelectItem(
                    text: 'Эми эле үйрөнүп баштадым',
                    showIcon: true,
                    image: 'assets/images/level1.png',
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
                    text: 'Кээбир сөздөрдү билем',
                    showIcon: true,
                    image: 'assets/images/level2.png',
                    backgroundColor: selectedItemIndex == 1 ? Colors.blue : (Colors.grey[200] ?? Colors.grey), // Change color if selected
                  ),
                  const SizedBox(height: 20.0),
                  SelectItem(
                    onClick: () {
                      // Handle onClick action
                      handleItemClick(2); // Update selected index to 2 (Spanish)
                      print('Spanish item clicked!');
                    },
                    text: 'Жөнөкөй сүйлүмдөрдү түзө алам',
                    showIcon: true,
                    image: 'assets/images/level3.png',
                    backgroundColor: selectedItemIndex == 2 ? Colors.blue : (Colors.grey[200] ?? Colors.grey), // Change color if selected
                  ),
                  const SizedBox(height: 20.0),
                  SelectItem(
                    onClick: () {
                      // Handle onClick action
                      handleItemClick(3); // Update selected index to 3 (French)
                      print('French item clicked!');
                    },
                    text: 'Элдер менен маек кура алам',
                    showIcon: true,
                    image: 'assets/images/level4.png',
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
                                const SelectReason()));
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
