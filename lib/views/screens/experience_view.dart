import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/cv_provider.dart';
import '../widget/one_experience_education_widget.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Provider.of<CvProvider>(context).experiences.isNotEmpty ? ListView.builder(
        shrinkWrap: true,
        itemCount: Provider.of<CvProvider>(context).experiences.length,
        itemBuilder: (context, index) {
          // return Center();
          return OneExperienceAndEducationWidget(
            experience: Provider.of<CvProvider>(context).experiences[index],
          );
        },
      ) : Column(
        children: [
          Center(
            child: Image.asset('assets/images/experience.png' , width: 150 , height: 150,),
          ),
          Text(
            'NO ADDING EXPERIENCES YET',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 20
            ),
          )
        ],
      )
    );

  }
}
