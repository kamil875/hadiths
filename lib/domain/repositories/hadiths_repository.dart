import '../entities/hadith_entity.dart';

abstract class HadithRepository {
  Future<List<HadithEntity>> getAllHadiths();

  Future<HadithEntity> getHadithById({required int hadithId});

  Future<List<HadithEntity>> getAllFavoriteHadiths();

  Future<void> addRemoveFavorite({required int hadithId, required int favoriteState});

  Future<int> getFavoriteState({required int hadithId});

  Future<void> addHadith({required Map<String, dynamic> mapHadith});

  Future<void> changeHadith({required int hadithId, required Map<String, dynamic> mapHadith});

  Future<void> removeHadith({required int hadithId});
}
