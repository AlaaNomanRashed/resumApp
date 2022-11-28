import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/helpers/snackbar.dart';
import '../../Providers/cv_provider.dart';

import '../../database/controller/experience_controller.dart';
import '../../models/experience_model.dart';
import '../screens/update_experience.dart';

class OneRatingsWidget extends StatefulWidget {
  const OneRatingsWidget({
    Key? key,
    required this.experience,
  }) : super(key: key);

  final ExperienceModel experience;

  @override
  State<OneRatingsWidget> createState() => _OneRatingsWidgetState();
}

class _OneRatingsWidgetState extends State<OneRatingsWidget>
    with SnackBarHelper {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UpdateExperience(
            experience: widget.experience,
          ),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
            width: 1.4,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_outlined,
                    color: Color(0xffA36FF6),
                    size: 44,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.experience.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.experience.body,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              start: 10,
              top: 10,
              child: InkWell(
                onTap: () async {
                  await deleteExperience();
                },
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: Color(0xFFFF0000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteExperience() async {
    var status = await ExperienceDbController().delete(widget.experience.id);
    if (status) {
      Provider.of<CvProvider>(context, listen: false)
          .deleteExperience(widget.experience.id);
      showSnackBar(context, message: 'Deleted is Successfully', error: false);
    } else {
      showSnackBar(context, message: 'Deleted is failed', error: true);
    }
  }
}
