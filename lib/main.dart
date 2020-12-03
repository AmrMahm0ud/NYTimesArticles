import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:ny_times_popular_articles/screens/articles_screen.dart';
import 'bloc/articles_bloc/articles_bloc.dart';
import 'bloc/articles_bloc/articles_bloc_repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticlesBloc(ArticlesRepo()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NY Most Popular Articles',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ArticlesScreen(),
      ),
    );
  }
}
