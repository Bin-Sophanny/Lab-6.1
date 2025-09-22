class OnboardingPage {
  final String title;
  final String imagePath;

  const OnboardingPage({
    required this.title,
    required this.imagePath,
  });
}

List<OnboardingPage> contents = [
  const OnboardingPage(
    title: 'Watch Movies and read\noriginal books',
    imagePath: 'assets/onboarding_image 1.png',
  ),
  const OnboardingPage(
    title: 'Discover new stories\nfrom around the world',
    imagePath: 'assets/onboarding_image 2.png',
  ),
  const OnboardingPage(
    title: 'Create your personal\nreading collection',
    imagePath: 'assets/onboarding_image 3.png',
  ),
];
