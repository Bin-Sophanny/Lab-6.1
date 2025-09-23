import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSizes.smallPadding),
          
          // Travel and Recreation Section
          const Text(
            'Travel and Recreation',
            style: AppTextStyles.boldTitle,
          ),
          const SizedBox(height: AppSizes.smallPadding),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _taskCard('Vacation'),
                const SizedBox(width: AppSizes.smallPadding),
                _taskCard('Countries'),
                const SizedBox(width: AppSizes.smallPadding),
                _taskCard('Excursion'),
                const SizedBox(width: AppSizes.smallPadding),
              ],
            ),
          ),
          
          const SizedBox(height: AppSizes.defaultPadding),
          
          // Sport and Fitness Section
          const Text(
            'Sport and Fitness',
            style: AppTextStyles.boldTitle,
          ),
          const SizedBox(height: AppSizes.smallPadding),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _taskCard('Fitness and\nhealth'),
                const SizedBox(width: AppSizes.smallPadding),
                _taskCard('Skiing'),
                const SizedBox(width: AppSizes.smallPadding),
                _taskCard('Cycling'),
                const SizedBox(width: AppSizes.smallPadding),
              ],
            ),
          ),
          
          const SizedBox(height: AppSizes.defaultPadding),
          
          // Hobbies and leisure Section
          const Text(
            'Hobbies and leisure',
            style: AppTextStyles.boldTitle,
          ),
          const SizedBox(height: AppSizes.smallPadding),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _taskCard('Music'),
                const SizedBox(width: AppSizes.smallPadding),
                _taskCard('Fishing'),
                const SizedBox(width: AppSizes.smallPadding),
                _taskCard('Arts'),
                const SizedBox(width: AppSizes.smallPadding),
              ],
            ),
          ),
          
          const SizedBox(height: AppSizes.defaultPadding),
          
          // Nature Section
          const Text(
            'Nature',
            style: AppTextStyles.boldTitle,
          ),
          const SizedBox(height: AppSizes.smallPadding),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _taskCard('Seasons'),
                const SizedBox(width: AppSizes.smallPadding),
                _taskCard('Winter'),
                const SizedBox(width: AppSizes.smallPadding),
                _taskCard('Spring'),
                const SizedBox(width: AppSizes.smallPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _taskCard(String title) {
    return Card(
      color: AppColors.cardBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardBorderRadius)),
      child: Container(
        width: 150, // Fixed wider width for better swiping
        height: 140,
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.boldTitle.copyWith(fontSize: 14),
            ),
            const Spacer(),
            // Image based on title
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipOval(
                  child: _getImageForTitle(title),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getImageForTitle(String title) {
    // Use icons directly for better performance
    return Icon(
      _getIconForTitle(title),
      color: AppColors.textPrimary,
      size: 35,
    );
  }

  IconData _getIconForTitle(String title) {
    switch (title.toLowerCase()) {
      // Travel and Recreation
      case 'vacation':
        return Icons.beach_access;
      case 'countries':
        return Icons.public;
      case 'excursion':
        return Icons.tour;
      
      // Sport and Fitness
      case 'fitness and\nhealth':
        return Icons.fitness_center;
      case 'skiing':
        return Icons.downhill_skiing;
      case 'cycling':
        return Icons.pedal_bike;
      
      // Hobbies and leisure
      case 'music':
        return Icons.music_note;
      case 'fishing':
        return Icons.set_meal; // closest to fishing
      case 'arts':
        return Icons.palette;
      
      // Nature
      case 'seasons':
        return Icons.wb_sunny;
      case 'winter':
        return Icons.ac_unit;
      case 'spring':
        return Icons.local_florist;
      
      default:
        return Icons.image_outlined;
    }
  }
}