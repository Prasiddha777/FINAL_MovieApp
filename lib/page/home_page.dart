import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:emailauthenticate/Widget/sign_up_widget.dart';
import 'package:emailauthenticate/Widget/logged_in_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // print("Snapshot");
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const LoggedInWidget();
            } else if (snapshot.hasError) {
              return Center(child: Text('Something Went Wrong'));
            } else {
              return SignUpWidget();
            }
          },
        ),
      );
}
