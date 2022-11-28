import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/helpers/snackbar.dart';
import '../../Providers/cv_provider.dart';
import '../../database/controller/interests_controllers.dart';
import '../../models/interests_model.dart';
import '../widget/my_button.dart';
import '../widget/my_text_field.dart';
class UpdateInterestsScreen extends StatefulWidget {

 final InterestsModel interest;

  const UpdateInterestsScreen({Key? key, required this.interest}) : super(key: key);
  @override
  State<UpdateInterestsScreen> createState() => _UpdateInterestsScreenState();
}
class _UpdateInterestsScreenState extends State<UpdateInterestsScreen> with SnackBarHelper{

  late TextEditingController interestsEditingController;
  @override
  void initState() {
    interestsEditingController = TextEditingController(text: widget.interest.interestsName);
    super.initState();
  }
  @override
  void dispose() {
    interestsEditingController.dispose();
    super.dispose();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update My Interests',
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
                'Insert New Interests',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: interestsEditingController,
                text: 'Insert New Interests',
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
              await performUpdateInterests();
            },
            // loading: loading,
          ),
        ),
      ),
    );
  }

  Future<void> performUpdateInterests() async {
    if (checkData()) {
      await UpdateInterests();
    }
  }

  Future<void> UpdateInterests() async {
    setState(() {
      loading = true;
    });
    try {
      var status = await InterestsDbControllers().update(interest);
      if (status) {
        Provider.of<CvProvider>(context , listen: false).updateInterests(interest);
        showSnackBar(
          context,
          message: 'Skill Added Successfully!',
          error: false,
        );
        Navigator.of(context).pop();
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

  InterestsModel get interest{
    InterestsModel interes_ = InterestsModel();
    interes_.id = widget.interest.id;
    interes_.interestsName = interestsEditingController.text;
    return interes_ ;
  }

  bool checkData() {
    if (interestsEditingController.text.isEmpty) {
      showSnackBar(
          context,
          message: 'Enter Your Interests ',
          error: true
      );
      return false;
    }
    return true;
  }
}
