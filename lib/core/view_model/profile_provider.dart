import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mega_home/core/services/firestore_user.dart';
import 'package:mega_home/model/user_model.dart';

class ProfileProvider with ChangeNotifier {
  final UserModel _userModel = UserModel();
  UserModel get userModel => _userModel;

  List<String> prefixes = ["Name", "Phone", "Address", "Renewal Date"];
  List<String> _userData = [];
  List<String> get userData => _userData;

  fetchUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      storeUserData(UserModel.fromJson(value.data()));
    });
  }

  // Get user data from firebase
  void storeUserData(UserModel fetchedModel) {
    _userModel.name = fetchedModel.name;
    _userModel.pic = fetchedModel.pic;
    _userModel.email = fetchedModel.email;
    _userModel.address = fetchedModel.address;
    notifyListeners();
  }
}
