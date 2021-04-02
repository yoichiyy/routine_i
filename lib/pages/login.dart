import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:routine_i/Util/util_prefs.dart';
import 'package:routine_i/main.dart';

String userId;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user;
  TextEditingController emailController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  FirebaseAuth auth;
  FirebaseFirestore firestore;
  CollectionReference userCollection;
  // FirebaseMessaging _firebaseMessaging;

  bool isLoading = true;

  _register() async {
    try {
      final UserCredential userCred =
          (await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: pwdController.text.trim(),
      ));

      user = userCred.user;

      if (user != null) {
        print("Success");
        userCollection.doc(user.uid).set(
          {
            "email": emailController.text.trim(),
            "uid": user.uid,
          },
        );
      } else {
        print("Not Success");
      }
    } catch (e) {
      print(e.code);
      if (e.code == "email-already-in-use") {
        final UserCredential userCred = (await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: pwdController.text.trim(),
        ));

        user = userCred.user;
      }
    }

    if (user != null) {
      makeUserLoggedIn(user.uid);
      userId = user.uid;

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) {
            return MyApp();
          },
        ),
        (r) => false,
      );
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Try Again")),
                ],
                title: Text("Some Error Happened"),
              ));
    }
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  get() async {
    //???ここは何をgetしているのか？
    await Firebase.initializeApp();
    // _firebaseMessaging = FirebaseMessaging();
    // String token = await _firebaseMessaging.getToken();

    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
    userCollection = firestore.collection("users");
    // _firebaseMessaging.configure(
    //   onMessage: (message) async {
    //     print("MEsaage");
    //   },
    //   onResume: (message) async {
    //     print("MEsaage");
    //   },
    //   // onBackgroundMessage: (message) async {
    //   //   print("MEsaage");
    //   // },
    //   // onLaunch: (message) async {
    //   //   print("MEsaage");
    //   // },
    // );

    if (readLoggedIn()) {
      String uid = readUid();
      if (uid != "") {
        userId = uid;
      }
      // userCollection.doc(uid).update({"token": token});
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) {
            return MyHomePage();
          },
        ),
        (r) => false,
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                textField(
                  controller: emailController,
                  hint: "Email",
                ),
                SizedBox(
                  height: 10,
                ),
                textField(
                  controller: pwdController,
                  hint: "Password",
                  isPWD: true, //???
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _register,
                  child: Text(
                    "Login / Register",
                  ),
                )
              ],
            ),
    );
  }
}

Widget textField({
  //どっちだっけ。{}がさらに（）の中に入るやつは、type指定しないんだっけ???
  controller,
  hint,
  isPWD,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0), //???constを消してもいいのか？ここではどういう働き？
    child: TextFormField(
      obscureText: isPWD ?? false,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
      ),
    ),
  );
}
