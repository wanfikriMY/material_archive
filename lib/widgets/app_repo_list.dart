import 'package:flutter/material.dart';
import 'package:material_archive/data/models/app_model.dart';

class AppRepoList extends StatelessWidget {
  final List<AppRepo> appReposList;
  const AppRepoList({Key? key, required this.appReposList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemCount: appReposList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(appReposList[index].name ?? 'App Name'),
          subtitle: Text(appReposList[index].description ?? 'App Description'),
          onTap: () {
            Navigator.pushNamed(context, appReposList[index].route!);
          },
        );
      },
    ));
  }
}
