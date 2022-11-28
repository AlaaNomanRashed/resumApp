import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/helpers/snackbar.dart';
import 'package:resum_app_project/models/skills_model.dart';
import '../../Providers/cv_provider.dart';
import '../../database/controller/skills_controller.dart';
import '../screens/update_skills.dart';

class OneSkillWidget extends StatefulWidget {
  const OneSkillWidget({
    Key? key,
    required this.skill,
  }) : super(key: key);

  final SkillsModel skill;

  @override
  State<OneSkillWidget> createState() => _OneSkillWidgetState();
}

class _OneSkillWidgetState extends State<OneSkillWidget> with SnackBarHelper {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> UpdateSkillsScreen(skill: widget.skill,)
        )
        );
      },
      child: Container(
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.only(bottom: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.skill.skillName,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${widget.skill.percent}%',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await deleteSkill();
                        },
                        icon: const Icon(Icons.delete),),
                  ],
                )
              ],
            ),
            const SizedBox(height: 5),
            LinearPercentIndicator(
              lineHeight: 12,
              percent: double.parse(widget.skill.percent) / 100,
              progressColor: color_,
              backgroundColor: Colors.white,
              barRadius: const Radius.circular(10),
              padding: EdgeInsets.zero,
            )
          ],
        ),
      ),
    );
  }

  Color get color_ {
    Color color = Colors.black;
    num per = num.parse(widget.skill.percent);

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

  Future<void> deleteSkill() async {
    var status = await SkillsDbController().delete(widget.skill.id);
    if (status) {
      Provider.of<CvProvider>(context, listen: false)
          .deleteSkill(widget.skill.id);
      showSnackBar(context, message: 'Delete is successfuly', error: false);
    } else {
      showSnackBar(context, message: 'Error in delete', error: true);
    }
  }
}
