import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSecCardWithCamera extends StatelessWidget {
  String sensorIcon;
  String sensorName;

  CustomSecCardWithCamera({Key? key, required this.sensorIcon, required this.sensorName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 337.0,
      height: 400.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          40.0,
        ),
        color: Colors.grey[300],
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            SvgPicture.asset(
              sensorIcon,
              color: Colors.black,
              width: 40,
              height: 40,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              sensorName,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'NAME       :',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20.0,
                      ),
                      Text(
                        'PHONE     :',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20.0,
                      ),
                      Text(
                        'ADDRESS :',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                MaterialButton(
                  onPressed: (){},
                  color: Colors.black,
                  child: const Text(
                    'CONTACT WITH USER',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width:30.0
                  ,),

                FloatingActionButton(onPressed: (){},
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
