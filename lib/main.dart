// import 'package:chat_application/Pages/complete_profile.dart';
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

import 'package:chat_application/Pages/home_page.dart';
import 'package:chat_application/Pages/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider()..initilize(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: ((context, provider, child) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: provider.themeMode,
            home: const HomePage(),
          );
        }),
      ),
    );
  }
}



// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// TextEditingController nameController = TextEditingController();

// class _HomePageState extends State<HomePage> {
//   void saveText(String text) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.setString(
//       'text',
//       text,
//     );
//   }

//   void readText() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     String? data = pref.getString('text');
//     if (data != null) {
//       nameController.text = data;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     readText();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Shared Perferences',
//         ),
//       ),
//       body: TextFormField(
//         controller: nameController,
//         onChanged: (val) {
//           saveText(val);
//         },
//       ),
//     );
//   }
// }




// // import 'package:analog_clock/analog_clock.dart';
// // import 'package:flutter/material.dart';
// // import 'package:project/prastice%20model/my_dart.dart';
// //
// // Future main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatefulWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // List<Welcome> myList = [
// //   Welcome(
// //     userId: 1,
// //     id: 1,
// //     title: 'Completed',
// //     completed: true,
// //   ),
// //   Welcome(
// //     userId: 1,
// //     id: 1,
// //     title: 'Not Completed',
// //     completed: false,
// //   ),
// //   Welcome(
// //     userId: 1,
// //     id: 1,
// //     title: 'Completed',
// //     completed: true,
// //   ),
// //   Welcome(
// //     userId: 1,
// //     id: 1,
// //     title: 'Not Completed',
// //     completed: false,
// //   ),
// // ];
// //
// // class _MyAppState extends State<MyApp> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         // body: NotesPage(),
// //         // body: MyCustomWidget(),
// //         body: Center(
// //           child: Align(
// //             heightFactor: 3,
// //             // widthFactor: 0,
// //             alignment: Alignment.bottomLeft,
// //             child: Container(
// //               margin: EdgeInsets.all(100),
// //               padding: EdgeInsets.all(100),
// //               height: 200,
// //               width: 200,
// //               child: AnalogClock(
// //                 digitalClockColor: Colors.blue,
// //                 numberColor: Colors.red,
// //                 showAllNumbers: false,
// //                 width: double.infinity,
// //                 // showTicks: false,
// //                 useMilitaryTime: true,
// //                 tickColor: Colors.green,
// //                 showDigitalClock: false,
// //                 decoration: BoxDecoration(
// //                   border: Border.all(width: 2.0),
// //                   borderRadius: BorderRadius.circular(
// //                     300,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class MyCustomWidget extends StatefulWidget {
// //   const MyCustomWidget({Key? key}) : super(key: key);
// //
// //   @override
// //   State<MyCustomWidget> createState() => _MyCustomWidgetState();
// // }
// //
// // class _MyCustomWidgetState extends State<MyCustomWidget> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       itemCount: myList.length,
// //       itemBuilder: (BuildContext context, int index) {
// //         if (myList[index].completed == true) {
// //           return SizedBox();
// //         }
// //
// //         return ListTile(
// //           title: Text(
// //             myList[index].title.toString(),
// //           ),
// //           subtitle: Text(
// //             myList[index].completed.toString(),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // https://jsonplaceholder.typicode.com/users

// import 'dart:convert';

// import 'package:chat_application/complex_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// List<ComplexModel> myList = [];

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(),
//         body: FutureBuilder(
//           future: getDataFromApi(),
//           builder: ((context, snapshot) {
//             return ListView.builder(
//               itemCount: myList.length,
//               itemBuilder: ((context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DetialScreen(
//                           list: myList,
//                           id: 1,
//                           name: '${myList[index].name}',
//                           userName: '${myList[index].username}',
//                           email: '${myList[index].email}',
//                           address: '${myList[index].address}',
//                           street: '${myList[index].address!.street}',
//                           suite: '${myList[index].address!.suite}',
//                           city: '${myList[index].address!.city}',
//                           zipcode: '${myList[index].address!.zipcode}',
//                           lat: '${myList[index].address!.geo!.lat}',
//                           lng: '${myList[index].address!.geo!.lng}',
//                         ),
//                       ),
//                     );
//                   },
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       child: Text(myList[index].id.toString()),
//                     ),
//                     title: Text(myList[index].username.toString()),
//                     subtitle: Text(myList[index].email.toString()),
//                   ),
//                 );
//               }),
//             );
//           }),
//         ),
//       ),
//     );
//   }

