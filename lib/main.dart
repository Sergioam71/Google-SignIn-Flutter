import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_google_ios/services/google_signin_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Auth app google Ios'),
            actions: [
              IconButton(
                  onPressed: () {
                    GoogleSignInService.signOut();
                  },
                  icon: Icon(FontAwesomeIcons.doorOpen))
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                      splashColor: Colors.transparent,
                      minWidth: double.infinity,
                      height: 40,
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          ),
                          Text(
                            "  Ingrese con Google",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        ],
                      ),
                      onPressed: () {
                        GoogleSignInService.signInWithGoogle();
                      })
                ],
              ),
            ),
          )),
    );
  }
}
