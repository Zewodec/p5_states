import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:p5_states/instagram_post.dart';
import 'package:p5_states/me_subscribed.dart';
import 'package:p5_states/models/user_subscribed_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UserSubscribedModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChangeNotifier Project',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'ChangeNotifier project Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MeSubscribedOn(),
                  ),
                );
              },
              icon: const Icon(Icons.people)),
          IconButton(
              onPressed: () {
                Provider.of<UserSubscribedModel>(context, listen: false)
                    .clearAllNickNames();
                Fluttertoast.showToast(
                  msg: 'All Subscribers Cleared',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            InstagramPost(
              nickname: 'Zewodec',
              imageUrl: 'https://picsum.photos/600',
              likes: 3,
              comments: ['Great photo!', 'Love it!', 'Nice job!'],
            ),
            InstagramPost(
              nickname: 'Mike',
              imageUrl: 'https://picsum.photos/601',
              likes: 66,
              comments: ['Wow!', 'Let\'s GO!'],
            ),
            InstagramPost(
              nickname: 'Navy',
              imageUrl: 'https://picsum.photos/602',
              likes: 103,
              comments: ['OMG!', 'That is great!'],
            )
          ],
        ),
      ),
    );
  }
}
