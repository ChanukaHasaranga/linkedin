import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double iconSize = screenWidth * 0.06;

    const Color selectedColor = Color(0xFF0073B1);
    const Color unselectedIconColor = Color.fromARGB(255, 131, 165, 183);

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      notchMargin: 8.0,
      color: Colors.white,
      elevation: 10,
        clipBehavior: Clip.antiAlias,

      child: SizedBox(
        height: screenWidth * 0.22,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 0, iconSize, selectedColor, unselectedIconColor),
            _buildNavItem(Icons.people_alt, 1, iconSize, selectedColor, unselectedIconColor),
             Container(width: 48,color: Colors.transparent,),
            _buildNavItem(Icons.message_rounded, 2, iconSize, selectedColor, unselectedIconColor),
            _buildNavItem(Icons.work, 3, iconSize, selectedColor, unselectedIconColor),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    int index,
    double iconSize,
    Color selectedColor,
    Color unselectedColor,
  ) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Icon(
        icon,
        size: iconSize,
        color: currentIndex == index ? selectedColor : unselectedColor,
      ),
    );
  }
}
