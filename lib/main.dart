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
                leading: const Text('🔢'),
                title: const Text('ریاضي'),
                subtitle: const Text('ډېر ژر به فعال شي 🚀'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Text('🌍'),
                title: const Text('عمومي معلومات'),
                subtitle: const Text('ډېر ژر به فعال شي 🚀'),
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
    ['ط', 'طوطی'],
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
    // د ازموینې لپاره
    await player.play(
      AssetSource('audio/test.mp3'),
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
