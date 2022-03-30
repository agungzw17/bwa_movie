part of 'models.dart';

class MovieDetailModel extends MovieModel {
  final List<String>? genres;
  final String? language;

  MovieDetailModel(MovieModel movieModel, {this.genres, this.language})
      : super(
            id: movieModel.id,
            title: movieModel.title,
            voteAvarage: movieModel.voteAvarage,
            overview: movieModel.overview,
            posterPath: movieModel.posterPath,
            backdropPath: movieModel.backdropPath);

  String get genreAndLanguage {
    String s = "";

    for(var genre in genres!) {
      s += genre + (genre != genres?.last ? ',' : '');
    }

    return "$s - $language";
  }

  @override
  List<Object> get props => super.props + [genres!, language!];
}
