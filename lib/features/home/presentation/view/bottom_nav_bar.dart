import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mypcot/core/utilities/constants/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem("assets/icons/Group 910.svg", 'Home', 0),
            _buildNavItem("assets/icons/Group 912.svg", 'Customers', 1),
            const SizedBox(width: 40), // Space for FAB
            _buildNavItem("assets/icons/Group 913.svg", 'Khata', 2),
            _buildNavItem("assets/icons/Group 914.svg", 'Orders', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String assetPath, String label, int index) {
    final bool isSelected = selectedIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assetPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppColors.fontColor
                    : AppColors.fontColor.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? AppColors.fontColor
                    : AppColors.fontColor.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
