import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:yro/models/user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthService({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  Userre _userFromFirebase(User user) {
    if (user == null) {
      return null;
    }
    return Userre(
      uid: user.uid,
      photoUrl: user.photoURL,
      displayName: user.displayName,
    );
  }

  Stream<Userre> get onAuthStateChanged {
    return _firebaseAuth.idTokenChanges().map(_userFromFirebase);
  }

  Future<Userre> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  Future<Userre> signInWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  Future<Userre> createUserWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  Future<Userre> signInWithPhoneNumber(String phoneno, String code) async {
    ConfirmationResult confirmationResult =
        await _firebaseAuth.signInWithPhoneNumber(
      phoneno,
    );
    UserCredential userCredential = await confirmationResult.confirm(code);
    return _userFromFirebase(userCredential.user);
  }

  Future<Userre> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final authResult = await _firebaseAuth.signInWithCredential(credential);
    return _userFromFirebase(authResult.user);
  }

//SignIn
  signIn(AuthCredential credential) {
    FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithOTP(smsCode, verId) async {
    AuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
    final authResult = await _firebaseAuth.signInWithCredential(credential);
    return _userFromFirebase(authResult.user);
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<Userre> currentUser() async {
    // ignore: await_only_futures
    final user = await _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }
}
