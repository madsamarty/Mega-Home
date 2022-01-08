import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mega_home/core/router.dart';
import 'package:mega_home/core/view_model/authentication_provider.dart';
import 'package:mega_home/helper/shared_prefrences.dart';
import 'package:mega_home/utils/constants/routes.dart';
import 'package:mega_home/utils/global/global.dart';
import 'package:mega_home/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
            create: (_) => AuthViewModel(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) => context.read<AuthViewModel>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        navigatorKey: AppRouter.navigatorKey,
        initialRoute: homeRoute,
        //home: const Wrapper(),
      ),
    );
  }
}
