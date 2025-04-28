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
        "Your personal posture assistant to improve your health every day.",
    isLottie: true,
  ),
  WelcomePageModel(
    assetPath: "assets/images/temp.jpg",
    title: "Maintain Correct Posture",
    description:
        "Keep your back straight and shoulders relaxed during your daily activities.",
  ),
  WelcomePageModel(
    assetPath: "assets/images/temp.jpg",
    title: "Stretch Frequently",
    description:
        "Take short breaks to stretch your body and refresh your posture.",
  ),
  WelcomePageModel(
    assetPath: "assets/images/temp.jpg",
    title: "Stay Consistent",
    description:
        "Consistency is the key to developing long-term healthy habits!",
  ),
];
