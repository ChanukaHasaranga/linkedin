import 'package:flutter/material.dart';
import 'package:linkedin/model/post_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final List<PostModel> _posts = [
    PostModel(
      userName: 'John Doe',
      headline: 'Software Engineer at Tech Corp',
      content: 'Excited to share my latest project!',
      timeAgo: '2h ago',
      profilepic: "assets/user3.png",
      postpic: "assets/post1.jpg"

    ),
    PostModel(
      userName: 'Jane Smith',
      headline: 'Product Manager',
      content: 'Launching our new feature today!',
      timeAgo: '5h ago',
      postpic: "assets/post2.png",
      profilepic: "assets/user2.png"
    ),
  ];

  List<PostModel> get posts => _posts;
}
