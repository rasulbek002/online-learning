import 'package:flutter/material.dart';
import 'dart:math';

import '../ui/main_button.dart';

class SentenceBuilderScreen extends StatefulWidget {
  @override
  _SentenceBuilderScreenState createState() => _SentenceBuilderScreenState();
}

class _SentenceBuilderScreenState extends State<SentenceBuilderScreen> {
  final List<String> words = [
    "Мен",
    "жакшы",
    "китеп",
    "окуганды",
    "кором"
  ];

  String correctAnswer = 'Мен китеп окуганды жакшы кором';

  bool hasAnswer = false;
  bool isAnswerCorrect = false;

  List<String> shuffledWords = [];
  List<String> selectedWords = [];

  @override
  void initState() {
    super.initState();
    shuffleWords();
  }

  void shuffleWords() {
    shuffledWords = List.from(words)..shuffle(Random());
    selectedWords.clear();
    setState(() {});
  }

  void handleAnswer(){
    hasAnswer = true;

    if(selectedWords.join(' ') == correctAnswer) {
      setState(() {
        isAnswerCorrect = true;
      });
    } else {
      setState(() {
        isAnswerCorrect = true;
      });
    }
  }

  void selectWord(String word) {
    setState(() {
      selectedWords = List.from(selectedWords)..add(word);
      shuffledWords = List.from(shuffledWords)..remove(word);
    });
  }

  void removeSelectedWord(String word) {
    setState(() {
      selectedWords = List.from(selectedWords)..remove(word);
      shuffledWords = List.from(shuffledWords)..add(word);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Суйломду которунуз" )),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 40,
                child: Align(
                  alignment: Alignment.centerLeft,  // Ensures text is aligned to the left
                  child: const Text(
                    'I like to read books',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 100,
                child: Wrap(
                  spacing: 8.0,
                  children: selectedWords.map((word) {
                    return ElevatedButton(
                      onPressed: () => removeSelectedWord(word),
                      child: Text(word),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 1.0,            // Height of the line
                color: Colors.grey,    // Color of the line
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
                  onPressed: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      context: context,
                      backgroundColor: Color(#F75555),
                      builder: (context) {
                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("This is a modal bottom sheet",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Close"),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  buttonText: 'Жооп беруу',
                  bgColor:0xFF6949FF,
                  textColor: const Color(0xFFFFFFFF),
                ),
            ],
          ),
         )
    );
  }
}

