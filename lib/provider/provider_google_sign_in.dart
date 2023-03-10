import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis/classroom/v1.dart';



abstract class IGoogleSignInProvider {
  Future<void> handleSignOut();
  Future<void> handleSignIn();
  Future<void> signInSilently();
}

class GoogleSignInProvider implements IGoogleSignInProvider {
  static final GoogleSignInProvider _instance =
      GoogleSignInProvider._internal();

  factory GoogleSignInProvider() {
    return _instance;
  }

  GoogleSignInProvider._internal();

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      SheetsApi.driveScope,
      SheetsApi.spreadsheetsScope,
      SheetsApi.driveFileScope,
      ClassroomApi.classroomCoursesScope,
      ClassroomApi.classroomAnnouncementsScope,
      ClassroomApi.classroomCourseworkMeScope,
      ClassroomApi.classroomCourseworkStudentsScope,
      ClassroomApi.classroomCourseworkmaterialsScope,
      ClassroomApi.classroomGuardianlinksStudentsReadonlyScope,
      ClassroomApi.classroomTopicsScope,
      ClassroomApi.classroomRostersScope,
      ClassroomApi.classroomProfilePhotosScope,
      ClassroomApi.classroomProfileEmailsScope,

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
  Future<GoogleSignInAccount?> signInSilently() async {
    return await googleSignIn.signInSilently();
  }
}
