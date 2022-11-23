import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/Providers/cv_provider.dart';
import 'package:resum_app_project/helpers/snackbar.dart';
import 'package:resum_app_project/models/experience_model.dart';

import '../../database/controller/experience_controller.dart';
import '../widget/my_button.dart';
import '../widget/my_text_field.dart';

class UpdateExperience extends StatefulWidget {
  final ExperienceModel experience;
  const UpdateExperience({Key? key, required this.experience})
      : super(key: key);

  @override
  State<UpdateExperience> createState() => _UpdateExperienceState();
}

enum TypeOfExperience { experience, rating, education }

class _UpdateExperienceState extends State<UpdateExperience>
    with SnackBarHelper {
  late TextEditingController nameEditingController;
  late TextEditingController bodyEditingController;

  var selectedExperience = 'experience';

  @override
  void initState() {
    nameEditingController = TextEditingController(text: widget.experience.name);
    bodyEditingController = TextEditingController(text: widget.experience.body);
    super.initState();
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    bodyEditingController.dispose();
    super.dispose();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Experiense',
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
                'Experience New Name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: nameEditingController,
                text: 'Experience New Name',
              ),
              const SizedBox(height: 15),
              const Text(
                'Select type of experience',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButton(
                  items: ['experience', 'rating', 'education']
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text('$e'),
                          ))
                      .toList(),
                  onChanged: (experienceSelected) {
                    //selectedExperience = experienceSelected;
                    ///
                  }),
              const SizedBox(height: 15),
              const Text(
                'update my experience',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: bodyEditingController,
                text: 'update my experience',
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
            text: 'Update',
            onPress: () async {
              await performUpdateExperience();
            },
            loading: loading,
          ),
        ),
      ),
    );
  }

  Future<void> performUpdateExperience() async {
    if (checkData()) {
      await UpdateExperience();
    }
  }

  Future<void> UpdateExperience() async {
    setState(() {
      loading = true;
    });
    try {
      var status = await ExperienceDbController().create(experienceModel);
      if (status == true) {
        Provider.of<CvProvider>(context, listen: false)
            .updateExperience(experienceModel);
        var newExperience =
            await ExperienceDbController().update(experienceModel);

        showSnackBar(
          context,
          message: 'Experience Added Successfully!',
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
    } catch (e) {
      // TODO
    }
    setState(() {
      loading = false;
    });
  }

  ExperienceModel get experienceModel {
    ExperienceModel experience_ = ExperienceModel();
    experience_.name = nameEditingController.text;
    experience_.body = bodyEditingController.text;
    return experience_;
  }

  bool checkData() {
    if (nameEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Enter Experience Name!',
        error: true,
      );
      return false;
    } else if (bodyEditingController.text.isEmpty) {
      showSnackBar(
        context,
        message: 'Enter Experience Percentage!',
        error: true,
      );
      return false;
    }
    return true;
  }
}
