import 'package:flutter/material.dart';
import 'package:p5_states/user_profile.dart';

class InstagramPost extends StatelessWidget {
  final String nickname;
  final String imageUrl;
  final int likes;
  final List<String> comments;

  const InstagramPost({
    super.key,
    required this.nickname,
    required this.imageUrl,
    required this.likes,
    required this.comments,
  });

  get avatarImageURL => 'https://picsum.photos/300';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.0,
                backgroundImage: NetworkImage(avatarImageURL),
              ),
              const SizedBox(width: 16.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfile(
                        nickname: nickname,
                        imageUrl: imageUrl,
                        avatarImageUrl: avatarImageURL,
                      ),
                      // ),
                    ),
                  );
                },
                child: Text(
                  nickname,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.favorite_border),
                  const SizedBox(width: 8.0),
                  Text('$likes'),
                ],
              ),
              const Icon(Icons.comment),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            comments.join('\n'),
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
