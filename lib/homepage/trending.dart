import 'package:emailauthenticate/favoritesdb/favsqlhelper.dart';
import 'package:emailauthenticate/homepage/trending_desc.dart';
import 'package:flutter/material.dart';

import 'movie_model.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies(
      {Key? key, required this.trending, required this.trendingmoviemodel})
      : super(key: key);

  final List trending;
  final List<MovieModel> trendingmoviemodel;

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trending Movies",
            style: TextStyle(
              color: Colors.red.shade900,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrendingDesc(
                          name: widget.trending[index]['title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              widget.trending[index]['backdrop_path'],
                          description: widget.trending[index]['overview'],
                          launch: widget.trending[index]['release_date'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              widget.trending[index]['poster_path'],
                          vote:
                              widget.trending[index]['vote_average'].toString(),
                          id: widget.trending[index]['id'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 260,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          widget.trendingmoviemodel[index].img,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // ignore: prefer_const_constructors

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 10),
                              child: IconButton(
                                icon: (!widget
                                        .trendingmoviemodel[index].isfavourite
                                    ? const Icon(Icons.favorite_border)
                                    : const Icon(Icons.favorite)),

                                color: !widget
                                        .trendingmoviemodel[index].isfavourite
                                    ? Colors.white
                                    : Colors.red,

                                onPressed: () {
                                  setState(
                                    () {
                                      if (widget.trendingmoviemodel[index]
                                          .isfavourite) {
                                        removeFavoriteDB(widget
                                            .trendingmoviemodel[index].id);
                                        widget.trendingmoviemodel[index]
                                            .isfavourite = false;
                                      } else {
                                        addToFavoriteDB(
                                          widget.trendingmoviemodel[index].id,
                                          widget.trendingmoviemodel[index].name,
                                          widget.trendingmoviemodel[index].img,
                                        );
                                        widget.trendingmoviemodel[index]
                                            .isfavourite = true;
                                      }
                                    },
                                  );
                                },

                                // color: TrendingMovies.,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Text(widget.trendingmoviemodel[index].name),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  addToFavoriteDB(int id, String moviename, String image) async {
    await FavSQLHelper.createItem(
      id,
      moviename,
      image,
    );
  }

  removeFavoriteDB(int id) async {
    await FavSQLHelper.deleteItem(id);
  }
}
