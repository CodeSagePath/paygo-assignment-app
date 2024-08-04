import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 16,
    );
  }
}
