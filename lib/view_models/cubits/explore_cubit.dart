// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../shared/network/remote/app_api.dart';
// import '../../shared/network/remote/api/items.dart';
//
// import '../states/explore_state.dart';
//
// class ExploreCubit extends Cubit<ExploreState> {
//   ExploreCubit(this.appApi) : super(ExploreInitialState());
//
//   static ExploreCubit get(context) => BlocProvider.of(context);
//   final AppApi appApi;
//
//   // late AllItems elementsForCategories;
//   // AllItems getExploreCategoriesItems({required String category}) {
//   //   try {
//   //       emit(ExploreCategoriesLoadedState());
//   //     exploreApi.getExploreCategoriesItems(category: category).then((elements) {
//   //       elementsForCategories = elements;
//   //     });
//   //     emit(ExploreCategoriesSuccessState());
//   //     return elementsForCategories;
//   //   } catch (error) {
//   //     print(error.toString());
//   //     emit(ExploreCategoriesErrorState(error.toString()));
//   //     return AllItems();
//   //   }
//   // }
//
//   AllItems?  elementsForCovers ;
//   AllItems? getExploreCoversItems({required String category}) {
//     try {
//       appApi.getExploreCoversItems(category: category).then((elements) {
//         emit(ExploreCoversLoadedState());
//         elementsForCovers = elements;
//       });
//       emit(ExploreCoversSuccessState());
//       return elementsForCovers;
//     } catch (error) {
//       print(error.toString());
//       emit(ExploreCoversErrorState(error.toString()));
//       return AllItems();
//     }
//   }
//
//
// }
//   //
//   // //API
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
//   //     CategoriesModel public = await api.getCategory(publicAuthor);
//   //     setPublic(public);
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
