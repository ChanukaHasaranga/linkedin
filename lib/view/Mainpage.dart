


import 'package:flutter/material.dart';
import 'package:linkedin/view/homepage.dart';
import 'package:linkedin/view/testpage1.dart';
import 'package:linkedin/view/testpage2.dart';
import 'package:linkedin/view/testpage3.dart';
import 'package:linkedin/widget/custome_bottomnav.dart';

class Mainpage extends StatefulWidget {
  final int initialIndex;

  const Mainpage({super.key, this.initialIndex = 0});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  late int _selectedIndex;
  late PageController _pageController;

  Future<void> _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index); // Navigate to the selected page
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController =
        PageController(initialPage: _selectedIndex); // Proper initialization
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true, 
      floatingActionButton:MediaQuery.of(context).viewInsets.bottom == 0?
      
       Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: FloatingActionButton(
          splashColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
          },
          backgroundColor: const Color(0xFF0073B1),
          child: const Icon(Icons.add),
        ),
      ):null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
   
   
   
   
      body: Stack(
        children: [
          PageView(
            
            physics: const NeverScrollableScrollPhysics(), // Disable swipe

            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: const [HomePage(), Testpage1(), Testpage2(), Testpage3()],
          ),
        ],
      ),
    );
  }
}
