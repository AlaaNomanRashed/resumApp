import 'package:flutter/material.dart';

import 'about_me_widget.dart';
import 'education_widget.dart';
import 'experience_widget.dart';

class CustomBarWidget extends StatefulWidget {
  const CustomBarWidget({Key? key}) : super(key: key);

  @override
  State<CustomBarWidget> createState() => _ContainerBarState();
}

class _ContainerBarState extends State<CustomBarWidget> {
  int selectedIndex = 0;
  List<Widget> mainWidget=[
    AboutMeWidget(),
    ExperianceWidget(),
    EducationWidget()
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      'assets/icons/aboutme.png',
                    ),
                    height: 60,
                    width: 60,
                  ),
                  Text(
                    'About Me',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(.7),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 6,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
            },
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      'assets/icons/experience.png',
                    ),
                    height: 60,
                    width: 60,
                  ),
                  Text(
                    'Experience',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(.7),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 6,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                selectedIndex = 3;
              });
            },
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      'assets/icons/education.png',
                    ),
                    height: 60,
                    width: 60,
                  ),
                  Text(
                    'Education',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(.7),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
