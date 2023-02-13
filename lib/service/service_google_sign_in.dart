import 'package:google_sign_in/google_sign_in.dart';

import '../provider/provider_google_sign_in.dart';

abstract class IGoogleSignInService {
  Future<void> handleSignOut();
  Future<void> handleSignIn();
  Future<void> signInSilently();
}

class GoogleSignInService implements IGoogleSignInService {
  static final GoogleSignInService _instance = GoogleSignInService._internal();

  factory GoogleSignInService() {
    return _instance;
  }

  GoogleSignInService._internal();

  final GoogleSignInProvider googleSignInProvider = GoogleSignInProvider();

  GoogleSignIn get getGoogleSignIn => googleSignInProvider.googleSignIn;

  @override
  Future<void> handleSignIn() async {
    await googleSignInProvider.handleSignIn();
  }

  @override
  Future<void> handleSignOut() async {
    await googleSignInProvider.handleSignOut();
  }

  @override
  Future<GoogleSignInAccount?> signInSilently() async {
    return await googleSignInProvider.signInSilently();
  }
}
