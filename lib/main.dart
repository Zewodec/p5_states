import 'package:flutter/material.dart';
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
      title: 'State Project',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'State project Home'),
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
  Set<String> nicknames = {};

  void addNickname(String nickname) {
    setState(() {
      nicknames.add(nickname);
    });
  }

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
                    builder: (context) => MeSubscribedOn(
                      nicknames: nicknames.toList(),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.people))
        ],
      ),
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InstagramPost(
              nickname: 'Zewodec',
              imageUrl: 'https://picsum.photos/600',
              likes: 3,
              comments: const ['Great photo!', 'Love it!', 'Nice job!'],
              onAddNickname: addNickname,
            ),
            InstagramPost(
              nickname: 'Mike',
              imageUrl: 'https://picsum.photos/601',
              likes: 66,
              comments: const ['Wow!', 'Let\'s GO!'],
              onAddNickname: addNickname,
            )
          ],
        ),
      ),
    );
  }
}
