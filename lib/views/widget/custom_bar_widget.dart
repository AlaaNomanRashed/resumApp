import 'package:flutter/material.dart';
import '../screens/about_me_view.dart';
import '../screens/rating_and_education_view.dart';
import '../screens/experience_view.dart';
import 'main_screen_up_container.dart';

class CustomBarWidget extends StatefulWidget {
  const CustomBarWidget({Key? key}) : super(key: key);

  @override
  State<CustomBarWidget> createState() => _ContainerBarState();
}

class _ContainerBarState extends State<CustomBarWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Expanded(
              child: MainScreenUpContainer(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                title: 'About Me',
                icon: Icons.person_outline_rounded,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: MainScreenUpContainer(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                title: 'Experience',
                icon: Icons.work_outline_outlined,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: MainScreenUpContainer(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                title: 'Education',
                icon: Icons.stacked_line_chart_sharp,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        [
          const AboutMeView(),
          ExperienceView(),
          const EducationView(),
        ][selectedIndex]
      ],
    );
  }
}
