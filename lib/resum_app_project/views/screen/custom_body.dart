import 'package:flutter/cupertino.dart';

import '../widget/custom_bar_widget.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        // horizontal: 20
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
           SizedBox(height: 16,),
          CustomBarWidget(),
         SizedBox(height: 20,),
        ],
      ),
    );
  }
}
