import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final _auth = FirebaseAuth.instance;
  final _googleAuth = GoogleSignIn.standard();

  Stream<User?> get dataUser => _auth.authStateChanges();

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleAccount = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleAccount!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException {
      rethrow;
    }

    void signOut() async {
      try {
        _auth.signOut();
        _googleAuth.signOut();
      } on FirebaseAuthException {
        rethrow;
      }
    }
  }
}
