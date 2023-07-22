import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_api/application/downloads/downloads_bloc.dart';
import 'package:netflix_api/application/fast_laugh/fast_laugh_bloc.dart';

import 'package:netflix_api/application/search/search_bloc.dart';
import 'package:netflix_api/domain/core/di/injectable.dart';
import 'package:netflix_api/prasantation/main_page/screen_main_page.dart';

import 'application/hot_and_New/hot_and_new_bloc.dart';









void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
          BlocProvider(create: (ctx) => getIt<FastLaughBloc>()),
          BlocProvider(create: (ctx) => getIt<HotAndNewBloc>()),
      ],
      child: MaterialApp(
        title: 'Netflix_api',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          scaffoldBackgroundColor: Colors.black,
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: ScreenMainPage(),
      ),
    );
  }
}
