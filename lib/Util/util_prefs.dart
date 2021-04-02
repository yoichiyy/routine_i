import 'package:routine_i/main.dart';

makeUserLoggedIn(userID) {
  prefs.setBool("loggedIn", true);
  prefs.setString("uid", userID);
}

makeUserLogOut() async {
  await prefs.clear();
}

readLoggedIn() {
  return prefs.getBool("loggedIn") ?? false;
}

readUid() {
  return prefs.getString("uid") ?? "";
}
