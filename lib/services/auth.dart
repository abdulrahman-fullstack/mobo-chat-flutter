import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> user;
  // PublishSubject loading;

  AuthService() {
    // user = Observable(_auth.currentUser.uid);
    user = _auth.authStateChanges();
  }

  Future<User> googleSignIn() async {
    // Trigger Google Signin
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    } else {
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    return await _auth.signOut();
  }

  Future<User> guestSignIn() async {
    // Singing In Anonymously
    UserCredential credential = await _auth.signInAnonymously();
    return credential.user; // returning the user
  }
}

final AuthService authService = AuthService();
