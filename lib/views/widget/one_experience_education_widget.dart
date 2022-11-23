import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/Providers/cv_provider.dart';
import 'package:resum_app_project/helpers/snackbar.dart';

import '../../database/controller/experience_controller.dart';
import '../../models/experience_model.dart';
import '../screens/update_experience.dart';

class OneExperienceAndEducationWidget extends StatefulWidget {
  const OneExperienceAndEducationWidget({
    Key? key,
    required this.experience,
  }) : super(key: key);


  final ExperienceModel experience;

  @override
  State<OneExperienceAndEducationWidget> createState() => _OneExperienceAndEducationWidgetState();
}

class _OneExperienceAndEducationWidgetState extends State<OneExperienceAndEducationWidget> with SnackBarHelper {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>UpdateExperience(experience: widget.experience,)
          )
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
            width: 1.4,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.work_outline_outlined,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.experience.name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 7.0),
                Text(
                  '${widget.experience.body}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 15.0),
            IconButton(
                onPressed: () async{
                  await deleteExperience();
                },
                icon: Icon(
                  Icons.delete
                )
            )
          ],
        ),
      ),
    );
  }

  Future<void> deleteExperience() async{
  var status =   await ExperienceDbController().delete(widget.experience.id);
  if (status) {
    Provider.of<CvProvider>(context , listen: false).deleteExperience(widget.experience.id);
    showSnackBar(
        context,
        message: 'Deleted is Successfully',
        error: false
    );
  }else{
    showSnackBar(
        context,
        message: 'Deleted is failed',
        error: true
    );
  }
  }
}
