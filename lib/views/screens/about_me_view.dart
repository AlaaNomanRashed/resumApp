import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/Providers/cv_provider.dart';
import '../widget/one_interests_widget.dart';
import '../widget/one_skill_widget.dart';
import 'add_experience.dart';
import 'add_interests.dart';
import 'add_skills.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Skills',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddSkillsScreen()));
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 0,
                color: Colors.black38,
              ),
              const SizedBox(height: 15),
              Provider.of<CvProvider>(context).skills.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: Provider.of<CvProvider>(context).skills.length,
                      itemBuilder: (context, index) {
                        return OneSkillWidget(
                          skill: Provider.of<CvProvider>(context).skills[index],
                        );
                      },
                    )
                  : Column(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/noSkill.png',
                            width: 150,
                            height: 150,
                          ),
                        ),
                        Text(
                          'NO ADDING SKILLS YET',
                          style: TextStyle(color: Colors.black45, fontSize: 20),
                        )
                      ],
                    )
            ],
          ),
        ),
        const SizedBox(height: 15),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Interests',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddInterestsScreen()));
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 0,
                color: Colors.black38,
              ),
              const SizedBox(height: 15),
              Provider.of<CvProvider>(context).interests.isNotEmpty
                  ? Wrap(
                spacing: 10,
                      runSpacing: 10,
                      children: Provider.of<CvProvider>(context)
                          .interests
                          .map((interest) {
                            return OneInterestsWidget(interests: interest,);
                      }
                      ).toList(),
                    )
                  : Column(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/intersts.png',
                            width: 150,
                            height: 150,
                          ),
                        ),
                        const Text(
                          'NO ADDING INTERESTS YET',
                          style: TextStyle(color: Colors.black45, fontSize: 20),
                        ),
                        const SizedBox(height: 15),
                      ],
                    )
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Divider(
          height: 0,
          color: Colors.black38,
        ),
        // ElevatedButton.icon(
        //   onPressed: () {
        //     Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (context) => AddExperience()));
        //   },
        //   icon: Icon(
        //     Icons.star,
        //     color: Colors.black,
        //   ),
        //   label: Text(
        //     'Add your experinse',
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 15,
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        //   style: ElevatedButton.styleFrom(
        //     elevation: 0,
        //     backgroundColor: Colors.transparent,
        //     minimumSize: const Size(double.infinity, 43),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(5),
        //       side: const BorderSide(
        //         color: Colors.black,
        //         width: 1.3,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
