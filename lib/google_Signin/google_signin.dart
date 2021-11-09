import 'package:flutter_firebase_app/google_Signin/userDetailsModel.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';

class ControllerLogin with ChangeNotifier {
  var googleSignInNow = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetailsModel? userDetailsModel;
  allowUserToLogin() async {
    this.googleSignInAccount = await googleSignInNow.signIn();
    this.userDetailsModel = UserDetailsModel(
        displayName: this.googleSignInAccount!.displayName,
        email: this.googleSignInAccount!.email,
        photoURL: this.googleSignInAccount!.photoUrl);
    notifyListeners();
  }

  allowUserToLogout() async {
    this.googleSignInAccount = await googleSignInNow.signOut();
    userDetailsModel = null;
    notifyListeners();
  }
}
