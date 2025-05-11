import 'package:flutter/material.dart';
import 'package:linkedin/widget/custome_searchfield.dart';

class ProfileAppbar extends StatelessWidget implements PreferredSizeWidget {
  String text;
   ProfileAppbar({
    required this.text,
    super.key,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: const Color(0xfff7f7fc),
      leadingWidth: 60,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          )),
      title: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: CustomSearchField(
            
            controller: TextEditingController(),onChanged: (value) {
            
          },hintText:text ,home: false,),
        )
      ),
      titleSpacing: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
                size: 30,
              )),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60); // Set AppBar height
}
