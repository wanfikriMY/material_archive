// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material_archive/data/models/app_model.dart';
import 'package:material_archive/routes/app_routes.dart';
import 'package:material_archive/widgets/app_repo_list.dart';

void main(List<String> args) {
  runApp(RootApp(
    appRoute: AppRoute(),
  ));
}

class RootApp extends StatelessWidget {
  AppRoute? appRoute = AppRoute();

  RootApp({Key? key, this.appRoute}) : super(key: key);

  final List<AppRepo> appRepos = [
    AppRepo('Screenshots', 'Screenshot Demo', '/screenshot'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Refference Archive',
      onGenerateRoute: appRoute?.onGenerateRoute,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Refference Archive'),
          ),
          body: AppRepoList(appReposList: appRepos)),
    );
  }
}
