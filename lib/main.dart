import 'package:flutter/material.dart';

void main() {
  runApp(const PashtoLearningApp());
}

class PashtoLearningApp extends StatelessWidget {
  const PashtoLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'پښتو زده کړه',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'پښتو تعلیمي اپ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'ښه راغلاست! 👋',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'په اسانه او خوندوره طریقه زده کړه پیل کړه.',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 25),

            _lessonCard(
              context,
              '📚',
              'پښتو الفبا',
              'د پښتو توري زده کړه',
              Colors.blue,
            ),

            _lessonCard(
              context,
              '🔢',
              'ریاضي',
              'شمېرې او ساده حسابونه زده کړه',
              Colors.green,
            ),

            _lessonCard(
              context,
              '🌍',
              'عمومي معلومات',
              'نوي او ګټور معلومات زده کړه',
              Colors.orange,
            ),

            _lessonCard(
              context,
              '🧠',
              'پوښتنې او ځوابونه',
              'خپل معلومات وازمویه',
              Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _lessonCard(
    BuildContext context,
    String icon,
    String title,
    String subtitle,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: color,
          child: Text(
            icon,
            style: const TextStyle(fontSize: 25),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        trailing: const Icon(Icons.arrow_back_ios),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title ژر به فعال شي 🚀'),
            ),
          );
        },
      ),
    );
  }
}
