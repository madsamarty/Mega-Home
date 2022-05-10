
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mega_home_graduation_project/view/auth/wrapper.dart';

import '../../helper/check_connection.dart';
import '../../helper/local_storage_data.dart';
import '../../helper/toast_maker.dart';
import '../../model/user_model.dart';
import '../services/firestore_user.dart';

class AuthViewModel extends GetxController {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  late TextEditingController emailController = TextEditingController(),
      nameController = TextEditingController(),
      passwordController = TextEditingController(),
      cardNumberController = TextEditingController(),
      cardNameController = TextEditingController(),
      expDateController = TextEditingController(),
      secCodeController = TextEditingController();
  late String email = "", password = "", name = "";


  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.find();

  String get userID => _userID;
  String _userID = "";


  String authDropdownValue = 'User';
  var authDropdownList = [
    'User',
    'Security',
  ];

  void setSelected(value){
    authDropdownValue = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();

    //getCurrentUserData(_auth.currentUser!.uid);

    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  void signInWithEmailAndPassword() async {
    print(email);
    print(password);
    _loading.value = true;
    if (await CheckConnection().isInternet()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
            .then((value) async {
          getCurrentUserData(value.user!.uid);
          _userID = value.user!.uid;
        });
        if (_loading.value) {
          Get.offAll(() => Wrapper());
        }
      } catch (error) {
        ToastMaker().showSnackBarWithError(
            "Error login to Google account", error.toString());
      }
    } else {
      ToastMaker().showSnackBar("No Internet Connection");
    }
  }

  void googleSignInMethod() async {
    if (await CheckConnection().isInternet()) {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        await _auth.signInWithCredential(credential).then((user) {
          //saveUser(user);
          Get.offAll(Wrapper());
        });
      }
    } else {
      ToastMaker().showSnackBar("No Internet Connection");
    }
  }

  void singInAnonymously() async {
    if (await CheckConnection().isInternet()) {
      try {
        await _auth.signInAnonymously();
        Get.offAll(() => Wrapper());
      } catch (e) {
        ToastMaker().showToast("Can't Proceed to the Application");
      }
    } else {
      ToastMaker().showToast("No Internet Connection");
    }
  }

  // Get user data from firebase
  void getCurrentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data()));
    });
  }

  // Save user in Local Database
  // Shared Prefs
  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
    _loading.value = false;
  }

  //// Validation ////
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  signOut() async {
    if (await CheckConnection().isInternet()) {
      await FirebaseAuth.instance.signOut();
      localStorageData.deleteUser();
      Get.offAll(() => Wrapper());
    } else {
      ToastMaker().showSnackBar("No Internet Connection");
    }
  }
}