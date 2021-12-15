class FavModel {
  int id;
  int movieid;
  String img;
  String name;
  FavModel(
      {required this.id,
      required this.movieid,
      required this.img,
      required this.name});

  factory FavModel.fromMap(Map<String, dynamic> map) {
    return FavModel(
      movieid: map['movieid'],
      id: map['id'] ?? 0,
      img: map['img'],
      name: map['name'],
    );
  }
}
