import 'package:flutter/material.dart';
import 'package:shopping_app/core/theme/color_manager.dart';

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    super.key,
    required this.imagePath,
    required this.isSelected,
  });

  final String imagePath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? ColorManager.white : Colors.transparent,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(8),
      child: ImageIcon(
        size: 30,
        AssetImage(imagePath),
        color: isSelected ? Theme.of(context).primaryColor : ColorManager.white,
      ),
    );
  }
}
