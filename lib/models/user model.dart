import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  String? email;
  String? uid;

  UserModel(this.email, this.uid);
  
  factory UserModel.fromJson(UserCredential json){
    return UserModel(json.user!.email, json.user!.uid);
  }
}