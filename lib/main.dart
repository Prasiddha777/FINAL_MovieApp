import 'package:emailauthenticate/onboard/onboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:emailauthenticate/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:emailauthenticate/page/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MovieMyApp());
}

class MovieMyApp extends StatelessWidget {
  const MovieMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvide(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // title:,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),

          home: const OnBoarding(),
        ),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.red[900],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hey There,",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Login to your account to continue",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvide>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey),
                        ),
                        label: const Text('Sign up With Google'),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Already have an account?',
                          children: [
                            TextSpan(
                              text: ' Login In',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
