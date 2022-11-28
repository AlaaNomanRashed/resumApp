import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/views/screens/update_experience.dart';
import '../../Providers/cv_provider.dart';
import '../../models/experience_model.dart';
import '../widget/one_experience_education_widget.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});



  @override
  Widget build(BuildContext context) {
    return experience(context).isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: experience(context).length,
            itemBuilder: (context, index) {
              // return Center();
              return OneExperienceAndEducationWidget(
                experience: experience(context)[index],
              );
            },
          )
        : Container(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 12,
              bottom: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black,
                width: 1.4,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/experience.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                const Text(
                  'NO ADDING EXPERIENCES YET',
                  style: TextStyle(color: Colors.black45, fontSize: 20),
                ),
              ],
            ),
          );
  }

  List<ExperienceModel> experience (BuildContext context){
    
    List<ExperienceModel> list = [];

    for(int i =0 ; i < Provider.of<CvProvider>(context).experiences.length; i++){
     if ( Provider.of<CvProvider>(context).experiences[i].type == TypeOfExperience.experience.name) {
       list.add( Provider.of<CvProvider>(context).experiences[i]);
     }
    }
    return list;
  }


}
