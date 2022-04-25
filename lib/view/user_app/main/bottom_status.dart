import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../custom_widgets/custom_text.dart';

class BottomStatus extends StatelessWidget {
  const BottomStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (BuildContext context,
          ConnectivityResult connectivity, Widget child) {
        final bool connected = connectivity != ConnectivityResult.none;
        return Container(
          padding: const EdgeInsets.only(bottom: 50),
          child: CustomText(
            title: "${connected ? 'ONLINE' : 'OFFLINE'}",
            alignment: Alignment.center,
            color: Colors.black,
          ),
        );
      },
    );
  }
}
