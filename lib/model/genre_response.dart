import 'package:emailauthenticate/model/genre.dart';
import 'package:emailauthenticate/model/movie.dart';

class GenreResponse {
  final List<Genre> genres;
  final String error;

  GenreResponse(this.genres, this.error);

  GenreResponse.fromJson(Map<String, dynamic> json)
      : genres = (json["genres"] as List)
            .map((i) => new Genre.fromJson(i))
            .toList(),
        error = "";

  GenreResponse.withError(String errorValue)
      // ignore: deprecated_member_use
      : genres = [],
        error = errorValue;
}