//   Future<List<ComplexModel>> getDataFromApi() async {
//     http.Response response = await http.get(
//       Uri.parse(
//         'https://jsonplaceholder.typicode.com/users',
//       ),
//     );
//     var data = jsonDecode(response.body);

//     for (var i in data) {
//       myList.add(ComplexModel.fromJson(i));
//     }

//     return myList;
//   }
// }

// class DetialScreen extends StatelessWidget {
//   const DetialScreen(
//       {Key? key,
//       required this.id,
//       required this.name,
//       required this.userName,
//       required this.email,
//       required this.address,
//       required this.street,
//       required this.suite,
//       required this.city,
//       required this.zipcode,
//       required this.lat,
//       required this.lng,
//       required this.list})
//       : super(key: key);
//   final int id;
//   final String name;
//   final String userName;
//   final String email;
//   final String address;
//   final String street;
//   final String suite;
//   final String city;
//   final String zipcode;
//   final String lat;
//   final String lng;
//   final List<ComplexModel> list;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name),
//       ),
//       body: ListView(
//         reverse: true,
//         children: [
//           TextFormField(
//             decoration: InputDecoration(border: OutlineInputBorder()),
//           ),
//           for (int i = 0; i < list.length; i++) ...[
//             ListTile(
//               leading: CircleAvatar(
//                 child: Text(
//                   '${list[i].id}',
//                 ),
//               ),
//               title: Text('${list[i].name}'),
//               subtitle: Text('${list[i].email}'),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

// import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//           primarySwatch: Colors.blue,
//           highlightColor: const Color(0xFFD0996F),
//           backgroundColor: const Color(0xFFFDF5EC),
//           canvasColor: const Color(0xFFFDF5EC),
//           textTheme: TextTheme(
//             headline5: ThemeData.light()
//                 .textTheme
//                 .headline5!
//                 .copyWith(color: const Color(0xFFBC764A)),
//           ),
//           iconTheme: IconThemeData(
//             color: Colors.grey[600],
//           ),
//           appBarTheme: const AppBarTheme(
//             backgroundColor: Color(0xFFBC764A),
//             centerTitle: false,
//             foregroundColor: Colors.white,
//             actionsIconTheme: IconThemeData(color: Colors.white),
//           ),
//           elevatedButtonTheme: ElevatedButtonThemeData(
//             style: ButtonStyle(
//               backgroundColor: MaterialStateColor.resolveWith(
//                   (states) => const Color(0xFFBC764A)),
//             ),
//           ),
//           outlinedButtonTheme: OutlinedButtonThemeData(
//             style: ButtonStyle(
//               foregroundColor: MaterialStateColor.resolveWith(
//                 (states) => const Color(0xFFBC764A),
//               ),
//               side: MaterialStateBorderSide.resolveWith(
//                   (states) => const BorderSide(color: Color(0xFFBC764A))),
//             ),
//           )),
//       home: const HomePage(title: 'Image Cropper Demo'),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   final String title;

//   const HomePage({
//     Key? key,
//     required this.title,
//   }) : super(key: key);

//   @override
//   HomePageState createState() => HomePageState();
// }

// class HomePageState extends State<HomePage> {
//   XFile? _pickedFile;
//   CroppedFile? _croppedFile;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: !kIsWeb ? AppBar(title: Text(widget.title)) : null,
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (kIsWeb)
//             Padding(
//               padding: const EdgeInsets.all(kIsWeb ? 24.0 : 16.0),
//               child: Text(
//                 widget.title,
//                 style: Theme.of(context)
//                     .textTheme
//                     .displayMedium!
//                     .copyWith(color: Theme.of(context).highlightColor),
//               ),
//             ),
//           Expanded(child: _body()),
//         ],
//       ),
//     );
//   }

//   Widget _body() {
//     if (_croppedFile != null || _pickedFile != null) {
//       return _imageCard();
//     } else {
//       return _uploaderCard();
//     }
//   }

