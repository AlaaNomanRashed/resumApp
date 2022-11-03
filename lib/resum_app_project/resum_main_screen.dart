import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resum_app_project/resum_app_project/views/screen/custom_body.dart';

class ResumMainScreen extends StatelessWidget {
  const ResumMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomBody(),
    );
  }
}
