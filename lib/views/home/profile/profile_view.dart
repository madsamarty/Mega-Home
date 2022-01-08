import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        elevation: 0.0,
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(color: Color(0xff121212)),
            Positioned(
              height: 400,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xffE8E8E8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
