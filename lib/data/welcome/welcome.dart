class WelcomePageModel {
  final String assetPath;
  final String title;
  final String description;
  final bool isLottie;

  WelcomePageModel({
    required this.assetPath,
    required this.title,
    required this.description,
    this.isLottie = false,
  });
}

final List<WelcomePageModel> welcomePages = [
  WelcomePageModel(
    assetPath: "assets/lotties/welcome.json",
    title: "Welcome to Back in Line",
    description:
        "your personal posture assistant to improve your health every day.",
    isLottie: true,
  ),
  WelcomePageModel(
    assetPath: "assets/images/yoga-pose-1.png",
    title: "Maintain Correct Posture",
    description:
        "keep your back straight and shoulders relaxed during your daily activities.",
  ),
  WelcomePageModel(
    assetPath: "assets/images/yoga-pose-2.png",
    title: "Function at Your Best",
    description:
        "good posture improves breathing, circulation, and focus—helping your body work efficiently.",
  ),
  WelcomePageModel(
    assetPath: "assets/images/yoga-pose-3.png",
    title: "Stay Consistent",
    description:
        "consistency is the key to developing long-term healthy habits!",
  ),
];
