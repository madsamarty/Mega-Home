import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('MAKE YOUR HOME SAFER',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              const CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.only(top: 160, bottom: 20),
                child: const Text(
                  'M   E   G   A',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