//   Widget _imageCard() {
//     return SingleChildScrollView(
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: kIsWeb ? 24.0 : 16.0),
//               child: Card(
//                 color: Colors.transparent,
//                 elevation: 4.0,
//                 child: Padding(
//                   padding: const EdgeInsets.all(kIsWeb ? 24.0 : 16.0),
//                   child: _image(),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24.0),
//             _menu(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _image() {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     if (_croppedFile != null) {
//       final path = _croppedFile!.path;
//       return ConstrainedBox(
//         constraints: BoxConstraints(
//           maxWidth: 0.8 * screenWidth,
//           maxHeight: 0.7 * screenHeight,
//         ),
//         child: kIsWeb ? Image.network(path) : Image.file(File(path)),
//       );
//     } else if (_pickedFile != null) {
//       final path = _pickedFile!.path;
//       return ConstrainedBox(
//         constraints: BoxConstraints(
//           maxWidth: 0.8 * screenWidth,
//           maxHeight: 0.7 * screenHeight,
//         ),
//         child: kIsWeb ? Image.network(path) : Image.file(File(path)),
//       );
//     } else {
//       return const SizedBox.shrink();
//     }
//   }

//   Widget _menu() {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         FloatingActionButton(
//           onPressed: () {
//             _clear();
//           },
//           backgroundColor: Colors.redAccent,
//           tooltip: 'Delete',
//           child: const Icon(Icons.delete),
//         ),
//         if (_croppedFile == null)
//           Padding(
//             padding: const EdgeInsets.only(left: 32.0),
//             child: FloatingActionButton(
//               onPressed: () {
//                 _cropImage();
//               },
//               backgroundColor: const Color(0xFFBC764A),
//               tooltip: 'Crop',
//               child: const Icon(Icons.crop),
//             ),
//           )
//       ],
//     );
//   }

//   Widget _uploaderCard() {
//     return Center(
//       child: Card(
//         elevation: 4.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         child: SizedBox(
//           width: kIsWeb ? 380.0 : 320.0,
//           height: 300.0,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: DottedBorder(
//                     radius: const Radius.circular(12.0),
//                     borderType: BorderType.RRect,
//                     dashPattern: const [8, 4],
//                     color: Theme.of(context).highlightColor.withOpacity(0.4),
//                     child: Center(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.image,
//                             color: Theme.of(context).highlightColor,
//                             size: 80.0,
//                           ),
//                           const SizedBox(height: 24.0),
//                           Text(
//                             'Upload an image to start',
//                             style: kIsWeb
//                                 ? Theme.of(context)
//                                     .textTheme
//                                     .headline5!
//                                     .copyWith(
//                                         color: Theme.of(context).highlightColor)
//                                 : Theme.of(context)
//                                     .textTheme
//                                     .bodyText2!
//                                     .copyWith(
//                                         color:
//                                             Theme.of(context).highlightColor),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 24.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _uploadImage();
//                   },
//                   child: const Text('Upload'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _cropImage() async {
//     if (_pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: _pickedFile!.path,
//         compressFormat: ImageCompressFormat.jpg,
//         compressQuality: 100,
//         uiSettings: [
//           AndroidUiSettings(
//               toolbarTitle: 'Cropper',
//               toolbarColor: Colors.deepOrange,
//               toolbarWidgetColor: Colors.white,
//               initAspectRatio: CropAspectRatioPreset.original,
//               lockAspectRatio: false),
//           IOSUiSettings(
//             title: 'Cropper',
//           ),
//           WebUiSettings(
//             context: context,
//             presentStyle: CropperPresentStyle.dialog,
//             boundary: const CroppieBoundary(
//               width: 520,
//               height: 520,
//             ),
//             viewPort:
//                 const CroppieViewPort(width: 480, height: 480, type: 'circle'),
//             enableExif: true,
//             enableZoom: true,
//             showZoomer: true,
//           ),
//         ],
//       );
//       if (croppedFile != null) {
//         setState(() {
//           _croppedFile = croppedFile;
//         });
//       }
//     }
//   }

//   Future<void> _uploadImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _pickedFile = pickedFile;
//       });
//     }
//   }

//   void _clear() {
//     setState(() {
//       _pickedFile = null;
//       _croppedFile = null;
//     });
//   }
// }
