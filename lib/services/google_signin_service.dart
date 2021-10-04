//import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleSignInService {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',

      //quitamos la parte de uso de contactos
      //'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  static GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',

      //quitamos la parte de uso de contactos
      //'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  static Future signInWithGoogle() async {
    try {
      GoogleSignInAccount? _currentUser;
      String _contactText = '';

      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;

      //print('===============id token');
      //print(account);
      //print(googleKey.idToken);

      final signInWithGoogleEndpoint = Uri(
        scheme: 'https',
        host: 'google-ios-sign-in.herokuapp.com',
        path: '/google',
      );

      final session = await http
          .post(signInWithGoogleEndpoint, body: {'token': googleKey.idToken});

      print("======bakend===========");
      print(session.body);

      //return account;
    } catch (e) {
      print("error en Google Sign In");
      return null;
    }
  }

  static Future signOut() async {
    _googleSignIn.signOut();
  }
}
