import 'package:flutter/material.dart';
import 'package:linkedin/viewmodel/profile_view_model.dart';
import 'package:linkedin/viewmodel/users_view_model.dart';
import 'package:linkedin/widget/custome_appbar.dart';
import 'package:linkedin/widget/custome_searchfield.dart';
import 'package:linkedin/widget/postcard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    final usersViewModel = Provider.of<UsersViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xfff7f7fc),
      appBar: const CustomeAppbar(
        home: true,
      ),
      body: Column(
        children: [
          Padding(
        padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
            child: CustomSearchField(
              controller: TextEditingController(),
              onChanged: (value) {
                print("Searching for $value");
              },
            ),
          ),
          Padding(
        padding: const EdgeInsets.only(left: 5, right: 10),
            child: SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: usersViewModel.users.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(children: [
                        _buildProfileCircle("assets/profile.png"),
                        Positioned(
                          top: MediaQuery.of(context).size.height/12,
                          left:MediaQuery.of(context).size.width/9,
                          child: Container(
                            decoration:  BoxDecoration(
                              border: Border.all(color: Colors.white,width: 3),
                                color: Colors.blue, shape: BoxShape.circle),
                            child: 
                                const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                )
                          ),
                        )
                      ]),
                    );
                  } else {
                    final users = usersViewModel.users[index - 1];
                  
                    return _buildProfileCircle(users.profilepic);
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: profileViewModel.posts.length,
              itemBuilder: (context, index) {
                final post = profileViewModel.posts[index];
                return PostCard(username: post.userName,userprofile: post.profilepic,postimage: post.postpic,headline: post.headline,content: post.content,timeAgo: post.timeAgo,);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildProfileCircle(String imagePath) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xff3889b2), width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
            height: 100,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      imagePath,
                    ),
                    fit: BoxFit.contain,
                    scale: 50))),
      ),
    ),
  );
}
