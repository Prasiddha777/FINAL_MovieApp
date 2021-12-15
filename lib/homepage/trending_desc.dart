// ignore_for_file: prefer_const_constructors

import 'package:emailauthenticate/bloc/sql.dart';
import 'package:flutter/material.dart';
import 'package:emailauthenticate/bloc/sql.dart';

class TrendingDesc extends StatefulWidget {
  const TrendingDesc({
    Key? key,
    required this.name,
    required this.bannerurl,
    required this.description,
    required this.launch,
    required this.posterurl,
    required this.vote,
    required this.id,
  }) : super(key: key);

  final String name, description, bannerurl, posterurl, vote, launch;
  final int id;

  @override
  State<TrendingDesc> createState() => _TrendingDescState();
}

class _TrendingDescState extends State<TrendingDesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    widget.bannerurl,
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned(
                  left: 10,
                  top: 220,
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      '⭐ Avergae Rating : ' + widget.vote,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              widget.name != null ? widget.name : 'not loaded',
              style: const TextStyle(
                // color: Colors.grey,
                fontSize: 24,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(
                left: 10,
                top: 2,
              ),
              child: Text(
                'Releasing on: ' + widget.launch,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red.shade900,
                ),
              )),
          Container(
              padding: const EdgeInsets.only(
                left: 10,
                top: 2,
              ),
              child: Text(
                'Movie Id: ' + widget.id.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                height: 150,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red.shade900,
                ),
                child: Image.network(widget.posterurl),
              ),
              Flexible(
                child: Column(children: [
                  Text(widget.description),
                ]),
              ),
            ],
          ),
          Container(
            height: 200,
            child: SQLHomePage(
              id: widget.id,
            ),
          )
        ],
      ),
      // floatingActionButton:
      //     FloatingActionButton(child: const Icon(Icons.add), onPressed: ()  => _showForm(null),
      //         ),
    );
  }
}
