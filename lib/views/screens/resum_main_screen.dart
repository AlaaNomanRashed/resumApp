import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/Providers/cv_provider.dart';
import 'package:resum_app_project/database/controller/skills_controller.dart';
import '../widget/custom_bar_widget.dart';

class ResumMainScreen extends StatefulWidget {
  const ResumMainScreen({Key? key}) : super(key: key);

  @override
  State<ResumMainScreen> createState() => _ResumMainScreenState();
}

class _ResumMainScreenState extends State<ResumMainScreen> {
  @override
  void initState() {
    super.initState();
    saveData();
  }

  Future<void> saveData() async {
    /// Skills
    var skills = await SkillsDbController().read();

    for (int i = 0; i < skills.length; i++) {
      Provider.of<CvProvider>(context, listen: false).addSkill(skills[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          right: 15,
          left: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'About Me',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Expanded(child: CustomBarWidget()),
          ],
        ),
      ),
    );
  }
}
