import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/Pages/login.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final _formkey = GlobalKey<FormState>();
  var pass = '';
  final passController = TextEditingController();
  final currentuser = FirebaseAuth.instance.currentUser;
  changePass() async {
    try {
      await currentuser!.updatePassword(pass);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Text(
              'Password Changed. Login',
              style: TextStyle(color: Colors.white),
            )),
      );
    } catch (e) {}
  }

  @override
  void dispose() {
    passController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset('images/change.jpg'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'New Password',
                      hintText: 'New Password',
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(fontSize: 15, color: Colors.red)),
                  controller: passController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    setState(
                      () {
                        pass = passController.text;
                      },
                    );
                    changePass();
                  }
                },
                child: Text(' Change Password '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
