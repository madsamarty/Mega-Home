import 'package:flutter/material.dart';

class SupportView extends StatelessWidget {
  SupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          title: const Text(
            'support',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              width: 153,
              height: 154,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Color(0xff707070), width: 2),
              ),
              child: const Center(
                child: Icon(
                  Icons.mail,
                  size: 90,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.call,
                        size: 60,
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Text('19918', style: TextStyle(fontSize: 28))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.mail,
                        size: 60,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text('megahome_support@gmail.com',
                          style: TextStyle(fontSize: 18))
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
