import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCUR9SVr5_WOGk4Txhf8EpFjB5lYb0z6Yk",
      appId: "1:886520836260:android:7dc1a6dd19ec0c6d103631",
      messagingSenderId: "886520836260",
      projectId: "fir-basic-b4ef7",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase App',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Integration'),
        ),
        body: const Center(
          child: Text('Firebase is integrated!'),
        ),
      ),
    );
  }
}
