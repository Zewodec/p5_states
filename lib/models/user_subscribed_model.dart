import 'package:flutter/cupertino.dart';

class UserSubscribedModel extends ChangeNotifier {
  Set<String> nicknames = {};

  void addNickname(String nickname) {
    nicknames.add(nickname);
    notifyListeners();
  }

  void clearAllNickNames() {
    nicknames.clear();
    notifyListeners();
  }

  get nicknamesList => nicknames.toList();
}
