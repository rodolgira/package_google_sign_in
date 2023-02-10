import 'package:google_sign_in/google_sign_in.dart';

import '../provider/provider_google_sign_in.dart';

abstract class IGoogleSignInService {
  Future<void> handleSignOut();
  Future<void> handleSignIn();
  Future<void> signInSilently();
}

class GoogleSignInService implements IGoogleSignInService {
  final GoogleSignInProvider googleSignInProvider;

  GoogleSignInService({required this.googleSignInProvider});

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
  Future<void> signInSilently() async {
    await googleSignInProvider.signInSilently();
  }
}
