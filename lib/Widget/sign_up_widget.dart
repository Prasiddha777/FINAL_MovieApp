import 'package:emailauthenticate/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 32.0,
          bottom: 40.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 300.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/mlogo.jpg'), fit: BoxFit.cover),
              ),
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hey There, \nWelcome Back .",
                style: TextStyle(
                  color: Color(0xFFB71C1C),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login to your account to continue...',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Download on Google Play\nDownload on the App Store.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 80,
                height: 50.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logostore.png'),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            // const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[800],
                ),
                onPressed: () {
                  final provider = Provider.of<GoogleSignInProvide>(
                    context,
                    listen: false,
                  );
                  provider.googleLogin();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                label: const Text(
                  'Sign Up With Google',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: RichText(
                text: const TextSpan(
                  text: 'Already have an account?  ',
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: 'Login In',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFFB71C1C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
