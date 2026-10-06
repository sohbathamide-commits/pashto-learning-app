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
              true,
            ),

            _lessonCard(
              context,
              '🔢',
              'ریاضي',
              'شمېرې او ساده حسابونه زده کړه',
              Colors.green,
              false,
            ),

            _lessonCard(
              context,
              '🌍',
              'عمومي معلومات',
              'نوي او ګټور معلومات زده کړه',
              Colors.orange,
              false,
            ),

            _lessonCard(
              context,
              '🧠',
              'پوښتنې او ځوابونه',
              'خپل معلومات وازمویه',
              Colors.purple,
              false,
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
    bool active,
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
          if (active) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AlphabetPage(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title ډېر ژر به فعال شي 🚀'),
              ),
            );
          }
        },
      ),
    );
  }
}

class AlphabetPage extends StatelessWidget {
  const AlphabetPage({super.key});

  static const List<String> letters = [
    'ا',
    'ب',
    'پ',
    'ت',
    'ټ',
    'ث',
    'ج',
    'ځ',
    'چ',
    'څ',
    'ح',
    'خ',
    'د',
    'ډ',
    'ذ',
    'ر',
    'ړ',
    'ز',
    'ژ',
    'ږ',
    'س',
    'ش',
    'ښ',
    'ص',
    'ض',
    'ط',
    'ظ',
    'ع',
    'غ',
    'ف',
    'ق',
    'ک',
    'ګ',
    'ل',
    'م',
    'ن',
    'ڼ',
    'و',
    'ه',
    'ي',
    'ې',
    'ۍ',
    'ئ',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('پښتو الفبا'),
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate:
              const
