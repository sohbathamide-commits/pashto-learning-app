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
    subtitle: const Text('د بوټو، ونو، ګلانو او طبیعت په اړه زده کړه'),
    trailing: const Icon(Icons.arrow_back_ios),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PlantsNaturePage(),
        ),
      );
    },
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
    subtitle: const Text(
      'لمر، سپوږمۍ، ځمکه او د لمریز نظام سیارې',
    ),
    trailing: const Icon(Icons.arrow_back_ios),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SpacePage(),
        ),
      );
    },
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
// ==================== بوټي او طبیعت ====================

class PlantsNaturePage extends StatelessWidget {
  const PlantsNaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = [
      {
        'emoji': '🌳',
        'name': 'ونې',
        'info':
            'ونې د طبیعت مهمه برخه ده. ونې موږ ته اکسیجن، مېوې، لرګي او سیوری راکوي. '
            'ونې د هوا په پاکولو کې هم مرسته کوي.',
      },
      {
        'emoji': '🌹',
        'name': 'ګلان',
        'info':
            'ګلان د طبیعت ښکلا زیاتوي. ډېری ګلان ښکلي رنګونه او خوږ بوی لري. '
            'مچۍ او نور حشرات د ګلانو له شاتو او ګردې څخه ګټه اخلي.',
      },
      {
        'emoji': '🌱',
        'name': 'نباتات',
        'info':
            'نباتات د ودې لپاره اوبه، هوا، رڼا او مناسب چاپېریال ته اړتیا لري. '
            'ډېری نباتات د لمر د رڼا په مرسته خپل خواړه جوړوي.',
      },
      {
        'emoji': '🍎',
        'name': 'مېوې',
        'info':
            'مېوې د ډېرو نباتاتو له ګلانو څخه جوړېږي. '
            'مېوې انسانانو ته مهم ویټامینونه او نور ګټور مواد ورکوي.',
      },
      {
        'emoji': '🌾',
        'name': 'فصلونه',
        'info':
            'غنم، جوار، وریجې او نور فصلونه د انسانانو د خوړو لپاره کرل کېږي. '
            'کرنه د خلکو لپاره ډېره مهمه ده.',
      },
      {
        'emoji': '💧',
        'name': 'اوبه',
        'info':
            'اوبه د انسانانو، حیواناتو او نباتاتو لپاره ډېرې مهمې دي. '
            'د ژوند ډېری موجودات د ژوند لپاره اوبو ته اړتیا لري.',
      },
      {
        'emoji': '☀️',
        'name': 'لمر',
        'info':
            'لمر موږ ته رڼا او تودوخه راکوي. '
            'نباتات د لمر د رڼا په مرسته خپل خواړه جوړوي. '
            'لمر د ځمکې د ژوند لپاره ډېر مهم دی.',
      },
      {
        'emoji': '🌧️',
        'name': 'باران',
        'info':
            'باران هغه وخت کېږي چې د ورېځو اوبه بېرته ځمکې ته راولوېږي. '
            'باران د کرنې، سیندونو او نباتاتو لپاره مهم دی.',
      },
      {
        'emoji': '🌈',
        'name': 'رنګین کمان',
        'info':
            'رنګین کمان معمولاً د باران وروسته هغه وخت ښکاري چې د لمر رڼا د اوبو له وړو څاڅکو سره یوځای شي. '
            'په رنګین کمان کې بېلابېل رنګونه لیدل کېږي.',
      },
      {
        'emoji': '🏔️',
        'name': 'غرونه',
        'info':
            'غرونه د ځمکې لوړې برخې دي. '
            'ځینې غرونه د کال په ډېرو میاشتو کې واوره لري. '
            'غرونه د اوبو د سرچینو لپاره هم مهم دي.',
      },
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('بوټي او طبیعت 🌱'),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: topics.length,
          itemBuilder: (context, index) {
            final topic = topics[index];

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${topic['emoji']} ${topic['name']}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      topic['info']!,
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
// ==================== فضا او سیارې ====================

class SpacePage extends StatelessWidget {
  const SpacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = [
      {
        'emoji': '☀️',
        'name': 'لمر',
        'info':
            'لمر زموږ د لمریز نظام مرکز دی. '
            'لمر موږ ته رڼا او تودوخه راکوي. '
            'ځمکه او نورې سیارې د لمر شاوخوا ګرځي.',
      },
      {
        'emoji': '🌍',
        'name': 'ځمکه',
        'info':
            'ځمکه هغه سیاره ده چې موږ پکې ژوند کوو. '
            'ځمکه اوبه، هوا، غرونه، سمندرونه او د ژوند لپاره مناسب چاپېریال لري.',
      },
      {
        'emoji': '🌙',
        'name': 'سپوږمۍ',
        'info':
            'سپوږمۍ د ځمکې طبیعي ملګرې ده او د ځمکې شاوخوا ګرځي. '
            'سپوږمۍ خپله رڼا نه جوړوي، بلکې د لمر رڼا منعکسوي.',
      },
      {
        'emoji': '🔴',
        'name': 'مریخ',
        'info':
            'مریخ ته د سورې سیارې نوم هم ورکول کېږي، ځکه د سطحې رنګ یې سور ښکاري. '
            'مریخ د لمر شاوخوا ګرځي او دوه کوچنۍ سپوږمۍ لري.',
      },
      {
        'emoji': '🟠',
        'name': 'مشتري',
        'info':
            'مشتري د لمریز نظام تر ټولو لویه سیاره ده. '
            'دا یوه ډېره لویه ګازي سیاره ده او ډېرې سپوږمۍ لري.',
      },
      {
        'emoji': '💍',
        'name': 'زحل',
        'info':
            'زحل د خپلو ښکلو کړیو له امله ډېر مشهور دی. '
            'دا هم یوه لویه ګازي سیاره ده او ډېرې سپوږمۍ لري.',
      },
      {
        'emoji': '🔵',
        'name': 'اورانوس',
        'info':
            'اورانوس یوه ډېره سړه او لرې سیاره ده. '
            'دا د لمر شاوخوا په ډېرې اوږدې لارې ګرځي او ځانګړي کړۍ هم لري.',
      },
      {
        'emoji': '🔵',
        'name': 'نپتون',
        'info':
            'نپتون د لمریز نظام له تر ټولو لرې لویو سیارو څخه دی. '
            'دا یوه سړه، تیاره او ډېره لرې سیاره ده.',
      },
      {
        'emoji': '☄️',
        'name': 'دنباله دار',
        'info':
            'دنباله دار د یخ، دوړو او ډبرو له موادو جوړ اسماني جسم دی. '
            'کله چې لمر ته نږدې شي، روښانه لکۍ یې ښکاره کېدای شي.',
      },
      {
        'emoji': '⭐',
        'name': 'ستوري',
        'info':
            'ستوري ډېر لوی او ګرم اسماني جسمونه دي چې خپله رڼا تولیدوي. '
            'لمر هم یو ستوری دی. ستوري د شپې په اسمان کې د وړو رڼاوو په څېر ښکاري.',
      },
      {
        'emoji': '🌌',
        'name': 'کهکشان',
        'info':
            'کهکشان د ستورو، ګازونو او دوړو یوه ډېره لویه ټولګه ده. '
            'زموږ ځمکه د شیدو لارې په نوم په یوه کهکشان کې ده.',
      },
      {
        'emoji': '🚀',
        'name': 'فضايي بېړۍ',
        'info':
            'فضايي بېړۍ د فضا د سفر او څېړنې لپاره کارول کېږي. '
            'انسانانو د فضايي بېړیو په وسیله سپوږمۍ ته سفر کړی او د فضا په اړه یې ډېر معلومات ترلاسه کړي.',
      },
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('فضا او سیارې 🚀'),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: topics.length,
          itemBuilder: (context, index) {
            final topic = topics[index];

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${topic['emoji']} ${topic['name']}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      topic['info']!,
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
