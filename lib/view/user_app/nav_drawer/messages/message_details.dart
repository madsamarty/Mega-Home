import 'package:flutter/material.dart';
import 'package:mega_home_graduation_project/utils/constants/strings.dart';
import 'package:mega_home_graduation_project/view/custom_widgets/custom_sec_card.dart';

class MessageDetailsView extends StatelessWidget {
  const MessageDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Message", style: TextStyle(color: Colors.black, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme:const IconThemeData(color: Colors.black),

      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(30),
        child: Center(
          child: CustomSecCard(sensorIcon: fireExtinguisherIcon, sensorName: "FIRE ALARM"),
        ),
      ),
    );
  }
}
