import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/experience_field.dart';
import '../widget/rating_widget.dart';


class EducationView extends StatelessWidget {
  const EducationView({Key? key}) : super(key: key);

  final bool isEducation = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            RatingsWidget(
              title: 'Web Developer',
              year: '2022',
            ),
            SizedBox(width: 15),
            RatingsWidget(
              title: 'App Developer',
              year: '2022',
            ),
          ],
        ),
        const SizedBox(height: 16),

        const ExperienceWidget(
          text: 'Master in Backend Web',
          education: '2014 - 2016 . University',
          colorIcon: Color(0xffA36FF6),
        ),
      ],
    );
  }
}
