import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/helpers/snackbar.dart';
import '../../Providers/cv_provider.dart';
import '../../database/controller/interests_controllers.dart';
import '../../models/interests_model.dart';
import '../widget/my_button.dart';
import '../widget/my_text_field.dart';
class AddInterestsScreen extends StatefulWidget {
  const AddInterestsScreen({Key? key}) : super(key: key);
  @override
  State<AddInterestsScreen> createState() => _AddInterestsScreenState();
}
class _AddInterestsScreenState extends State<AddInterestsScreen> with SnackBarHelper{
  late TextEditingController interestsEditingController;
  @override
  void initState() {
    interestsEditingController = TextEditingController();
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
          'Add New Interests',
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
                'Interest Name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: interestsEditingController,
                text: 'Interests Name',
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
              await performCreateInterests();
            },
            // loading: loading,
          ),
        ),
      ),
    );
  }

  Future<void> performCreateInterests() async {
    if (checkData()) {
      await createInterests();
    }
  }

  Future<void> createInterests() async {
    setState(() {
      loading = true;
    });
    try {
      var status = await InterestsDbControllers().create(interest);

      if (status > 0) {
        Provider.of<CvProvider>(context, listen: false).createInterests(interest);
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


  InterestsModel get interest{
    InterestsModel interes_ = InterestsModel();
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
