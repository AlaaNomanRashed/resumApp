import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/Providers/cv_provider.dart';
import 'package:resum_app_project/Providers/lang_provider.dart';
import 'package:resum_app_project/database/controller/experience_controller.dart';
import 'package:resum_app_project/database/controller/skills_controller.dart';
import '../../database/controller/interests_controllers.dart';
import '../widget/custom_bar_widget.dart';
import 'add_experience.dart';

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

    /// Interestes
    var interests = await InterestsDbControllers().read();
    for (int i = 0; i < interests.length; i++) {
      Provider.of<CvProvider>(context, listen: false).addInterests(interests[i]);
    }

    /// Experience
    var experience = await ExperienceDbController().read();
    for (int i = 0; i < experience.length; i++) {
      Provider.of<CvProvider>(context, listen: false).addExperience(experience[i]);
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
          children:  [
            Row(
              children: [
                Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: ()async{
                   await   Provider.of<LangProviders>(context , listen: false).changeLanguage();
                    },
                    icon: Icon(
                      Icons.language,
                    )
                ),
                IconButton(
                    onPressed: ()async{
                   ///  await Provider.of<ThemeProviders>(context).toggleTheme();
                    },
                    icon: Icon(
                      Icons.brush  ,
                    )
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(child: CustomBarWidget()),
          ],
        ),
      ),
      bottomNavigationBar:  ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddExperience()));
        },
        icon: Icon(
          Icons.star,
          color: Colors.black,
        ),
        label: Text(
          'Add your experinse',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          minimumSize: const Size(double.infinity, 43),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(
              color: Colors.black,
              width: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}
