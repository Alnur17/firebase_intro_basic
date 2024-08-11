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
      title: 'Live Score App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        //primaryColorDark: Colors.red,
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Live Score'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Text(
              'Match Name',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '10',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Team Name',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const Text('VS'),
                Column(
                  children: [
                    Text(
                      '10',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Team Name',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
