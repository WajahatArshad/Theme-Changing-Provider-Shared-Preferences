import 'dart:io';

import 'package:chat_application/Models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({
    Key? key,
    required this.userModel,
    required this.firebaseUser,
  }) : super(key: key);

  final UserModel userModel;
  final User firebaseUser;

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

TextEditingController nameController = TextEditingController();

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  void selectImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    if (pickedFile != null) {
      setState(() {
        _pickedFile = File(pickedFile.path);
      });
    }
  }

  // void cropImage(XFile file) async {
  //   CroppedFile? croppedImage = await ImageCropper().cropImage(
  //     sourcePath: file.path,
  //     compressQuality: 50,
  //     aspectRatio: const CropAspectRatio(
  //       ratioX: 1,
  //       ratioY: 1,
  //     ),
  //   );
  //   if (croppedImage != null) {
  //     setState(() {
  //       pickedFile = croppedImage.path as XFile?;
  //     });
  //   }
  // }

  void checkValues() {
    String fullName = nameController.text.trim();
    if (fullName == '') {
      print('Fill All The Fields');
    } else {
      upLoadData();
    }
  }

  void upLoadData() async {
    UploadTask uploadTask = FirebaseStorage.instance
        .ref('profilepicture')
        .child(widget.userModel.userId.toString())
        .putFile(_pickedFile as File);

    TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();
    String fullName = nameController.text.trim();

    widget.userModel.fullName = fullName;
    widget.userModel.profilePic = imageUrl;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userModel.userId)
        .set(widget.userModel.toMap())
        .then((value) => print('Value Uploaded Successfully'));
  }

  void showPhotoOption() {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('Upload Profile Picture'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  selectImage(ImageSource.gallery);
                },
                leading: const Icon(
                  Icons.photo_album,
                ),
                title: const Text('Select From Gallery'),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  selectImage(ImageSource.camera);
                },
                leading: const Icon(
                  Icons.camera_alt,
                ),
                title: const Text('Select From Camera'),
              ),
            ],
          ),
        );
      }),
    );
  }

  File? _pickedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Complete Profile',
        ),
      ),
      body: ListView(
        children: [
          CupertinoButton(
            onPressed: () {
              showPhotoOption();
            },
            child: Container(
              height: 165,
              width: 165,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                backgroundImage: _pickedFile == null
                    ? AssetImage('')
                    : Image.file(_pickedFile!).image,
                radius: 65,
                // child: _pickedFile == null
                //     ? const Icon(Icons.person)
                //     : Image.file(
                //         File(_pickedFile!.path),
                //       ),
              ),
            ),
          ),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Enter Your Name',
            ),
          ),
          CupertinoButton(
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              checkValues();
            },
            child: const Text(
              'Submit',
            ),
          ),
        ],
      ),
    );
  }
}
