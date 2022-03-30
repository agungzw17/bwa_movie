import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeData())) {
    on<ChangeTheme>((event, emit) => emit(ThemeState(event.themeData)));
  }

  // @override
  // Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
  //   if (event is ChangeTheme) {
  //     yield ThemeState(event.themeData);
  //   }
  // }
}
