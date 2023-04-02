import 'package:flutter/material.dart';
import 'package:p5_states/models/user_subscribed_model.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  final String nickname;
  final String imageUrl;
  final String avatarImageUrl;

  const UserProfile(
      {Key? key,
      required this.nickname,
      required this.imageUrl,
      required this.avatarImageUrl})
      : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile of ${widget.nickname}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 48,
          ),
          Center(
            child: Text(
              '@${widget.nickname}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              const SizedBox(
                width: 36,
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(widget.avatarImageUrl),
              ),
              const SizedBox(
                width: 100,
              ),
              ElevatedButton(
                onPressed: _isButtonPressed
                    ? null
                    : () {
                        setState(() {
                          _isButtonPressed = true;
                        });
                        Provider.of<UserSubscribedModel>(context, listen: false)
                            .addNickname(widget.nickname);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isButtonPressed ? Colors.grey : null,
                ),
                child: Text(_isButtonPressed ? 'Subscribed♥' : 'Subscribe'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
