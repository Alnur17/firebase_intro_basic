import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  runApp(const FootballLiveScoreApp());
}

class FootballLiveScoreApp extends StatelessWidget {
  const FootballLiveScoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Score App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Map<String,dynamic> scoreMap = {};
  //
  // Future<void> getDataFromFirebase() async {
  //   CollectionReference footballRef = firebaseFirestore.collection('football');
  //   final DocumentReference docReference = footballRef.doc('1_ban_vs_ind');
  //   final data = await docReference.get();
  //   final teamName = data.get('team_a');
  //   log(teamName.toString());
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getDataFromFirebase();
  // }

  @override
  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Score'),
      ),
      body: FutureBuilder(
        future:
            firebaseFirestore.collection('football').doc('1_ban_vs_ind').get(),
        builder: (context, snapshot) {
          print(snapshot.data?.data().toString());
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              final score = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    score.get('match_name'),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            score.get('score_team_a').toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            score.get('team_a'),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const Text('VS'),
                      Column(
                        children: [
                          Text(
                            score.get('score_team_b').toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            score.get('team_b'),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }*/
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Score'),
      ),
      body: StreamBuilder(
        stream: firebaseFirestore
            .collection('football')
            .doc('1_ban_vs_ind')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data?.data() == null) {
            return const Center(
              child: Text('No data available'),
            );
          }
          print(snapshot.data?.data());
          final score = snapshot.data!;
          return Column(
            children: [
              const SizedBox(height: 36),
              Text(
                score.get('match_name'),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        score.get('score_team_a').toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        score.get('team_a'),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const Text('VS'),
                  Column(
                    children: [
                      Text(
                        score.get('score_team_b').toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        score.get('team_b'),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ],
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          firebaseFirestore
              .collection('football')
              .doc('1_ban_vs_ind')
              .update({'match_name': 'Bangladesh vs India', 'team_b': 'India'});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
