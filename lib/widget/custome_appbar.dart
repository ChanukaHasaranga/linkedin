import 'package:flutter/material.dart';
import 'package:linkedin/view/profilepage.dart';

class CustomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool home;
  const CustomeAppbar({super.key, this.home = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: home ? const Color(0xfff7f7fc): Colors.white,
      leadingWidth: 60,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      leading: home
          ? Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 8, bottom: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                    return const ProfilePage();
                  },));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/profile.png"),
                        fit: BoxFit.contain),
                    shape: BoxShape.circle,
                  ),
                ),
              ))
          : null,
      title: Align(
        alignment: Alignment.center,
        child: Container(
          width: 100,
          height: 45,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/linkedinlogo.png"))),
        ),
      ),
      actions: [
        home
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Stack(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          color: Color.fromARGB(255, 198, 202, 202),
                          size: 30,
                        )),
                    Positioned(
                      top: 13,
                      left: 26,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color.fromARGB(255, 195, 40, 29)),
                      ),
                    )
                  ],
                ),
              )
            : Container()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60); // Set AppBar height
}
