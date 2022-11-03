import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'container_text_widget.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white.withOpacity(0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                'Skills',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Graphic Design',
                        style: TextStyle(
                            fontSize: 25,
                            //  fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        '95%',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: LinearPercentIndicator(
                      lineHeight: 14,
                      percent: .95,
                      progressColor: Colors.deepPurple,
                      backgroundColor: Colors.white,
                      barRadius: Radius.circular(10),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Web Design',
                        style: TextStyle(
                            fontSize: 25,
                            //  fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        '75%',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: LinearPercentIndicator(
                      lineHeight: 14,
                      percent: .75,
                      progressColor: Colors.tealAccent,
                      backgroundColor: Colors.white,
                      barRadius: Radius.circular(10),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'HTML/CSS',
                        style: TextStyle(
                            fontSize: 25,
                            //  fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        '50%',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: LinearPercentIndicator(
                      lineHeight: 14,
                      percent: .50,
                      progressColor: Colors.yellowAccent,
                      backgroundColor: Colors.white,
                      barRadius: Radius.circular(10),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'UX',
                        style: TextStyle(
                            fontSize: 25,
                            //  fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        '25%',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: LinearPercentIndicator(
                      lineHeight: 14,
                      percent: .25,
                      progressColor: Colors.red,
                      backgroundColor: Colors.white,
                      barRadius: Radius.circular(10),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'terests',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          children: [
            ContainerTextWidget(
              text: 'Designing Website',
            ),
            ContainerTextWidget(
              text: 'Graphics',
            ),
            ContainerTextWidget(
              text: 'Nature',
            ),
            ContainerTextWidget(
              text: 'Blogging',
            ),
            ContainerTextWidget(
              text: 'Travelling',
            ),
          ],
        )
      ],
    );
  }
}
