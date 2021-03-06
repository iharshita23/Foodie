// ignore_for_file: prefer_const_constructors
// 101383762760089087855 client ID
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_app/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/config/color.dart';
import 'package:food_app/providers/check_out_providers.dart';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:blur/blur.dart';
 

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: FirebaseOptions(
      apiKey: "AIzaSyCzNzf8ZjKDvlrTXyXaoLms8sUsZTCw99c",
      appId: "1:933368472135:android:6b954c06cfd9d41d9cc762",
      messagingSenderId: "933368472135",
      projectId: "foodie-b0026",
    ),
   );
   runApp(const MyApp());
 }

 GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
Future<void> _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider<CheckoutProvider>(
          create: (context) => CheckoutProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: ScaffoldBackgroundColor),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return HomeScreen();
            }
            return SignIn();
          },
        ),
      ),
    );
  }
}

class Configurations {
      static const _apiKey = "AIzaSyCzNzf8ZjKDvlrTXyXaoLms8sUsZTCw99c";
      static const _authDomain = "foodie-b0026.firebaseapp.com";
      static const _projectId = "foodie-b0026";
      static const _storageBucket = "foodie-b0026.appspot.com";
      static const _messagingSenderId ="933368472135";
      static const _appId = "1:933368472135:android:6b954c06cfd9d41d9cc762";
    
//Make some getter functions
      String get apiKey => _apiKey;
      String get authDomain => _authDomain;
      String get projectId => _projectId;
      String get storageBucket => _storageBucket;
      String get messagingSenderId => _messagingSenderId;
      String get appId => _appId;
    }

