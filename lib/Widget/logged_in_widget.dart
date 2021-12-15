import 'package:emailauthenticate/homepage/trending.dart';
import 'package:emailauthenticate/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:emailauthenticate/homepage/firstpage.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:emailauthenticate/homepage/favorites.dart';

class LoggedInWidget extends StatefulWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  State<LoggedInWidget> createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.grey[200],
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red[900],
                ),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(user!.photoURL!),
                    ),
                  ),
                ),
                accountName: Text(user.displayName!),
                accountEmail: Text(user.email!),
              ),
              Container(
                width: double.infinity,
                height: 40,
                color: Colors.grey.shade200,
                child: TextButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.favorite),
                        SizedBox(
                          width: 15,
                        ),
                        Text("Favourites"),
                      ],
                    ),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => FavoritesPage()),
                    // );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 40,
                color: Colors.grey.shade200,
                child: TextButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.watch_later),
                        SizedBox(
                          width: 15,
                        ),
                        Text("Add to Watch later"),
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 40,
                color: Colors.grey.shade200,
                child: TextButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 15,
                        ),
                        Text("Logout"),
                      ],
                    ),
                  ),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvide>(context,
                        listen: false);
                    provider.logout();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        title: Text(
          'MovieApp',
          style: TextStyle(
            color: Colors.red[900],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: FirstHome(),
    );
  }
}
