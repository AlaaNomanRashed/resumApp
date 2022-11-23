import 'package:flutter/material.dart';

import '../../models/experience_model.dart';

class OneRatingsWidget extends StatelessWidget {
  const OneRatingsWidget({
    Key? key, required this.experience,
  }) : super(key: key);

 final ExperienceModel experience;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
            width: 1.4,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star_outlined,
              color: Color(0xffA36FF6),
              size: 44,
            ),
            const SizedBox(height: 5),
            Text(
              '${experience.name}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${experience.body}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
