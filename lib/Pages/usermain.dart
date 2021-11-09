import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/user/changePass.dart';
import 'package:flutter_firebase_app/user/dashbord.dart';
import 'package:flutter_firebase_app/user/profile.dart';

class UserMain extends StatefulWidget {
  const UserMain({Key? key}) : super(key: key);

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  int _indexes = 0;
  static List<Widget> _widgetOption = <Widget>[
    Dashboard(),
    Profile(),
    ChangePass(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _indexes = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_indexes),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Change Password'),
        ],
        currentIndex: _indexes,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
