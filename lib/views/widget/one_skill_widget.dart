import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:resum_app_project/models/skills_model.dart';

class OneSkillWidget extends StatelessWidget {
  const OneSkillWidget({
    Key? key,
    required this.skill,
  }) : super(key: key);

  final SkillsModel skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(bottom: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill.skillName,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                '${skill.percent}%',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          LinearPercentIndicator(
            lineHeight: 12,
            percent: double.parse(skill.percent) / 100,
            progressColor: color_,
            backgroundColor: Colors.white,
            barRadius: const Radius.circular(10),
            padding: EdgeInsets.zero,
          )
        ],
      ),
    );
  }

  Color get color_ {
    Color color = Colors.black;
    num per = num.parse(skill.percent);

    per >= 90
        ? color = Colors.green
        : per >= 80
            ? color = Colors.blue
            : per >= 70
                ? color = Colors.orange
                : per >= 60
                    ? color = Colors.purple
                    : per >= 50
                        ? color = Colors.yellow
                        : color = Colors.red;
    return color;
  }
}
