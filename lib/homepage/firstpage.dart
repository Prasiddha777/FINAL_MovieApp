import 'package:emailauthenticate/favoritesdb/favsqlhelper.dart';
import 'package:emailauthenticate/homepage/movie_model.dart';
import 'package:emailauthenticate/homepage/toprated.dart';
import 'package:emailauthenticate/homepage/trending.dart';
import 'package:emailauthenticate/homepage/tv.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class FirstHome extends StatefulWidget {
  const FirstHome({Key? key}) : super(key: key);

  @override
  _FirstHomeState createState() => _FirstHomeState();
}

class _FirstHomeState extends State<FirstHome> {
  List trendingmovies = [];
  List<MovieModel> trendingmoviemodel = [];

  List topratedmovies = [];
  List tv = [];
  final String apikey = 'ce988b338d830af0eaec7bfc15b086fb';

  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTk4OGIzMzhkODMwYWYwZWFlYzdiZmMxNWIwODZmYiIsInN1YiI6IjYxOTZlYzg2NjM1MzZhMDA2MTkyMWMzYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5kVYUJC8SnTY-BqP1hUpTJGAE5fWC9nuwyEZCTC55Tk';

  loadmovie() async {
    final tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    // print('''

    // hamro data

    // asdfasdf
    // sdf
    // asd

    // ''');
    print(trendingresult);

    setState(() {
      trendingmovies = trendingresult['results'];

      var list = trendingresult['results'] as List;

      print(list);

      trendingmoviemodel =
          list.map<MovieModel>((data) => MovieModel.fromJson(data)).toList();

      trendingmoviemodel.forEach((element) async {
        List<Map<String, dynamic>> data =
            await FavSQLHelper.getItem(element.id);
        debugPrint("this is data" + data.toString());
        if (data.isEmpty) {
          element.isfavourite = false;
        } else {
          element.isfavourite = true;
        }
      });

      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    // print(trendingmovies);
  }

  @override
  void initState() {
    loadmovie();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TrendingMovies(
            trending: trendingmovies,
            trendingmoviemodel: trendingmoviemodel,
          ),
          TopRated(toprated: topratedmovies),
          TV(tv: tv),
        ],
      ),
    );
  }
}
