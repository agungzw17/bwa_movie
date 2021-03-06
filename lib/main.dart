import 'bloc/blocs.dart';
import 'package:bwa_movie/services/services.dart';
import 'package:bwa_movie/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return StreamProvider.value(
    //   value: AuthServices.userStream,
    //   child: MultiBlocProvider(
    //       providers: [
    //         BlocProvider(create: (context) => PageBloc()),
    //         BlocProvider(create: (context) => UserBloc()),
    //         BlocProvider(create: (context) => ThemeBloc()),
    //         BlocProvider(create: (context) => MovieBloc()..add(FetchMovie())),
    //         BlocProvider(create: (_) => TicketBloc())
    //         // BlocProvider<PageBloc>(create: (context) => PageBloc()),
    //       ],
    //       child: BlocBuilder<ThemeBloc, ThemeState>(
    //           builder: (_, themeState) => MaterialApp(
    //               theme: themeState.themeData,
    //               debugShowCheckedModeBanner: false,
    //               home: Wrapper()))),
    // );
    return StreamProvider.value(
      value: AuthServices.userStream,
      initialData: null,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => PageBloc()),
            BlocProvider(create: (context) => UserBloc()),
            BlocProvider(create: (context) => ThemeBloc()),
            BlocProvider(create: (context) => MovieBloc()..add(FetchMovie())),
            BlocProvider(create: (_) => TicketBloc())
            // BlocProvider<PageBloc>(create: (context) => PageBloc()),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (_, themeState) => MaterialApp(
                  theme: themeState.themeData,
                  debugShowCheckedModeBanner: false,
                  home: Wrapper()))),
    );
  }
}
