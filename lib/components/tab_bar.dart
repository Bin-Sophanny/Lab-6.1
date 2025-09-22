import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int)? onTabSelected;

  const CustomTabBar({
    super.key,
    required this.tabs,
    this.selectedIndex = 0,
    this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tabs.asMap().entries.map((entry) {
          int index = entry.key;
          String tab = entry.value;
          bool isSelected = index == selectedIndex;
          
          return GestureDetector(
            onTap: () => onTabSelected?.call(index),
            child: Text(
              tab,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 16,
                color: isSelected 
                    ? AppColors.textPrimary 
                    : index == tabs.length - 1 
                        ? AppColors.textTertiary 
                        : AppColors.textSecondary,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}