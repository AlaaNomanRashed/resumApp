import 'package:flutter/material.dart';

class ContainerTextWidget extends StatelessWidget {
  const ContainerTextWidget({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black.withOpacity(0.1)
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 22
        ),
      ),
    );
  }
}
