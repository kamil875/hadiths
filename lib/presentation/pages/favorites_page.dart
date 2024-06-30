import 'package:flutter/material.dart';

import '../../core/strings/app_strings.dart';
import '../lists/favorite_hadith_list.dart';


class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
          body: const FavoriteHadithsList(),
    );
  }
}
