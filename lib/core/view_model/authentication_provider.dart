import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mega_home/core/services/firestore_user.dart';
import 'package:mega_home/helper/check_connection.dart';
import 'package:mega_home/helper/shared_prefrences.dart';
import 'package:mega_home/helper/toast_maker.dart';
import 'package:mega_home/model/user_model.dart';

class AuthViewModel with ChangeNotifier {
  TextEditingController emailController = TextEditingController(),
      nameController = TextEditingController(),
      passwordController1 = TextEditingController(),
      passwordController2 = TextEditingController(),
      cardNumberController = TextEditingController(),
      cardNameController = TextEditingController(),
      expDateController = TextEditingController(),
      secCodeController = TextEditingController();

  String email = "", password = "", name = "";

  final FirebaseAuth firebaseAuth;
  AuthViewModel(this.firebaseAuth);

  initState() {}

  SharedPrefrencesData sharedPrefrencesData = SharedPrefrencesData();

  Stream<User?> get authStateChanges => firebaseAuth.idTokenChanges();

  submitCredit() {}

  //SIGN IN METHOD
  void signInWithEmailAndPassword() async {
    if (await CheckConnection().isInternet()) {
      try {
        await firebaseAuth
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController1.text)
            .then((userCred) {
          getCurrentUserData(userCred.user!.uid);
          print(userCred.user!.email);
        });
      } catch (e) {
        ToastMaker().showToast("Login Error");
      }
    } else {
      ToastMaker().showToast("No Internet Connection");
    }
  }

  void singInAnonymously() async {
    if (await CheckConnection().isInternet()) {
      try {
        await firebaseAuth.signInAnonymously();
      } catch (e) {
        ToastMaker().showToast("Can't Proceed to the Application");
      }
    } else {
      ToastMaker().showToast("No Internet Connection");
    }
  }

  Future<String?> signUp() async {
    if (await CheckConnection().isInternet()) {
      try {
        await firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController1.text)
            .then((userCred) {
          saveUserForFirstTime(userCred);
        });
      } catch (e) {
        ToastMaker().showToast("Can't Register");
      }
    } else {
      ToastMaker().showToast("No Internet Connection");
    }
  }

  // Get user data from firebase
  void getCurrentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      storeUserInSharedPrefrences(UserModel.fromJson(value.data()));
    });
  }

  // Save user data for the first time in firebase
  // Sign up method
  void saveUserForFirstTime(UserCredential userCredential) async {
    UserModel _userModel = UserModel(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: nameController.text,
        pic:
            "https://firebasestorage.googleapis.com/v0/b/e-commerce-bbf5d.appspot.com/o/120.png?alt=media&token=7fbb8ba7-8451-4fe7-85eb-8afe850f95d7");
    await FireStoreUser().addUserToFireStore(_userModel);
    storeUserInSharedPrefrences(_userModel);
    //_userID = userModel.userId;
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    if (await CheckConnection().isInternet()) {
      try {
        await firebaseAuth.signOut();
        await sharedPrefrencesData.deleteUser();
      } catch (e) {
        ToastMaker().showToast("Can't Logout");
      }
    } else {
      ToastMaker().showToast("No Internet Connection");
    }
  }

  // Save user in Local Database
  // Shared Prefs
  void storeUserInSharedPrefrences(UserModel userModel) async {
    await sharedPrefrencesData.setUser(userModel);
    //_loading.value = false;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }
}
