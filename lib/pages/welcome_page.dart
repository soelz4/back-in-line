import 'package:back_in_line/data/welcome/welcome.dart';
import 'package:back_in_line/widgets/welcome/dot_indicator.dart';
import 'package:back_in_line/widgets/welcome/get_started_button.dart';
import 'package:back_in_line/widgets/welcome/welcome_content.dart';
import 'package:flutter/material.dart';
import 'package:back_in_line/data/notifiers.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController welcomePageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: ValueListenableBuilder<int>(
              valueListenable: currentWelcomePageNotifier,
              builder: (context, value, child) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.55,
                        child: PageView.builder(
                          controller: welcomePageViewController,
                          itemCount: welcomePages.length,
                          physics: const BouncingScrollPhysics(),
                          onPageChanged:
                              (val) => currentWelcomePageNotifier.value = val,
                          itemBuilder: (context, index) {
                            return WelcomePageContent(
                              page: welcomePages[index],
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                            );
                          },
                        ),
                      ),
                      DotIndicator(currentPage: value),
                      GetStartedButton(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
