import 'package:cloud_firestore/cloud_firestore.dart';

class DonateUserModel{
  String? name;
  String? email;
  String? phone;
  String? uId;
  bool? isEmailVer;
  String? image;
  String? bio;
  String? bloodtype;
  String? diseases;
  String?userBirthDate;
  String? userLastDonation;
  String? userAddress;

  DonateUserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.isEmailVer,
    this.image,
    this.bio,
    this.bloodtype,
    this.diseases,
    this.userBirthDate,
    this.userLastDonation,
    this.userAddress,
});
  DonateUserModel.fromJson(Map<String,dynamic> json)
  {
    email=json['email'];
    name=json['name'];
    phone=json['phone'];
    uId=json['uId'];
    isEmailVer=json['isEmailVer'];
    image=json['image'];
    bio=json['bio'];
    bloodtype=json['bloodtype'];
    diseases=json['diseases'];
    userBirthDate=json['userBirthDate'];
    userLastDonation=json['userLastDonation'];
    userAddress=json['userAddress'];


  }
  Map<String,dynamic>toMap()
  {
    return{
     'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'isEmailVer':isEmailVer,
      'image':image,
      'bio':bio,
      'bloodtype':bloodtype,
      'diseases':diseases,
      'userBirthDate':userBirthDate,
      'userLastDonation':userLastDonation,
      'userAddress':userAddress,


    };
  }

  DonateUserModel.fromSnapshot(DocumentSnapshot snapshot)
    : bloodtype =snapshot['bloodtype'];

}