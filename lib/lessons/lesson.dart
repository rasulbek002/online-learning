import 'package:flutter/material.dart';
import 'package:s/lessons/lesson_cart.dart';

void main() {
  runApp(const LessonsApp());
}

class LessonsApp extends StatelessWidget {
  const LessonsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LessonsPage(),
    );
  }
}

class LessonsPage extends StatelessWidget {
  final List<Lesson> lessons = [
    Lesson(title: "Саб", subtitle: "Суйлом тузуу", isUnlocked: true, isCompleted: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            LessonCard(lesson: Lesson(title: "1 сабак", subtitle: "Башталгыч баскыч", isUnlocked: true, isCompleted: true)),
            Padding(
              padding: const EdgeInsets.all(20),
              child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/finish.png',
                        width: 100,
                        height: 100,
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/t1.png',
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/blocked.png',
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/t2.png',
                        width: 100,
                        height: 100,
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/blocked.png',
                        width: 100,
                        height: 100,
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/blocked.png',
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/blocked.png',
                        width: 100,
                        height: 100,
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/t3.png',
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/blocked.png',
                        width: 100,
                        height: 100,
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SentenceBuilderScreen()));
                        },
                        child:  Image.asset(
                          'assets/images/ready.png',
                          width: 100,
                          height: 100,
                        ),
                      )

                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      )

    );
  }
}



class Lesson {
  final String title;
  final String subtitle;
  final bool isUnlocked;
  final bool isCompleted;

  Lesson({required this.title, required this.subtitle, required this.isUnlocked, required this.isCompleted});
}

class LessonCard extends StatelessWidget {
  final Lesson lesson;

  const LessonCard({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: lesson.isUnlocked ? Colors.green : Colors.red,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(

                    lesson.title,
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    lesson.subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ) ,
            ),
            Icon(
              lesson.isUnlocked ? Icons.book : Icons.lock,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),

      ),
    );
  }
}

Widget _snakeSegment( IconData icon) {
  return Container(
    width: 30,
    height: 30,
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
      child: Icon(icon, color: Colors.yellowAccent)
    ),
  );
}