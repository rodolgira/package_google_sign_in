import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/sheets/v4.dart';

abstract class IGoogleSignInProvider {
  Future<void> handleSignOut();
  Future<void> handleSignIn();
  Future<void> signInSilently();
}

class GoogleSignInProvider implements IGoogleSignInProvider {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      SheetsApi.driveScope,
      SheetsApi.spreadsheetsScope,
      SheetsApi.driveFileScope,
    ],
  );

  @override
  Future<void> handleSignIn() async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      print(error); // ignore: avoid_print
    }
  }

  @override
  Future<void> handleSignOut() => googleSignIn.disconnect();

  @override
  Future<void> signInSilently() async {
    googleSignIn.signInSilently();
  }
}
