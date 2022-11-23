import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/Providers/cv_provider.dart';
import 'package:resum_app_project/helpers/snackbar.dart';
import 'package:resum_app_project/models/experience_model.dart';

import '../../database/controller/experience_controller.dart';
import '../widget/my_button.dart';
import '../widget/my_text_field.dart';

class AddExperience extends StatefulWidget {
  const AddExperience({Key? key}) : super(key: key);

  @override
  State<AddExperience> createState() => _AddExperienceState();
}

enum TypeOfExperience{
  experience ,
  rating ,
  education
}

class _AddExperienceState extends State<AddExperience> with SnackBarHelper {
  late TextEditingController nameEditingController;
  late TextEditingController bodyEditingController;

  var selectedExperience = 'experience';

  @override
  void initState() {
    nameEditingController = TextEditingController();
    bodyEditingController = TextEditingController();
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
                'experience Name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: nameEditingController,
                text: 'experience Name',
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
                      .map((e) => DropdownMenuItem(value: e,child: Text('$e') ,))
                      .toList(),
                  onChanged: (experienceSelected) {
                 //selectedExperience = experienceSelected;
                    ///
                  }),
              const SizedBox(height: 15),
              const Text(
                'experience content',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: bodyEditingController,
                text: 'experience content',
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
             await performCreateExperience();
            },
            loading: loading,
          ),
        ),
      ),
    );
  }

  Future<void> performCreateExperience()async{
    if(checkData()){
      await createExperience();
    }
  }

  Future<void> createExperience()async{
    setState(() {
      loading = true;
    });
  try {
    var status = await ExperienceDbController().create(experienceModel);
    if (status>0) {
      var newExperience = await ExperienceDbController().show(status) ;
      if(newExperience != null) {
        Provider.of<CvProvider>(context , listen:false).createExperience(newExperience);
      }
    //  Provider.of<CvProvider>(context , listen:false).createExperience(experienceModel);

      showSnackBar(
        context,
        message: 'Experience Added Successfully!',
        error: false,
      );
      Navigator.pop(context);
    }  else{
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

  bool checkData(){
    if(nameEditingController.text.isEmpty){
      showSnackBar(
        context,
        message: 'Enter Experience Name!',
        error: true,
      );
      return false;
    }
    else if (bodyEditingController.text.isEmpty) {
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
