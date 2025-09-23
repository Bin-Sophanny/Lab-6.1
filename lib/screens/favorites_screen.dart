import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteTopics = [
      {'title': 'Vacation', 'count': '370', 'icon': Icons.beach_access},
      {'title': 'Completed Topics', 'count': '6', 'icon': Icons.check_circle_outline},
      {'title': 'Today\'s Topics', 'count': '1', 'icon': Icons.today},
      {'title': 'Grammar Learned', 'count': '3', 'icon': Icons.school},
      {'title': 'Grammar to Learn', 'count': '2', 'icon': Icons.menu_book},
      {'title': 'Music', 'count': '12', 'icon': Icons.music_note},
      {'title': 'Books', 'count': '14', 'icon': Icons.book},
      {'title': 'News', 'count': '4', 'icon': Icons.newspaper},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),
        itemCount: favoriteTopics.length,
        itemBuilder: (context, index) {
          final topic = favoriteTopics[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardBlue.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic['title'] as String,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black, // Black title as requested
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      topic['count'] as String,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      topic['icon'] as IconData,
                      size: 32,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}