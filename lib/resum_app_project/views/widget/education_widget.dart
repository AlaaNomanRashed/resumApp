import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
      width: double.infinity,
      color: Colors.blue.shade200,
      child: const Center(child: Text('Container 2 Content')),
    );
  }
}
