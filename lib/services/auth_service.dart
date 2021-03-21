import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobochat/constants.dart';
import 'package:mobochat/models/users_model.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<User> user;

  AuthService() {
    user = _auth.authStateChanges();
  }

  Future _addUserOnDB(User user) async {
    Map<String, dynamic> newUser = {
      UsersModel.name: user.displayName,
      UsersModel.email: user.email,
      UsersModel.uid: user.uid,
      UsersModel.deviceToken: [],
      UsersModel.lastLogin: Timestamp.now(),
    };
    _db.collection(UsersColl).doc(user.uid).set(newUser);
  }

  Future _saveLastLoginAndReturnUser(User user) async {
    final snap = await _db
        .collection(UsersColl)
        .where(UsersModel.uid, isEqualTo: user.uid)
        .get();
    if (snap.size == 0) {
      await this._addUserOnDB(user);
    } else if (snap.size == 1) {
      snap.docs.forEach((element) {
        element.reference.update({UsersModel.lastLogin: Timestamp.now()});
      });
    }
    return user;
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
      // Updatng the last login time of the user ( if the user is not in db then we will add )
      await this._saveLastLoginAndReturnUser(userCredential.user);
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
