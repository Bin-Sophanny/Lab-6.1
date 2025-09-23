import 'package:flutter/material.dart';
import '../components/search_bar.dart';
import '../components/bottom_navigation.dart';
import '../constants/app_constants.dart';
import 'your_plan_screen.dart';
import 'task_screen.dart';
import 'grammar_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  final List<String> _tabs = ['Your plan', 'Task', 'Grammar', 'Favorites'];
  final List<Widget> _screens = [
    const YourPlanScreen(),
    const TaskScreen(),
    const GrammarScreen(),
    const FavoritesScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchBar(),
            // Custom Tab Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _tabs.asMap().entries.map((entry) {
                  int index = entry.key;
                  String tab = entry.value;
                  bool isSelected = index == _selectedTabIndex;
                  
                  return GestureDetector(
                    onTap: () {
                      _tabController.animateTo(index);
                    },
                    child: Text(
                      tab,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        fontSize: 16,
                        color: isSelected 
                            ? AppColors.textPrimary 
                            : index == _tabs.length - 1 
                                ? AppColors.textTertiary 
                                : AppColors.textSecondary,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Tab Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _screens,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
