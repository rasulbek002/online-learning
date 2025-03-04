import 'package:flutter/material.dart';
import 'dart:math';

import '../ui/main_button.dart';

class SentenceBuilderScreen extends StatefulWidget {
  @override
  _SentenceBuilderScreenState createState() => _SentenceBuilderScreenState();
}

class _SentenceBuilderScreenState extends State<SentenceBuilderScreen> {
  final List<Map<String, dynamic>> testCases = [
    {
      "sentence": "I like to read books",
      "words": ["Мен", "жакшы", "китеп", "окуганды", "кором"],
      "correctAnswer": "Мен китеп окуганды жакшы кором"
    },
    {
      "sentence": "She loves playing piano",
      "words": ["Ал", "пианино", "чалганды", "сүйөт"],
      "correctAnswer": "Ал пианино чалганды сүйөт"
    },
    {
      "sentence": "They are going to school",
      "words": ["Алар", "мектепке", "баражатышат"],
      "correctAnswer": "Алар мектепке баражатышат"
    },
    {
      "sentence": "We enjoy traveling",
      "words": ["Биз", "саякат", "кылганды", "жактырабыз"],
      "correctAnswer": "Биз саякат кылганды жактырабыз"
    },
    {
      "sentence": "He is watching a movie",
      "words": ["Ал", "тасма", "коруп", "жатат"],
      "correctAnswer": "Ал тасма коруп жатат"
    }
  ];

  int currentTestIndex = 0;
  bool hasAnswer = false;
  bool isAnswerCorrect = false;
  List<String> shuffledWords = [];
  List<String> selectedWords = [];
  List<bool> results = [];

  @override
  void initState() {
    super.initState();
    shuffleWords();
  }

  void shuffleWords() {
    shuffledWords = List.from(testCases[currentTestIndex]['words'])..shuffle(Random());
    selectedWords.clear();
    setState(() {});
  }

  void handleAnswer() {
    setState(() {
      hasAnswer = true;
      isAnswerCorrect = selectedWords.join(' ') == testCases[currentTestIndex]['correctAnswer'];
      results.add(isAnswerCorrect);
    });
    showResultBottomSheet();
  }

  void showResultBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      context: context,
      backgroundColor: isAnswerCorrect ? Colors.green : Colors.red,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isAnswerCorrect ? "Туура!" : "Туура эмес!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (!isAnswerCorrect) ...[
                  SizedBox(height: 10),
                  Text(
                    "Туура жооп: ${testCases[currentTestIndex]['correctAnswer']}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                SizedBox(height: 20),
                MainButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (currentTestIndex < testCases.length - 1) {
                      setState(() {
                        currentTestIndex++;
                        shuffleWords();
                      });
                    } else {
                      showFinalResults();
                    }
                  },
                  buttonText: 'Улантуу',
                  bgColor: 0xFFFFFFFF,
                  textColor: Colors.black,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void showFinalResults() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.blue,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Сынактын жыйынтыгы",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 10),
                ...results.asMap().entries.map((entry) => Text(
                  "Суроо ${entry.key + 1}: ${entry.value ? "Туура" : "Туура эмес"}",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
                SizedBox(height: 20),
                MainButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      currentTestIndex = 0;
                      results.clear();
                      shuffleWords();
                    });
                  },
                  buttonText: 'Кайра баштоо',
                  bgColor:0xFFFFFFFF,
                  textColor: Colors.black,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void selectWord(String word) {
    setState(() {
      selectedWords.add(word);
      shuffledWords.remove(word);
    });
  }

  void removeSelectedWord(String word) {
    setState(() {
      selectedWords.remove(word);
      shuffledWords.add(word);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Суйломду которунуз")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              testCases[currentTestIndex]['sentence'],
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 8.0,
              children: selectedWords.map((word) {
                return ElevatedButton(
                  onPressed: () => removeSelectedWord(word),
                  child: Text(word),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            Container(
              height: 1.0,
              color: Colors.grey,
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 8.0,
              children: shuffledWords.map((word) {
                return ElevatedButton(
                  onPressed: () => selectWord(word),
                  child: Text(word),
                );
              }).toList(),
            ),
            const Spacer(),
            MainButton(
              onPressed: handleAnswer,
              buttonText: 'Жооп беруу',
              bgColor: 0xFF6949FF,
              textColor: const Color(0xFFFFFFFF),
            ),
          ],
        ),
      ),
    );
  }
}
