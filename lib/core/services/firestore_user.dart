import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mega_home/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('Users');

  addUserToFireStore(UserModel userModel) async {
    return await _userCollection.doc(userModel.uid).set(userModel.toJson());
  }

  getCurrentUser(String uid) async {
    return await _userCollection.doc(uid).get();
  }

  /* GetCurrentUserId() async {
    return await _userCollection.doc().get();
  } */
}
