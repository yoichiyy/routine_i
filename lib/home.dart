// // import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:routine_i/pages/task_list.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int currentIndex = 0;
//   List pages = [TaskList()];
//   bool isLoading = true;

//   @override
//   void initState() {
//     get();
//     super.initState();
//   }

//   get() async {
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Center(
//             child: CircularProgressIndicator(),
//           )
//         : Scaffold(
//             body: pages[currentIndex],

//             bottomNavigationBar: BottomNavigationBar(
//               unselectedItemColor: Colors.white,
//               backgroundColor: Colors.grey[850], //プロパティ
//               currentIndex: currentIndex,
//               onTap: (index) {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//               items: [
//                 BottomNavigationBarItem(icon: Icon(Icons.list), label: "task"),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.library_books), label: "Statistics"),
//                 BottomNavigationBarItem(
//                     icon: Icon(
//                       Icons.settings,
//                     ),
//                     label: "Settings"),
//               ],
//             ), // This trailing comma makes auto-formatting nicer for build methods.
//           );
//   }
// }
