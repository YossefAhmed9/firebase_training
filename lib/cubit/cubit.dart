import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../core/controllers/widgets/components.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);


  Future<dynamic> register({required String email, password,required BuildContext context}) async {

    try {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:email,
        password:password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(
            context,
            'The password provided is too weak.',
            5,
            Colors.red);
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(
            context,
            'E-mail already in use, Go to login page and try to login with your account',
            5,
            Colors.deepPurpleAccent);
      }
    } catch (e) {
      //print(e.runtimeType);
      print(e.toString());
    }
  }


  Future<dynamic> signIn({required String? email, password,required BuildContext context}) async {

   try {
     return await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: email!,
         password: password);
   } on FirebaseAuthException catch (e) {
     if (e.code == 'user-not-found') {
       showSnackBar(context,
           'No user found for that email.', 5, Colors.red);
     } else if (e.code == 'wrong-password') {
       showSnackBar(
           context,
           'Wrong password provided for that user.',
           5,
           Colors.red);
       return e;

     }
   }
  }

  Future<dynamic> signInWithGoogle() async {
    emit(LoginLoading());
 try{
   // Trigger the authentication flow
   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
   // Obtain the auth details from the request
   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
   // Create a new credential
   final credential =GoogleAuthProvider.credential(
     accessToken: googleAuth?.accessToken,
     idToken: googleAuth?.idToken,
   );
   var userCredential=await FirebaseAuth.instance.signInWithCredential(credential);
   // Once signed in, return the UserCredential

   //signIn(email: userCredential.user!.email,password: userCredential.user!.uid, context: context,);
   emit(LoginDone());

   return userCredential;
 }
 catch(error){
   print('%%%%%%%%% ${error.runtimeType}');
   print(state);
   print('%%%%%%%%%%% ${error.toString()}');
   emit(LoginError(error));
 }

  }

  Future<dynamic> signInWithFacebook() async {
    try{
      emit(FaceBookLoginLoading());
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      emit(FaceBookLoginDone());
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }
        catch(error){
          print('%%%%%%%%% ${error.runtimeType}');
          print(state);
          print('%%%%%%%%%%% ${error.toString()}');
          emit(FaceBookLoginError(error));
        }



  }






}