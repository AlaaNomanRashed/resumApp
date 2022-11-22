import 'package:flutter/material.dart';
import '../widget/experience_field.dart';

class ExperianceView extends StatelessWidget {
  ExperianceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ExperienceWidget(
          text: 'Freelance Web Designer',
          education: '',
          colorIcon: Colors.deepOrange,
        ),
        ExperienceWidget(
          text: 'Senior Web Developer',
          colorIcon: Colors.teal,
          education: '',
        ),
        ExperienceWidget(
          text: 'Mobile Developer',
          colorIcon: Colors.green,
          education: '2019 - 2022',
        ),
      ],
    );
  }
}
