class UserModel {
  //late String uid, email, name;
  //late String pic;
  late String uid;
  late String name;
  late String email;
  late String phone;
  late String pic;
  late String address;
  late String renewalDate;

  UserModel(
      {this.uid = "",
        this.name = "Unknown",
        this.email = "example@mega.com",
        this.phone = "00000000000",
        this.address = "333 E Wonderview AveEstes Park",
        this.renewalDate = "10/5/2022",
        this.pic =
        "https://firebasestorage.googleapis.com/v0/b/e-commerce-bbf5d.appspot.com/o/120.png?alt=media&token=7fbb8ba7-8451-4fe7-85eb-8afe850f95d7"});

  UserModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return;
    }
    uid = map['uid'];
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    pic = map['pic'];
    address = map['address'];
    renewalDate = map['renewalDate'];
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
