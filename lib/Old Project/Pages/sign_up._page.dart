// ignore_for_file: avoid_print

import 'package:chat_application/Old%20Project/Models/user_model.dart';
import 'package:chat_application/Old%20Project/Pages/complete_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  checkValidation() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      print('Fill All The Field');
    } else if (password != confirmPassword) {
      print('Password Does Not Match');
    } else {
      signUp(email, password);
    }
  }

  void signUp(email, password) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (ex) {
      print(ex.code.toString());
    }
    if (credential != null) {
      String uId = credential.user!.uid;
      UserModel newUser = UserModel(
        userId: uId,
        emailId: email,
        fullName: '',
        profilePic: '',
      );

      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(newUser.toMap())
          .then(
            (value) => print(
              'New User Created',
            ),
          );
      // Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) =>  CompleteProfileScreen(userModel: newUser, firebaseUser: ),
      //             ),
      //           );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => CompleteProfileScreen(
                  userModel: newUser, firebaseUser: credential!.user!)),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                    hintText: 'Enter Your e-Mail',
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                    hintText: 'Confirm Password',
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    checkValidation();
                  },
                  color: Theme.of(context).colorScheme.secondary,
                  child: const Text('Sign Up'),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account ',
          ),
          CupertinoButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
