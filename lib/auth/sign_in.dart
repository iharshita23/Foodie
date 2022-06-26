// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_new, prefer_interpolation_to_compose_strings
import'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_app/screens/home_screen/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blur/blur.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //UserProvider userProvider;
  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
       print("signed in " + user!.displayName.toString());
      // userProvider.addUserData(
      //   currentUser: user,
      //   userEmail: user?.email,
      //   userImage: user?.photoURL,
      //   userName: user?.displayName,
      // );

      return user;
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('background.jpg')
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              //color: Colors.redAccent,
              child: Column(
                children: [
                  Text('Sign in to continue'),
                  Text(
                    'Foodie',
                    style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color.fromARGB(255, 6, 102, 25),
                        offset: Offset(3,3),
                      )
                    ]
                    ),
                  ),
                  SignInButton(
                    Buttons.Apple,
                    text: "Sign in with Apple",
                    onPressed: () {},
                 ),
                  SignInButton(
                    Buttons.Google,
                    text: "Sign in with Google",
                    onPressed: () {;
                      _googleSignUp().then(
                        (value) => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) => HomeScreen(),
                        ),
                      ),
                    );
                  },
                 ),
                 Column(
                   children: [
                     Text('By signing in you are agreeing to our', style: TextStyle(color: Color.fromARGB(255, 58, 55, 55)),),
                   ],
                 ),
                 Column(
                   children: [
                     Text('Terms and Privacy Policy',style: TextStyle(color: Color.fromARGB(255, 58, 55, 55)),),
                   ],
                 ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

