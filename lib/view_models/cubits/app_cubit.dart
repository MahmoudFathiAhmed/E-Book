import 'package:e_book/view_models/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/screens/explore_screen.dart';
import '../../modules/screens/home_screen.dart';
import '../../modules/screens/setting_screen.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/network/remote/app_api.dart';
import '../../shared/network/remote/items.dart';
import '../../shared/network/remote/items_repository.dart';


class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  // AppApi appApi =AppApi();
  ItemsRepository itemsRepository=ItemsRepository(AppApi());
  // final AppApi appApi;
  //[General]
  int currentIndex = 0;
  List<Widget> screens =
  [
    const HomeScreen(),
    const ExploreScreen(),
    const SettingsScreen()
  ];
  List<String> titles =
  [
    'Home',
    'Explore',
    'Settings'
  ];
  List<BottomNavigationBarItem> bottomItems = const[
    BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home',),
    BottomNavigationBarItem(
        icon: Icon(Icons.explore_outlined), label: 'explore'),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'settings'),
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeNavigationBarIndexState());
  }

  //Theme
  bool isDark = false;

  void changeAppMode({ bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
    }
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeState());
    });
  }
  //Home
  late List<Items> coversList=[];
  // List<Items> coversList=[];
  // Map<String, bool>favourites={};
  List<Items> getHomeCoversList(){
      emit(HomeCoversLoadingState());
      itemsRepository.getItems('public').then((coversList){
        this.coversList = coversList;
      // coversList.forEach((element) {
      //   favourites.addAll({
      //     element.id!: false,
      //   });
      // });
      emit(HomeCoversSuccessState(coversList));
      });
      // print(coversList.first.title);
        return coversList;
  }

  late List<Items> categoriesList=[];
  // List<Items> categoriesList=[];
  List<Items> getHomeCategoriesList(){
      emit(HomeCategoriesLoadingState());
      itemsRepository.getItems('public').then((categoriesList){
        this.categoriesList = categoriesList;
        emit(HomeCategoriesSuccessState(categoriesList));
      });
      return categoriesList;
  }

  late List<Items> recentList=[];
  // List<Items> recentList=[];
  List<Items> getHomeRecentItems(){
      emit(HomeRecentLoadingState());
      itemsRepository.getItems('recent').then((recentList){
        this.recentList = recentList;
        emit(HomeRecentSuccessState(recentList));
      });
      return recentList;
  }
//Explore
  late List<Items>  elementsForCovers=[];
  // List<Items>  elementsForCovers=[];
  List<Items> getExploreCoversItems({required String category}) {
        emit(ExploreCoversLoadingState());
        itemsRepository.getItems(category).then((elementsForCovers){
          this.elementsForCovers = elementsForCovers;
          emit(ExploreCoversSuccessState(elementsForCovers));
        });
        return elementsForCovers;
  }
//Categories
  late List<Items> elementsForCategories=[];
  // List<Items> elementsForCategories=[];
  List<Items> getCategoryScreenItems({required String category}) {
      emit(CategoryItemsLoadingState());
      itemsRepository.getItems (category).then((elementsForCategories){
        this.elementsForCategories = elementsForCategories;
        emit(CategoryItemsSuccessState(elementsForCategories));
      });
      return elementsForCategories;
    }

  //Database
/*
* 1-create database
* 2-create tables
* 3-open database
* 4-insert database
* 5-get from database
* 6-update in database
* 7-delete from database
* */
  Database? database;
  List<Map> favourites = [];
  void createDatabase(){
    openDatabase(
      'books_preferred.db',
      version: 1,
      onCreate:(database, version){
         database.execute(
            'CREATE TABLE favourites (id TEXT PRIMARY KEY, title TEXT, category TEXT, thumbnail TEXT)').then((value) {
              print('table is created');
        }).catchError((error){
          print('Error when Creating table ${error.toString()}');
        });
      },
      onOpen: (database){
        getDataFromDatabase(database);
      },
    ).then((value){
      database = value;
      emit(CreateDatabaseState());
    });
  }
  void insertToDatabase(String id, String title, String category, String thumbnail)async{
    database!.transaction((txn)async{
      txn.rawInsert('INSERT INTO favourites(id, title, category, thumbnail) VALUES("$id", "$title","$category", "$thumbnail")').then((value) {
        print('$value inserted successfully');
        emit(InsertToDatabaseState());
        getDataFromDatabase(database);
      }).catchError((error){
        print('Error when inserting new raw: ${error.toString()}');
      });
    });
  }

  void updateData(
      {required String id,required String title, required String category, required String thumbnail})async{
    database!.rawUpdate(
        'UPDATE favourites SET id = ?, title = ? ,category = ? , thumbnail = ? WHERE id = ?',
        ['$id','$title','$category','$thumbnail']).then((value) {
          emit(UpdateDatabaseState());
    });
  }

  void getDataFromDatabase(database){
    database!.rawQuery('SELECT * FROM favourites').then((value){
      // favourites = value;
      print(favourites);
      favourites.forEach((element) {
        favourites.add(element);
        print(element['id']);
      });
      emit(GetDataFromDatabaseState());
    });
  }
  bool isFavourite = false;


  }
