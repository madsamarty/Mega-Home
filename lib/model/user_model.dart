class UserModel {
  //late String uid, email, name;
  //late String pic;
  late String? uid;
  late String name;
  late String pic;
  late String? email;
  late String address;

  UserModel(
      {this.uid,
      this.email,
      this.name = "",
      this.address = "",
      this.pic =
          "https://firebasestorage.googleapis.com/v0/b/e-commerce-bbf5d.appspot.com/o/120.png?alt=media&token=7fbb8ba7-8451-4fe7-85eb-8afe850f95d7"});

  UserModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return;
    }
    uid = map['uid'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
    address = map['address'];
  }

  toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'pic': pic,
      'address': address,
    };
  }
}
