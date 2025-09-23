import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class GrammarScreen extends StatelessWidget {
  const GrammarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20), // Added top spacing
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.cardPadding),
            children: [
              _grammarTopicCard('Present Continuous', '0/7'),
              _grammarTopicCard('Past Continuous', '0/7'),
              _grammarTopicCard('Conjunctions and articles', '0/7'),
              _grammarTopicCard('Present Perfect', '0/7'),
              _grammarTopicCard('Modal verbs', '0/7'),
              _grammarTopicCard('Something/anything/nothing', '0/7'),
              _grammarTopicCard('Too/enough', '0/7'),
              _grammarTopicCard('Will/wont', '0/7'),
              _grammarTopicCard('Consumption of the infinitive', '0/7'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _grammarTopicCard(String title, String progress) {
    return Card(
      color: AppColors.cardBlue,
      margin: const EdgeInsets.symmetric(vertical: AppSizes.tinyPadding),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardBorderRadius)),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.boldTitle.copyWith(fontSize: 14),
              ),
            ),
            Text(
              progress,
              style: AppTextStyles.boldTitle.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}