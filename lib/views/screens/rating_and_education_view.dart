import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/cv_provider.dart';
import '../widget/one_experience_education_widget.dart';
import '../widget/one_rating_widget.dart';

class EducationView extends StatelessWidget {
  const EducationView({Key? key}) : super(key: key);

  final bool isEducation = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// OneExperienceAndEducationWidget => Education part
        Container(
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
            child:Provider.of<CvProvider>(context).experiences.isNotEmpty ? ListView.builder(
              shrinkWrap: true,
              itemCount: Provider.of<CvProvider>(context).experiences.length,
              itemBuilder: (context, index) {
                return OneExperienceAndEducationWidget(
                  experience: Provider.of<CvProvider>(context).experiences[index],
                );
              },
            ) :  Column(
              children: [
                Center(
                  child: Image.asset('assets/images/rating.png' , width: 150 , height: 150,),
                ),
                Text(
                  'NO ADDING RATING YET',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 20
                  ),
                )
              ],
            )
        ),
        const SizedBox(height: 15),

        /// OneRatingsWidget
        Container(
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
             Provider.of<CvProvider>(context).experiences.isNotEmpty ? ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: Provider.of<CvProvider>(context).experiences.length,
                itemBuilder: (context, index) {
                  return OneRatingsWidget(
                 experience: Provider.of<CvProvider>(context).experiences[index],
                  );
                },
              ):  Column(
                children: [
                  Center(
                   child: Image.asset('assets/images/education.png' , width: 150 , height: 150,),
             ),
                  Text(
                    'NO ADDING EDUCATIONS YET',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 20
                    ),
                  )
                ],
              )
            ],
          ),
        ),

      ],
    );
  }
}
