import 'package:flutter/material.dart';

class MeSubscribedOn extends StatelessWidget {
  const MeSubscribedOn({Key? key, required this.nicknames}) : super(key: key);

  final List<String> nicknames;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('You subscribed on:'),
      ),
      body: ListView.builder(
        itemCount: nicknames.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(nicknames[index]),
          );
        },
      ),
    );
  }
}
