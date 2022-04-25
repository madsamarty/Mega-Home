import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_home_graduation_project/core/view_model/ProfileViewModel.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  var name = '        alex adams';
  String phone = '    01155667788';
  String address = '333 E Wonderview Ave,Estes Park';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
        init: Get.find<ProfileViewModel>() ,builder: (controller)=> Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Profile',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                            AssetImage('assets/image/Ellipse1.png'))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Alex Adams',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ],),
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 5, right: 5),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.62,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 110, left: 50),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'NAME',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                name,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'PHONE',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                phone,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ADDRESS',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  address,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ))
    );
  }
}
 