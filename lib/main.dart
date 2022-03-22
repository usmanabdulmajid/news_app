import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/api_client.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/service/local_db/sql_db.dart';
import 'package:news_app/view/home.dart';
import 'package:news_app/viewmodel/cubit/news_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => NewsCubit(NewsRepository(ApiClient(), SqlDb())),
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColor.white,
        ),
        home: const Home(),
      ),
    );
  }
}
