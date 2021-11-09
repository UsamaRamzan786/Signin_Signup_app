import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/Pages/login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final uemail = FirebaseAuth.instance.currentUser!.email;
  final ucreationTime =
      FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User? user = FirebaseAuth.instance.currentUser;

  verifyEmail() async {
    if (user != null && user!.emailVerified) {
      await user!.sendEmailVerification();
      print("Verification Email has been sent");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text(
            "Verification Email has been sent",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Image.asset('images/profile.png'),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'User ID',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
                Text(
                  uid,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Email: $uemail",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                user!.emailVerified
                    ? Text(
                        "Verified",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      )
                    : TextButton(
                        onPressed: () {
                          verifyEmail();
                        },
                        child: Text(
                          'Verify Email',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "User Created Time : $ucreationTime ",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                      (route) => false);
                },
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 18.0),
                ))
          ],
        ),
      ),
    );
  }
}
