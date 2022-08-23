// ignore_for_file: avoid_print

import 'package:chat_application/Models/user_model.dart';
import 'package:chat_application/Pages/sign_up._page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  checkValidate() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == '' || password == '') {
      print('Field Must be Fill');
    }

    login(email, password);
  }

  login(String email, String password) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      print(
        ex.message.toString(),
      );
    }

    if (credential != null) {
      String userId = credential.user!.uid;
      var userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      UserModel userModel =
          UserModel.fromMap(userData.data() as Map<String, dynamic>);

      print("User Model ${userModel.emailId}");
      print("User Model ${userModel.fullName}");
      print("User Model ${userModel.profilePic}");
      print("User Model ${userModel.userId}");

      print('Login Successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Chat App',
                style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter Your e-mail',
                ),
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
              ),
              CupertinoButton(
                onPressed: () {
                  checkValidate();
                },
                color: Theme.of(context).colorScheme.secondary,
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account ',
          ),
          CupertinoButton(
            child: const Text('Sign Up'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
