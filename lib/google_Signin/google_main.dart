import 'package:flutter_firebase_app/google_Signin/google_signin.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Google_Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ControllerLogin())
      ],
      child: MaterialApp(
        title: 'Google  SignIn',
        home: Scaffold(),
      ),
    );
  }
}
