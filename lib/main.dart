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
    final animals = [
      {
        'emoji': '🐘',
        'name': 'فیل',
        'info':
            'فیل د نړۍ له تر ټولو لویو ځمکنیو حیواناتو څخه دی. '
            'اوږد خرطوم او لوی غوږونه لري. '
            'فیل واښه، پاڼې، مېوې او بوټي خوري. '
            'فیلان ډېر هوښیار او ټولنیز حیوانات دي.',
      },
      {
        'emoji': '🦁',
        'name': 'زمری',
        'info':
            'زمری یو پیاوړی غوښه خوړونکی حیوان دی. '
            'زیاتره زمریان په افریقا کې ژوند کوي. '
            'زمریان په ډلو کې ژوند کوي او د ښکار لپاره یوځای کار کوي. '
            'نر زمری د غاړې ښکلی یال لري.',
      },
      {
        'emoji': '🐯',
        'name': 'پړانګ',
        'info':
            'پړانګ یو لوی او ځواکمن غوښه خوړونکی حیوان دی. '
            'د بدن پر مخ ځانګړې تورې کرښې لري. '
            'پړانګان عموماً یوازې ژوند کوي او ډېر ښه لامبو هم کولی شي.',
      },
      {
        'emoji': '🐻',
        'name': 'خرس',
        'info':
            'خرس یو لوی ځنګلي حیوان دی. '
            'د خرس ځینې ډولونه مېوې، شات، بوټي او کبان خوري. '
            'خرس د ژمي په موسم کې د اوږدې استراحت دورې ته ځي.',
      },
      {
        'emoji': '🐺',
        'name': 'لیوه',
        'info':
            'لیوه یو هوښیار ځنګلي حیوان دی. '
            'لیوان اکثره په ډلو کې ژوند کوي او یوځای ښکار کوي. '
            'دوی د یو بل سره د غږونو له لارې اړیکه نیسي.',
      },
      {
        'emoji': '🦊',
        'name': 'ګیدړ',
        'info':
            'ګیدړ یو کوچنی او هوښیار ځنګلي حیوان دی. '
            'د ګیدړ لکۍ اوږده او ښکلې وي. '
            'ګیدړان کوچني حیوانات، مرغان، مېوې او نور خواړه خوري.',
      },
      {
        'emoji': '🐒',
        'name': 'بیزو',
        'info':
            'بیزو ډېر فعال او هوښیار حیوان دی. '
            'ډېری بیزوګان په ونو کې ژوند کوي. '
            'دوی مېوې، پاڼې، تخمونه او ځینې کوچني ژوي خوري.',
      },
      {
        'emoji': '🦒',
        'name': 'زرافه',
        'info':
            'زرافه د نړۍ تر ټولو اوږده ځمکنی حیوان بلل کېږي. '
            'اوږده غاړه او اوږدې پښې لري. '
            'زرافه د ونو له لوړو پاڼو څخه خواړه اخلي.',
      },
      {
        'emoji': '🦓',
        'name': 'زیبرا',
        'info':
            'زیبرا د آس په څېر حیوان دی چې پر بدن تورې او سپینې کرښې لري. '
            'زیبرا په افریقا کې ژوند کوي او واښه خوري. '
            'هره زیبرا خپلې ځانګړې کرښې لري.',
      },
      {
        'emoji': '🦏',
        'name': 'کرګدن',
        'info':
            'کرګدن یو ډېر لوی او قوي حیوان دی. '
            'پر پوزه یې یو یا دوه ښکرونه وي. '
            'کرګدن عموماً واښه او بوټي خوري.',
      },
      {
        'emoji': '🦛',
        'name': 'اسماني غویی',
        'info':
            'اسماني غویی یو لوی او قوي حیوان دی چې ډېر وخت په اوبو کې تېروي. '
            'دا حیوان په افریقا کې ژوند کوي او واښه خوري. '
            'سره له دې چې دروند ښکاري، په اوبو کې ښه حرکت کوي.',
      },
      {
        'emoji': '🐊',
        'name': 'تمساح',
        'info':
            'تمساح یو لوی خزنده حیوان دی. '
            'په اوبو او د اوبو په شاوخوا کې ژوند کوي. '
            'تمساح قوي غاښونه لري او غوښه خوري.',
      },
      {
        'emoji': '🐍',
        'name': 'مار',
        'info':
            'مار یو اوږد خزنده حیوان دی چې پښې نه لري. '
            'ماران په بېلابېلو ځایونو کې ژوند کوي. '
            'ځینې ماران زهرجن وي او ځینې نور بیا زهر نه لري.',
      },
      {
        'emoji': '🐢',
        'name': 'شمشتی',
        'info':
            'شمشتی یو ورو حرکت کوونکی حیوان دی. '
            'پر شا یې کلک پوښ وي چې بدن یې ساتي. '
            'شمشتیان بوټي او ځینې نور کوچني خواړه خوري.',
      },
      {
        'emoji': '🐬',
        'name': 'دولفین',
        'info':
            'دولفین یو هوښیار سمندري حیوان دی. '
            'دولفینان په ډلو کې ژوند کوي او د یو بل سره اړیکه نیسي. '
            'دوی د لامبو ډېر ښه مهارت لري.',
      },
      {
        'emoji': '🐋',
        'name': 'نهنګ',
        'info':
            'نهنګ د نړۍ له تر ټولو لویو حیواناتو څخه دی. '
            'په سمندرونو کې ژوند کوي. '
            'د نهنګ ځینې ډولونه ډېر لوی بدن لري او د اوبو پر سر ساه اخلي.',
      },
      {
        'emoji': '🦅',
        'name': 'عقاب',
        'info':
            'عقاب یو پیاوړی ښکار کوونکی مرغه دی. '
            'قوي وزرونه او تېزې پنجې لري. '
            'عقاب کولی شي په لوړو اسمانونو کې ډېر لوړ الوتنه وکړي.',
      },
      {
        'emoji': '🦜',
        'name': 'طوطي',
        'info':
            'طوطي یو ښکلی او رنګین مرغه دی. '
            'ځینې طوطيان د انسانانو ځینې غږونه تقلید کولی شي. '
            'طوطي مېوې، تخمونه او نور نباتي خواړه خوري.',
      },
      {
        'emoji': '🐴',
        'name': 'آس',
        'info':
            'آس یو قوي او ګړندی کورنی حیوان دی. '
            'انسانانو له ډېرې مودې راهیسې له آسونو څخه د سفر او کار لپاره ګټه اخیستې. '
            'آس واښه او نور نباتي خواړه خوري.',
      },
      {
        'emoji': '🐄',
        'name': 'غوا',
        'info':
            'غوا یو مهم کورنی حیوان دی. '
            'غوا واښه او نور نباتات خوري. '
            'له غوا څخه شیدې او نور خوراکي توکي ترلاسه کېږي.',
      },
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('مشهور حیوانات 🐾'),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: animals.length,
          itemBuilder: (context, index) {
            final animal = animals[index];

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${animal['emoji']} ${animal['name']}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      animal['info']!,
                      style: const TextStyle(
                        fontSize: 17,
                        height: 1.7,
                      ),
                    ),
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
