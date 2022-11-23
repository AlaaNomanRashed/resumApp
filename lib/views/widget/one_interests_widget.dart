import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resum_app_project/helpers/snackbar.dart';

import '../../Providers/cv_provider.dart';
import '../../database/controller/interests_controllers.dart';
import '../../models/interests_model.dart';
import '../screens/update_interests.dart';

class OneInterestsWidget extends StatefulWidget {
  const OneInterestsWidget({Key? key, required this.interests}) : super(key: key);
  final InterestsModel interests;

  @override
  State<OneInterestsWidget> createState() => _OneInterestsWidgetState();
}

class _OneInterestsWidgetState extends State<OneInterestsWidget> with SnackBarHelper{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context)=>UpdateInterestsScreen(interest: widget.interests,)
          )
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.black.withOpacity(0.4)),
        child: Row(
          children: [
            Text(
              "${widget.interests}.interestsName",
              style: const TextStyle(fontSize: 19),
            ),
            IconButton(
                onPressed: () async {
                  await deleteIntrest();
                },
                icon: const Icon(Icons.delete))

          ],
        ),
      ),
    );
  }

  Future<void> deleteIntrest() async {
    var status = await InterestsDbControllers().delete(widget.interests.id);
    if (status) {
      Provider.of<CvProvider>(context, listen: false)
          .deleteInterest(widget.interests.id);
      showSnackBar(context, message: 'Delete is successfuly', error: false);
    } else {
      showSnackBar(context, message: 'Error in delete', error: true);
    }
  }
}
