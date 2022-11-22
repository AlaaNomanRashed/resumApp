import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/Providers/cv_provider.dart';
import '../widget/one_interests_widget.dart';
import '../widget/one_skill_widget.dart';
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: Provider.of<CvProvider>(context).skills.length,
                itemBuilder: (context, index) {
                  return OneSkillWidget(
                    skill: Provider.of<CvProvider>(context).skills[index],
                  );
                },
              ),
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

              // Wrap(
              //   spacing: 8,
              //   runSpacing: 8,
              //   children: const [
              //     OneInterestsWidget(text: 'Designing Website'),
              //     OneInterestsWidget(text: 'Graphics'),
              //     OneInterestsWidget(text: 'Nature'),
              //     OneInterestsWidget(text: 'Blogging'),
              //     OneInterestsWidget(text: 'Travelling'),
              //   ],
              // ),
              const Divider(
                height: 0,
                color: Colors.black38,
              ),
              const SizedBox(height: 15),
              ListView.builder(
                shrinkWrap: true,
                itemCount: Provider.of<CvProvider>(context).interests.length,
                itemBuilder: (context, index) {
                  return OneInterestsWidget(
                    interests: Provider.of<CvProvider>(context).interests[index],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
