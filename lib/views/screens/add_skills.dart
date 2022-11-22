import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/Providers/cv_provider.dart';
import 'package:resum_app_project/database/controller/skills_controller.dart';
import 'package:resum_app_project/helpers/snackbar.dart';
import 'package:resum_app_project/models/skills_model.dart';

import '../widget/my_button.dart';
import '../widget/my_text_field.dart';

class AddSkillsScreen extends StatefulWidget {
  const AddSkillsScreen({Key? key}) : super(key: key);

  @override
  State<AddSkillsScreen> createState() => _AddSkillsScreenState();
}

class _AddSkillsScreenState extends State<AddSkillsScreen> with SnackBarHelper {
  late TextEditingController skillNameEditingController;
  late TextEditingController percentageEditingController;

  @override
  void initState() {
    skillNameEditingController = TextEditingController();
    percentageEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    skillNameEditingController.dispose();
    percentageEditingController.dispose();
    super.dispose();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Slills',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Skill Name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: skillNameEditingController,
                text: 'Skill Name',
              ),
              const SizedBox(height: 15),
              const Text(
                'Percentage',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: percentageEditingController,
                text: 'Percentage',
                inputType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: SizedBox(
          height: 43,
          child: MyButton(
            text: 'Save',
            onPress: () async {
              await performAddSkill();
            },
            loading: loading,
          ),
        ),
      ),
    );
  }

  Future<void> performAddSkill() async {
    if (checkData()) {
      await addSkill();
    }
  }

  Future<void> addSkill() async {
    setState(() {
      loading = true;
    });
    try {
      var status = await SkillsDbController().create(skill);

      if (status > 0) {
        Provider.of<CvProvider>(context, listen: false).addSkill(skill);
        showSnackBar(
          context,
          message: 'Skill Added Successfully!',
          error: false,
        );
        Navigator.pop(context);
      } else {
        showSnackBar(
          context,
          message: 'Error',
          error: true,
        );
      }
    } catch (e) {}

    setState(() {
      loading = false;
    });
  }

  SkillsModel get skill {
    SkillsModel skill_ = SkillsModel();
    skill_.skillName = skillNameEditingController.text;
    skill_.percent = percentageEditingController.text;
    return skill_;
  }

  bool checkData() {
    if (skillNameEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Enter Skill Name!',
        error: true,
      );
      return false;
    } else if (percentageEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Enter Skill Percentage!',
        error: true,
      );
      return false;
    }
    return true;
  }
}

