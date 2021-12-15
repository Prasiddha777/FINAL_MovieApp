class MovieModel {
  int id;
  String name, img;
  bool isfavourite;

  MovieModel({
    required this.id,
    required this.name,
    required this.img,
    required this.isfavourite,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    // print("This is json" + json.toString());
    return MovieModel(
      name: json['name'] ?? json['title'] ?? "",
      img: json['poster_path'],
      id: json['id'],
      isfavourite: false,
    );
  }

  //  Map<String, dynamic> toJson() => {
  //    final Map<String, dynamic> myList= new Map<String, dynamic>();
  //       myList['name']=this.name;
  //        myList['img']=this.img;
  //        myList['name']=this.name;

  //     };
// }

}


//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'email': email,
//       };
// }