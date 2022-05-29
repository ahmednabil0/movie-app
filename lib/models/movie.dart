class Movie {
  String title;
  // ignore: non_constant_identifier_names
  String poster_path;
  String overview;
  int id;
  // ignore: non_constant_identifier_names
  double vote_average;
  Movie({
    required this.title,
    // ignore: non_constant_identifier_names
    required this.poster_path,
    required this.overview,
    required this.id,
    // ignore: non_constant_identifier_names
    required this.vote_average,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'poster_path': poster_path});
    result.addAll({'overview': overview});
    result.addAll({'id': id});
    result.addAll({'vote_average': vote_average});

    return result;
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] ?? '',
      poster_path: map['poster_path'] ?? '',
      overview: map['overview'] ?? '',
      id: map['id']?.toInt() ?? 0,
      vote_average: map['vote_average']?.toDouble() ?? 0.0,
    );
  }
}
