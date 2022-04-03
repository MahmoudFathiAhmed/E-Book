// // import 'package:e_book/shared/network/remote/repository/all_home_items_repository.dart';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../shared/network/remote/app_api.dart';
// import '../../shared/network/remote/api/items.dart';
//
// import '../states/home_state.dart';
//
// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit(this.appApi) : super(HomeInitialState());
//
//   // static HomeCubit get(context) => BlocProvider.of(context);
//
//   //API
//   // final AllHomeItemsRepository allItemsRepository;
// final AppApi appApi;
//   AllItems coversList=AllItems();
//   AllItems getHomeCoversList(){
//     try{
//       emit(HomeCoversLoadedState());
//     appApi.getHomeItems(category: 'public').then((items){
//       coversList = items;
//     });
//     emit(HomeCoversSuccessState());
//     return coversList;
//     }catch(error){
//       print(error.toString());
//       emit(HomeCoversErrorState(error.toString()));
//       return AllItems();
//     }
//   }
//
//    AllItems categoriesList=AllItems();
//   AllItems getHomeCategoriesList(){
//     try{
//       emit(HomeCategoriesLoadedState());
//     appApi.getHomeItems(category: 'public').then((items){
//       categoriesList = items;
//     });
//     emit(HomeCategoriesSuccessState());
//     return categoriesList;
//     }catch(error){
//       print(error.toString());
//       emit(HomeCategoriesErrorState(error.toString()));
//       return AllItems();
//     }
//   }
//
//  AllItems itemsForRecent= AllItems();
//   AllItems getHomeRecentItems(){
//     try{
//       emit(HomeRecentLoadedState());
//     appApi.getHomeItems(category: 'recent').then((items){
//       itemsForRecent = items;
//     emit(HomeRecentSuccessState());
//     });
//     return itemsForRecent;
//     }catch(error){
//       print(error.toString());
//       emit(HomeRecentErrorState(error.toString()));
//       return AllItems();
//     }
//   }
// }
//   // CategoriesModel recent = CategoriesModel();
//   // CategoriesModel public = CategoriesModel();
//   // CategoriesModel author = CategoriesModel();
//   // CategoriesModel differentCategories = CategoriesModel();
//   // APIRequestStatus apiRequestStatus = APIRequestStatus.loading;
//   // Api api = Api();
//   //
//   // //functions
//   // setApiRequestStatus(APIRequestStatus value) {
//   //   apiRequestStatus = value;
//   // }
//   //
//   // void setRecent(value) {
//   //   recent = value;
//   //   emit(SetRecentState());
//   // }
//   //
//   // void setPublic(value) {
//   //   public = value;
//   //   emit(SetPublicState());
//   // }
//   // void setAuthor(value) {
//   //   public = value;
//   //   emit(SetAuthorState());
//   // }
//   // void setDifferentCategories(value) {
//   //   public = value;
//   //   emit(SetDifferentCategoriesState());
//   // }
//   //
//   // CategoriesModel getRecent() {
//   //   return recent;
//   // }
//   // CategoriesModel getPublic() {
//   //   return public;
//   // }
//   // CategoriesModel getAuthor() {
//   //   return author;
//   // }
//   // CategoriesModel getDifferentCategories() {
//   //   return differentCategories;
//   // }
//   //
//   // getItems() async {
//   //   setApiRequestStatus(APIRequestStatus.loading);
//   //   try {
//   //
//   //     CategoriesModel public = await api.getCategory(publicAuthor);
//   //     setPublic(public);
//   //
//   //     CategoriesModel recent = await api.getCategory(recentlyAdded);
//   //     setRecent(recent);
//   //     CategoriesModel author = await api.getCategory(publicAuthor);
//   //     setAuthor(author);
//   //     for(int index =0; index<10;index++) {
//   //       CategoriesModel differentCategories = await api.getCategory(
//   //           diffCat[index]);
//   //       setDifferentCategories(differentCategories);
//   //     }
//   //   } catch (error) {
//   //     print(error);
//   //   }
//   // }
