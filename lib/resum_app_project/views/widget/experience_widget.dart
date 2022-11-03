import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExperianceWidget extends StatelessWidget {
  const ExperianceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder:  (context , index) =>   Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
              ),
              child: ListTile(
                onTap: () {},
                title: Text(
                  'Freelance Web Designer',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '20-Now - Acme',
                    style: TextStyle(fontSize: 18, color: Colors.white54),
                  ),
                ),
                leading: Container(
                  height: 100,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Image.asset(
                        'assets/icons/experience.png',
                        height: 20,
                        width: 20,
                      )),
                ),
              ),
            ),
            SizedBox(height: 6,),
          ],
        ),
    );
  }
}
