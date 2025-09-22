import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class LessonCard extends StatelessWidget {
  final String title;
  final String deadline;
  final String grammar;
  final String grammarProgress;
  final String task;
  final String taskProgress;
  final double percent;
  final String percentText;
  final Color percentColor;

  const LessonCard({
    super.key,
    required this.title,
    required this.deadline,
    required this.grammar,
    required this.grammarProgress,
    required this.task,
    required this.taskProgress,
    required this.percent,
    required this.percentText,
    required this.percentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBlue,
      margin: const EdgeInsets.symmetric(vertical: AppSizes.smallPadding),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardBorderRadius)),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppTextStyles.boldTitle),
                Text('Deadline: $deadline', style: AppTextStyles.smallText),
              ],
            ),
            const SizedBox(height: AppSizes.smallPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Icon(Icons.circle, size: AppSizes.bulletSize, color: AppColors.textPrimary),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyles.boldSmallText,
                      children: [
                        const TextSpan(text: 'Gramma: '),
                        TextSpan(
                          text: grammar,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(grammarProgress, style: AppTextStyles.boldSmallText),
              ],
            ),
            const SizedBox(height: AppSizes.tinyPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Icon(Icons.circle, size: AppSizes.bulletSize, color: AppColors.textPrimary),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyles.boldSmallText,
                      children: [
                        const TextSpan(text: 'Task: '),
                        TextSpan(
                          text: task,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(taskProgress, style: AppTextStyles.boldSmallText),
              ],
            ),
            const SizedBox(height: AppSizes.smallPadding),
            Stack(
              children: [
                SizedBox(
                  height: AppSizes.progressBarHeight + 20, // Extra height for text
                  child: Column(
                    children: [
                      // Text positioned above progress bar
                      SizedBox(
                        height: 14, // Height for text
                        child: Align(
                          alignment: Alignment(
                            (percent * 2) - 1, // Convert 0-1 to -1 to 1 range
                            0,
                          ),
                          child: Text(
                            percentText,
                            style: AppTextStyles.tinyText,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSizes.tinyPadding),
                      // Progress bar
                      SizedBox(
                        height: AppSizes.progressBarHeight,
                        child: LinearProgressIndicator(
                          value: percent,
                          backgroundColor: AppColors.backgroundWhite,
                          valueColor: AlwaysStoppedAnimation<Color>(percentColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}