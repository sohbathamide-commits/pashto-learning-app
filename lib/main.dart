import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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

            // پښتو الفبا
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

            // ریاضي
            Card(
              child: ListTile(
                leading: const Text(
                  '🔢',
                  style: TextStyle(fontSize: 30),
                ),
                title: const Text(
                  'ریاضي',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'له ۱ تر ۱۰۰ پورې شمېرې',
                ),
                trailing: const Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MathPage(),
                    ),
                  );
                },
              ),
            ),

          Card(
  child: ListTile(
    leading: const Text(
      '🌍',
      style: TextStyle(fontSize: 30),
    ),
    title: const Text(
      'عمومي معلومات',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: const Text(
      'نړۍ، حیوانات، طبیعت، فضا او ساینس',
    ),
    trailing: const Icon(Icons.arrow_back_ios),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GeneralInfoPage(),
        ),
      );
    },
  ),
),

            Card(
              child: ListTile(
                leading: const Text('🧠'),
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

// ==================== پښتو الفبا ====================

class AlphabetPage extends StatefulWidget {
  const AlphabetPage({super.key});

  @override
  State<AlphabetPage> createState() => _AlphabetPageState();
}

class _AlphabetPageState extends State<AlphabetPage> {
  final AudioPlayer player = AudioPlayer();

  final List<List<String>> letters = [
    ['ا', 'انار'],
    ['ب', 'بوره'],
    ['پ', 'پلار'],
    ['ت', 'توت'],
    ['ټ', 'ټوپک'],
    ['ث', 'ثواب'],
    ['ج', 'جام'],
    ['ځ', 'ځنګل'],
    ['چ', 'چای'],
    ['څ', 'څاروی'],
    ['ح', 'حوض'],
    ['خ', 'خربوزه'],
    ['د', 'دروازه'],
    ['ډ', 'ډوډۍ'],
    ['ذ', 'ذرت'],
    ['ر', 'رنګ'],
    ['ړ', 'وړانګه'],
    ['ز', 'زلمی'],
    ['ژ', 'ژمی'],
    ['ږ', 'ږیره'],
    ['س', 'سیب'],
    ['ش', 'شګه'],
    ['ښ', 'ښکلی'],
    ['ص', 'صبر'],
    ['ض', 'ضرر'],
    ['ط', 'طوطي'],
    ['ظ', 'ظرف'],
    ['ع', 'عینکې'],
    ['غ', 'غر'],
    ['ف', 'فیل'],
    ['ق', 'قلم'],
    ['ک', 'کتاب'],
    ['ګ', 'ګل'],
    ['ل', 'لمر'],
    ['م', 'مڼه'],
    ['ن', 'نارنج'],
    ['ڼ', 'پاڼه'],
    ['و', 'وطن'],
    ['ه', 'هګۍ'],
    ['ي', 'یخ'],
    ['ې', 'ډېرې'],
    ['ۍ', 'هګۍ'],
    ['ئ', 'راځئ'],
  ];

  Future<void> playAudio() async {
    await player.play(
      AssetSource('audio/ok yes.m4a'),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('پښتو الفبا 🔊'),
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
            final letter = letters[index][0];
            final word = letters[index][1];

            return Card(
              child: InkWell(
                onTap: index == 0 ? playAudio : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      letter,
                      style: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      word,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    const Icon(Icons.volume_up),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ==================== ریاضي ====================

class MathPage extends StatelessWidget {
  const MathPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ریاضي 🔢'),
          centerTitle: true,
        ),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 100,
            itemBuilder: (context, index) {
              final number = index + 1;

              return Card(
                child: Center(
                  child: Text(
                    '$number',
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}// ==================== عمومي معلومات ====================

class GeneralInfoPage extends StatelessWidget {
  const GeneralInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('عمومي معلومات 🌍'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // حیوانات
            Card(
              child: ListTile(
                leading: const Text(
                  '🐘',
                  style: TextStyle(fontSize: 30),
                ),
                title: const Text(
                  'حیوانات',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: const Text('د حیواناتو په اړه زده کړه'),
                trailing: const Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnimalsPage(),
                    ),
                  );
                },
              ),
            ),

            // بوټي او طبیعت
            Card(
              child: ListTile(
                leading: const Text(
                  '🌱',
                  style: TextStyle(fontSize: 30),
                ),
                title: const Text(
                  'بوټي او طبیعت',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: const Text('د طبیعت په اړه زده کړه'),
                trailing: const Icon(Icons.arrow_back_ios),
              ),
            ),

            // فضا
            Card(
              child: ListTile(
                leading: const Text(
                  '🚀',
                  style: TextStyle(fontSize: 30),
                ),
                title: const Text(
                  'فضا او سیارې',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: const Text('لمر، سپوږمۍ او سیارې'),
                trailing: const Icon(Icons.arrow_back_ios),
              ),
            ),

            // ساینس
            Card(
              child: ListTile(
                leading: const Text(
                  '🔬',
                  style: TextStyle(fontSize: 30),
                ),
                title: const Text(
                  'ساده ساینس',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: const Text('د ساینس په زړه پورې معلومات'),
                trailing: const Icon(Icons.arrow_back_ios),
              ),
            ),

            // هېوادونه
            Card(
              child: ListTile(
                leading: const Text(
                  '🌍',
                  style: TextStyle(fontSize: 30),
                ),
                title: const Text(
                  'هېوادونه او نړۍ',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: const Text('د نړۍ د هېوادونو په اړه معلومات'),
                trailing: const Icon(Icons.arrow_back_ios),
              ),
            ),

            // مشهور ځایونه
            Card(
              child: ListTile(
                leading: const Text(
                  '🏛️',
                  style: TextStyle(fontSize: 30),
                ),
                title: const Text(
                  'مشهور ځایونه',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: const Text('د نړۍ مشهور ځایونه'),
                trailing: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ==================== حیوانات ====================

class AnimalsPage extends StatelessWidget {
  const AnimalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('حیوانات 🐘'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '🐘 فیل',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'فیل یو ډېر لوی ځمکنی حیوان دی. '
                      'فیل اوږده خرطوم او لوی غوږونه لري.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '🦁 زمری',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'زمری یو پیاوړی ځنګلي حیوان دی. '
                      'زمری د خپل ځواک او غږ له امله مشهور دی.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '🐰 سوی',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'سوی یو کوچنی حیوان دی. '
                      'سوی اوږده غوږونه او چټکې پښې لري.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '🐦 مرغه',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'مرغان وزرونه لري او ډېری مرغان الوتلی شي.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
