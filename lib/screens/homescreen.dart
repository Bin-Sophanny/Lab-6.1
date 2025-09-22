import 'package:flutter/material.dart';
import '../widgets/lesson_card.dart';
import '../components/search_bar.dart';
import '../components/tab_bar.dart';
import '../components/bottom_navigation.dart';
import '../constants/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchBar(),
            const CustomTabBar(
              tabs: ['Your plan', 'Task', 'Grammar', 'Favorites'],
              selectedIndex: 0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.defaultPadding, 
                vertical: AppSizes.smallPadding
              ),
              child: Text('Level A2', style: AppTextStyles.boldTitle),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.cardPadding),
                children: const [
                  LessonCard(
                    title: 'Lesson 1',
                    deadline: '02/11/2023',
                    grammar: 'Conjunctions and articles',
                    grammarProgress: '8/8',
                    task: 'Travel and Vacation',
                    taskProgress: '4/4',
                    percent: 1.0,
                    percentText: '100% completed',
                    percentColor: AppColors.progressGreen,
                  ),
                  LessonCard(
                    title: 'Task 2',
                    deadline: '12/11/2023',
                    grammar: 'Present Continuous',
                    grammarProgress: '5/8',
                    task: 'Holiday',
                    taskProgress: '2/5',
                    percent: 0.6,
                    percentText: '60% completed',
                    percentColor: AppColors.progressYellow,
                  ),
                  LessonCard(
                    title: 'Task 3',
                    deadline: '24/11/2023',
                    grammar: 'Present Perfect',
                    grammarProgress: '0/8',
                    task: 'Business',
                    taskProgress: '0/5',
                    percent: 0.0,
                    percentText: '0% completed',
                    percentColor: AppColors.progressRed,
                  ),
                  LessonCard(
                    title: 'Task 4',
                    deadline: '01/12/2023',
                    grammar: 'Model verbs',
                    grammarProgress: '0/8',
                    task: 'work and professions',
                    taskProgress: '0/6',
                    percent: 0.0,
                    percentText: '0% completed',
                    percentColor: AppColors.progressRed,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
