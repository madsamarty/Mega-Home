import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollection =
  FirebaseFirestore.instance.collection('Users');
  final CollectionReference _securityCollection =
  FirebaseFirestore.instance.collection('Security');

  addUserToFireStore(UserModel userModel) async {
    return await _userCollection.doc(userModel.uid).set(userModel.toJson());
  }

  getCurrentUser(String uid) async {
    return await _userCollection.doc(uid).get();
  }
  getCurrentSecurity(String sid) async {
    return await _securityCollection.doc(sid).get();
  }

 /* GetCurrentUserId() async {
    return await _userCollection.doc().get();
  } */
}
