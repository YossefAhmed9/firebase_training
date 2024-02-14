import 'package:firebase/cubit/cubit.dart';
import 'package:firebase/models/user%20model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/controllers/widgets/components.dart';
import '../../cubit/states.dart';

class Register_Screen extends StatelessWidget{

  var emailcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var emailKey = GlobalKey<FormState>();
  var passKey = GlobalKey<FormState>();
  bool showpass = true;
  bool isLoading = false;
  var passcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit=AppCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title: const Text('Register form'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Register Now!',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 50.0,
                        ),
                      ),
                      const Text(
                        'Register now to connect with your friends',
                        style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      defaultTextFormField(
                        emailKey,
                        TextInputType.emailAddress,
                        emailcontroller,
                            (value) {
                          emailcontroller.text = value!;
                        },
                            (value) {
                          print(value);
                        },
                            () {},
                        'Email',
                        OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
                        const Icon(
                          Icons.email_rounded,
                        ),
                            (value) {
                          if (value!.isEmpty) {
                            return ('Email must be filled');
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passcontroller,
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        obscureText: showpass,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Password must be filled');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35)),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: GestureDetector(
                              onTap: () {

                              },
                              child: const Icon(Icons.remove_red_eye_outlined)),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        width: double.infinity,
                        height: 55.0,
                        child: MaterialButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              print('email:' + emailcontroller.text);
                              print('pass:' + passcontroller.text);
                            }
                            cubit.register(email: emailcontroller.text,password: passcontroller.text ,context: context).then(
                                    (value) {
                                      emailcontroller.clear;
                                      passcontroller.clear;
                                      showSnackBar(context, 'Register Completed', 3, Colors.teal[900]);
                                      print(value);
                                    });

                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Login Now!',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      MaterialButton(
                        onPressed: () {
                          try {
                           cubit.signInWithGoogle().then((value) => print('Google sign in value: $value'));

                          } catch (error) {
                            print('*************this is error type ${error.runtimeType}***************');
                            print('*************this is error  ${error.toString()}************');
                          }
                        },
                        child: Image.asset(
                          'assets/images/google.png',
                          width: 35,
                          height: 35,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          try {
                            cubit.signInWithFacebook().then((value) {
                              print('+++++++++++ $value ++++++++++++++++++');
                            });
                          } catch (error) {
                            print('*************this is error type ${error.runtimeType}***************');
                            print('*************this is error  ${error.toString()}************');
                          }
                        },
                        child: Image.asset(
                          'assets/images/facebook.png',
                          width: 35,
                          height: 35,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
