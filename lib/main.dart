import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'پښتو زده کړه',
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
          title: const Text('پښتو تعلیمي اپ'),
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

            const SizedBox(height: 25),

            Card(
              child: ListTile(
                leading: const Text(
                  '📚',
                  style: TextStyle(fontSize: 30),
                ),
                title: const Text(
                  'پښتو الفبا',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text('د پښتو توري زده کړه'),
                trailing: const Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AlphabetPage(),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Text(
                  '🔢',
                  style: TextStyle(fontSize: 30),
                ),
                title: const Text('ریاضي'),
                subtitle: const Text('ډېر ژر به فعال شي 🚀'),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Text(
                  '🌍',
                  style: TextStyle(fontSize: 30),
                ),
                title: const Text('عمومي معلومات'),
                subtitle: const Text('ډېر ژر به فعال شي 🚀'),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Text(
                  '🧠',
                  style: TextStyle(fontSize: 30),
                ),
                title: const Text('پوښتنې او ځوابونه'),
                subtitle: const Text('ډېر ژر به فعال شي 🚀'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlphabetPage extends StatelessWidget {
  const AlphabetPage({super.key});

  static const letters = [
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
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: letters.length,
          itemBuilder: (context, index) {
            return Card(
              child: Center(
                child: Text(
                  letters[index],
                  style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
