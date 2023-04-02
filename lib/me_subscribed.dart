import 'package:flutter/material.dart';
import 'package:p5_states/models/user_subscribed_model.dart';
import 'package:provider/provider.dart';

class MeSubscribedOn extends StatelessWidget {
  const MeSubscribedOn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserSubscribedModel>(
      builder: (BuildContext context, model, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('You subscribed on:'),
          ),
          body: ListView.builder(
            itemCount: model.nicknamesList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(model.nicknamesList[index]),
              );
            },
          ),
        );
      },
    );
  }
}
