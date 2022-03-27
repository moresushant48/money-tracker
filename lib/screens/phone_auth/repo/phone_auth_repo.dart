import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthRepo {
  late FirebaseAuth auth;

  PhoneAuthRepo() {
    auth = FirebaseAuth.instance;
  }

  Future<bool> isLoggedIn() {
    return Future.value(auth.currentUser != null);
  }

  Future<User> getCurrentUser() {
    return Future.value(auth.currentUser);
  }

  Future<void> logOut() {
    return Future.value(auth.signOut());
  }

  Future<void> sendOtp(String mobileNo, onCodeSent) {
    return auth.verifyPhoneNumber(
      phoneNumber: "+91$mobileNo",
      verificationCompleted: (phoneAuthCredential) {},
      codeAutoRetrievalTimeout: (val) {},
      verificationFailed: (e) {
        print("verificationFailed => ${e.message}");
      },
      codeSent: onCodeSent,
    );
  }

  Future<bool> verifyOtp(String verificationId, String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    UserCredential userCredential = await auth.signInWithCredential(credential);
    return Future.value(userCredential.user != null);
  }
}
