import 'package:flutter/material.dart';
import 'package:resum_app_project/resum_app_project/resum_main_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
     home: ResumMainScreen(),
    );
  }

}
/*
Expanded(
                  child: (selectedIndex == 1)
                      ? buildContainer1()
                      : ((selectedIndex == 2)
                      ? buildContainer2()
                      : buildContainer3()),
                ),
 */