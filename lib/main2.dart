// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:routine_i/pages/login.dart';
// import 'package:intl/date_symbol_data_local.dart';

// SharedPreferences prefs;
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   // This widget is the root of your application.

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isLoading = true;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     get();
//   }

//   get() async {
//     prefs = await SharedPreferences.getInstance();
//     // NotificationPlugin notificationPlugin = NotificationPlugin.
//     // await notificationPlugin.showNotification();
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     initializeDateFormatting('ja_JP', null);
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: _isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : LoginPage(),
//     );
//   }
// }
