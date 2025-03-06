import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/features/home/presentation/widgets/nav_bar_icon.dart';

Widget customBottomNavigationBar({
  required int selectedIndex,
  required void Function(int)? onTap,
  required BuildContext context,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15.r),
      topRight: Radius.circular(15.r),
    ),
    child: Theme(
      data: Theme.of(context).copyWith(
        shadowColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        onTap: onTap,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: NavBarIcon(
              imagePath: 'assets/images/home.png',
              isSelected: selectedIndex == 0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(
              imagePath: 'assets/images/category.png',
              isSelected: selectedIndex == 1,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(
              imagePath: 'assets/images/fav.png',
              isSelected: selectedIndex == 2,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(
              imagePath: 'assets/images/profile.png',
              isSelected: selectedIndex == 3,
            ),
            label: '',
          ),
        ],
      ),
    ),
  );
}
