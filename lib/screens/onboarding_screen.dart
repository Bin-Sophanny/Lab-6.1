import 'package:flutter/material.dart';
import 'package:lab_6_1/components/onboardingpage.dart';
import 'package:lab_6_1/screens/homescreen.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onDotClicked(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC5E5F3),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // PageView for swipe functionality
            SizedBox(
              height: 400,
              child: PageView.builder(
                controller: _pageController,
                itemCount: contents.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    contents[index].imagePath,
                    height: 300,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.image,
                          size: 100,
                          color: Colors.grey[500],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 70),
            // Title text that changes with page
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                contents[_currentPage].title,
                key: ValueKey<int>(_currentPage),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 30),
            // Interactive page indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => GestureDetector(
                  onTap: () => _onDotClicked(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: _currentPage == index ? 16 : 12,
                    height: _currentPage == index ? 16 : 12,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? const Color(0xFF67C2E9)
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ),
            ),
            const SizedBox(height: 20),
            // Start button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF67C2E9),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Sign In text button
            TextButton(
              onPressed: () {},
              child: const Text(
                'Already have an account? Sign In',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
