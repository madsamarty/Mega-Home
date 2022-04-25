import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_home_graduation_project/core/view_model/messages_view_model.dart';

class MessagesView extends StatelessWidget {
   MessagesView({Key? key}) : super(key: key);
   var time = '8:10pm';
   var itemcount = 20;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessagesViewModel>(
        init: Get.find<MessagesViewModel>(),
        builder: (controller) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'MESSAGES',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 63,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Color(0xff707070), width: 2),
                    ),
                    child: const Center(child: Text('M')),
                  ),
                  Expanded(child: Text('     ')),
                  Text(time)
                ],
              ),
            );
          },
          itemCount: itemcount,
        ),
      ),
    ));
  }
}
