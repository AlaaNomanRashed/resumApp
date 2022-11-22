import 'package:flutter/material.dart';

import '../../models/interests_model.dart';

class OneInterestsWidget extends StatelessWidget {
  const OneInterestsWidget({Key? key, required this.interests}) : super(key: key);
  final InterestsModel interests;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.black.withOpacity(0.1)),
      child: Text(
        interests.interestsName,
        style: const TextStyle(fontSize: 19),
      ),
    );
  }
}
