import '../../shared/network/remote/items.dart';

abstract class AppState {}

class AppInitialState extends AppState {}

class ChangeNavigationBarIndexState extends AppState {}

class AppChangeModeState extends AppState {}

//cover Home
class HomeCoversLoadingState extends AppState {}

class HomeCoversSuccessState extends AppState {
  final List<Items> items;
  HomeCoversSuccessState(this.items);
}

class HomeCoversErrorState extends AppState {
  final String error;

  HomeCoversErrorState(this.error);
}

//categories Home
class HomeCategoriesLoadingState extends AppState {}

class HomeCategoriesSuccessState extends AppState {
  final List<Items> items;

  HomeCategoriesSuccessState(this.items);
}

class HomeCategoriesErrorState extends AppState {
  final String error;

  HomeCategoriesErrorState(this.error);
}

//Recent Home
class HomeRecentLoadingState extends AppState {}

class HomeRecentSuccessState extends AppState {
  final List<Items> items;

  HomeRecentSuccessState(this.items);
}

class HomeRecentErrorState extends AppState {
  final String error;

  HomeRecentErrorState(this.error);
}

//cover Explore
class ExploreCoversLoadingState extends AppState {}

class ExploreCoversSuccessState extends AppState {
  final List<Items> items;

  ExploreCoversSuccessState(this.items);
}

class ExploreCoversErrorState extends AppState {
  final String error;

  ExploreCoversErrorState(this.error);
}

//categories Explore
class ExploreCategoriesLoadingState extends AppState {}

class ExploreCategoriesSuccessState extends AppState {
  final List<Items> items;

  ExploreCategoriesSuccessState(this.items);
}

class ExploreCategoriesErrorState extends AppState {
  final String error;

  ExploreCategoriesErrorState(this.error);
}

//category Items
class CategoryItemsLoadingState extends AppState {}

class CategoryItemsSuccessState extends AppState {
  final List<Items> items;

  CategoryItemsSuccessState(this.items);
}

class CategoryItemsErrorState extends AppState {
  final String error;
  CategoryItemsErrorState(this.error);
}

//DataBase
class CreateDatabaseState extends AppState{}

class InsertToDatabaseState extends AppState{}

class GetDataFromDatabaseState extends AppState{}
class UpdateDatabaseState extends AppState{}

