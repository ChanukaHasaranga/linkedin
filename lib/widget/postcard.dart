import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final String userprofile;
  final String username;
  final String postimage;
  final String headline;
  final String timeAgo;
  final String content;

  const PostCard(
      {required this.userprofile,
      required this.username,
      required this.postimage,
      required this.headline,
      required this.content,
      required this.timeAgo,
      super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isclicked=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xfffefefe),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(widget.userprofile),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.username,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15,color: Color(0xff003e4a),height: 1.3,)),
                      Text(widget.headline, style: const TextStyle(color: Color(0xff568189),fontSize: 13,height: 1.2,)),
                      Text(widget.timeAgo,
                          style: const TextStyle(color: Color.fromARGB(255, 140, 162, 166), fontSize: 12,height: 1.0,)),
                    ],
                  ),
                ),
                const Icon(Icons.more_vert,color: Color(0xff003f4a),)
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.content,
              style: const TextStyle(fontSize: 13,color: Color(0xff15515c),fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.postimage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 58,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: AssetImage("assets/user1.png"),
                          ),
                          Positioned(
                            left: 16,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundImage: AssetImage("assets/user2.png"),
                            ),
                          ),
                          Positioned(
                            left: 32,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundImage: AssetImage("assets/user3.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("Liked by Budi and 97 others",
                        style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 69, 106, 120))),
                  ],
                ),
                Text("77 comments",
                    style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 69, 106, 120))),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isclicked=!isclicked;
                        });
                      },
                      child: Icon(Icons.thumb_up_alt,
                          color:isclicked?const Color.fromARGB(255, 22, 119, 157):
                           const Color(0xffcbe2ee)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(Icons.comment,
                        color: Color(0xffcbe2ee)),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(Icons.send, color: Color(0xffcbe2ee)),
                  ],
                ),
                const Icon(Icons.save, color: Color(0xffcbe2ee)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
