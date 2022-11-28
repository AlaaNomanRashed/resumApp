import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/cv_provider.dart';
import '../../models/experience_model.dart';
import '../widget/one_experience_education_widget.dart';
import '../widget/one_rating_widget.dart';
import 'add_experience.dart';

class EducationView extends StatelessWidget {
  const EducationView({Key? key}) : super(key: key);

  final bool isEducation = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// OneExperienceAndEducationWidget => Education part
        education(context).isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: education(context).length,
                itemBuilder: (context, index) {
                  return OneExperienceAndEducationWidget(
                    experience: education(context)[index],
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
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/rating.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                    const Text(
                      'NO ADDING RATING YET',
                      style: TextStyle(color: Colors.black45, fontSize: 20),
                    )
                  ],
                ),
              ),
        const SizedBox(height: 15),

        /// OneRatingsWidget
        rating(context).isNotEmpty
            ? GridView.builder(
                shrinkWrap: true,
                itemCount: rating(context).length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                 itemBuilder: (context, index) => OneRatingsWidget(
                      experience:
                          rating(context)[index],
                    ))
            : Container(
                width: double.infinity,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Divider(
                      height: 0,
                      color: Colors.black38,
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/education.png',
                            width: 150,
                            height: 150,
                          ),
                        ),
                        const Text(
                          'NO ADDING EDUCATIONS YET',
                          style: TextStyle(color: Colors.black45, fontSize: 20),
                        )
                      ],
                    )
                  ],
                ),
              ),
      ],
    );
  }

  /// Education
  List<ExperienceModel> education(BuildContext context) {
    List<ExperienceModel> list = [];

    for (int i = 0;
        i < Provider.of<CvProvider>(context).experiences.length;
        i++) {
      if (Provider.of<CvProvider>(context).experiences[i].type ==
          TypeOfExperience.education.name) {
        list.add(Provider.of<CvProvider>(context).experiences[i]);
      }
    }
    return list;
  }

/// Ratings
  List<ExperienceModel> rating(BuildContext context) {
    List<ExperienceModel> list = [];

    for (int i = 0;
    i < Provider.of<CvProvider>(context).experiences.length;
    i++) {
      if (Provider.of<CvProvider>(context).experiences[i].type ==
          TypeOfExperience.rating.name) {
        list.add(Provider.of<CvProvider>(context).experiences[i]);
      }
    }
    return list;
  }
}
