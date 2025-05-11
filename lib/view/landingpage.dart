import 'package:flutter/material.dart';
import 'package:linkedin/view/loginpage.dart';
import 'package:linkedin/view/signuppage.dart';
import 'package:linkedin/widget/custome_appbar.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomeAppbar(
        home: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  children: [
                    _buildPage(
                      context,
                      img: "assets/1.jpg",
                    ),
                    _buildPage(
                      context,
                      img: "assets/2.jpg",
                    ),
                    _buildPage(
                      context,
                      img: 'assets/3.jpg',
                    ),
                  ],
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height / 4.5,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (_currentPage == 1 ||
                          _currentPage == 2) // Left arrow on pages 2 and 3
                        Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF0073B1)),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white, size: 20),
                            onPressed: () => _navigateToPage(_currentPage - 1),
                          ),
                        ),
                      if (_currentPage == 0 ||
                          _currentPage == 1) // Right arrow on pages 1 and 2
                        Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF0073B1)),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward,
                                color: Colors.white, size: 20),
                            onPressed: () => _navigateToPage(_currentPage + 1),
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 12 : 8,
                        height: _currentPage == index ? 3 : 2,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? const Color(0xFF0073B1)
                              : const Color.fromARGB(255, 117, 187, 244),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return const Signuppage();
                      },
                    ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Color(0xFF0073B1),
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    backgroundColor: const Color(0xFF0073B1),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                  )),
            ],
          ))
        ],
      ),
    );
  }
}

Widget _buildPage(
  BuildContext context, {
  required String img,
}) {
  return Container(
    decoration: const BoxDecoration(color: Colors.white),
    child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(img), fit: BoxFit.cover)),
          ),
          const SizedBox(height: 90),
          const Text(
            "Land your Job",
            style: TextStyle(
                color: Color.fromARGB(255, 6, 57, 99),
                fontSize: 25,
                fontWeight: FontWeight.w900),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Text(
              'Connect, Apply and Get Hired with your favourite job around the world',
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 136, 135, 135),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
