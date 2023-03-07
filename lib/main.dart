import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifecycle application'),
        actions: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  number++;
                });
              },
              child: const Text('Change Parent Widget Data'))
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to home screen'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => Home(number: number)));
          },
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.number});
  final int number;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int number = 0;
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    debugPrint('init state is called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('did change dependency is called');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build method is called');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Data from parent ${widget.number}'),
          const Divider(),
          Text('Data from This widget $number'),
          const Divider(),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  number++;
                });
              },
              child: const Text('Change Data')),
          TextField(
            controller: _textEditingController,
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('did update widget is called');
    debugPrint('old data is ${oldWidget.number} new data is ${widget.number}');
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('dispose widget is called');
  }
}

// App LifeCycle
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     debugPrint('Did change depenpency is called');
//   }

//   // resume, inactive, pause, detach
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//     debugPrint('App LifeCycle is ${state.name}');
//     if (state == AppLifecycleState.resumed) {
//       debugPrint('Music Player is playing');
//     } else if (state == AppLifecycleState.inactive) {
//       debugPrint('Music Player is paused');
//     } else if (state == AppLifecycleState.paused) {
//       debugPrint('Music Player is paused, app is in background');
//     } else if (state == AppLifecycleState.detached) {
//       debugPrint('Music Player destoryed');
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     WidgetsBinding.instance.removeObserver(this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('App LifeCycle'),
//         ),
//         body: const Center(child: Text('data')),
//       ),
//     );
//   }
// }
