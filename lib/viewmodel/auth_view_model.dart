import 'package:flutter/material.dart';
import 'package:linkedin/model/user_model.dart';
import 'package:linkedin/view/Mainpage.dart';

class AuthViewModel extends ChangeNotifier {
  UserModel? _user;
  final Map<String, String> _dummyUsers = {};

  UserModel? get user => _user;

  void login(String email, String password, BuildContext context) {
    if (_dummyUsers.containsKey(email) && _dummyUsers[email] == password) {
      _user = UserModel(
          email: email,
          password: password,
          name: email.split('@')[0],
          headline: 'Freelance IOS Developer | UIKit | SwiftUI |',
          location: 'Colombo, Srilanka',
          work: "Lean transition solutions - lts",
                    languages: "Talks about #swiftui, and#iosdevelopment",

          followers: 4413,
          connection: 500);
      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const Mainpage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email or password'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void signup(String email, String password, BuildContext context) {
    if (_dummyUsers.containsKey(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email already registered'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (email.isNotEmpty && password.length >= 6) {
      _dummyUsers[email] = password;
      _user = UserModel(
          email: email,
          password: password,
          name: email.split('@')[0],
          headline: 'Freelance IOS Developer | UIKit | SwiftUI |',
          location: 'Colombo, Srilanka',
          languages: "Talks about #swiftui, and#iosdevelopment",
          work: "Lean transition solutions - lts",
          followers: 4413,
          connection: 500);
      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const Mainpage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email or password'),
        ),
      );
    }
  }
}
