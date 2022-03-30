part of 'models.dart';

class MovieModel extends Equatable {
  final int? id;
  final String? title;
  final double? voteAvarage;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;

  MovieModel(
      {@required this.id,
      @required this.backdropPath,
      @required this.posterPath,
      @required this.overview,
      @required this.voteAvarage,
      @required this.title});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path'],
        overview: json['overview'],
        voteAvarage: (json['vote_average'] as num).toDouble(),
        title: json['title']);
  }

  @override
  List<Object> get props =>
      [id!, title!, voteAvarage!, overview!, posterPath!, backdropPath!];
}
