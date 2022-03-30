import 'package:bwa_movie/models/models.dart';
import 'package:bwa_movie/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_state.dart';
part 'movie_event.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<FetchMovie>((event, emit) async {
      List<MovieModel> movies = await MovieServices.getMovie(1);

      emit(MovieLoaded(movies: movies));
    });
  }

  // @override
  // Stream<MovieState> mapEventToState(MovieEvent event) async* {
  //   if(event is FetchMovie) {
  //     List<MovieModel> movies = await MovieServices.getMovie(1);
  //
  //     yield MovieLoaded(movies: movies);
  //   }
  // }

}
