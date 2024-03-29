import 'package:flutter/material.dart';
import 'ChatUsersScreen.dart';
import 'Global.dart';
import 'User.dart';

class LoginScreen extends StatefulWidget {
  //
  LoginScreen() : super();

  static const String ROUTE_ID = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    G.initDummyUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's Chat"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(20.0),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
                child: Text('LOGIN'),
                onPressed: () {
                  _loginBtnTap();
                })
          ],
        ),
      ),
    );
  }

  _loginBtnTap() async {
    if (_usernameController.text.isEmpty) {
      return;
    }
    User me;

    for (User user in G.dummyUsers) {
      print(user.name);
      if (_usernameController.text.toString().toLowerCase() ==
          user.name.toString().toLowerCase()) {
        me = user;
        break;
      }
    }

    G.loggedInUser = me;

    openHomeScreen(context);
  }

  static openHomeScreen(BuildContext context) async {
    await Navigator.pushReplacementNamed(
      context,
      ChatUsersScreen.ROUTE_ID,
    );
  }
}
