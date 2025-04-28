import 'package:back_in_line/data/notifiers.dart';
import 'package:back_in_line/pages/welcome/widgets/welcome_dots.dart';
import 'package:back_in_line/pages/welcome/widgets/welcome_get_started_button.dart';
import 'package:back_in_line/pages/welcome/widgets/welcome_pageview.dart';
import 'package:flutter/material.dart';

Widget buildBody(BuildContext context) => SingleChildScrollView(
  child: ConstrainedBox(
    constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
    child: ValueListenableBuilder<int>(
      valueListenable: currentWelcomePage,
      builder: (context, value, child) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildWelcomePageView(context),
              buildDotIndicator(),
              buildGetStartedButton(context),
            ],
          ),
        );
      },
    ),
  ),
);
