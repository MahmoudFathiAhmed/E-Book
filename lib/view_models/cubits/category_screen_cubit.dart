// import 'package:e_book/shared/network/remote/app_api.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../shared/network/remote/api/items.dart';
// import '../states/category_screen_state.dart';
//
// class CategoryCubit extends Cubit<CategoryState> {
//   CategoryCubit(this.appApi) : super(CategoryInitialState());
//
//   static CategoryCubit get(context) => BlocProvider.of(context);
//   // final CategoryScreenItemsRepository categoryScreenItemsRepository;
// final AppApi appApi;
//   late AllItems elementsForCategories;
//
//   AllItems getCategoryScreenItems({required String category}) {
//     try {
//       emit(CategoryItemsLoadedState());
//       appApi.getCategoryScreenItems(category: category).then((elements) {
//         elementsForCategories = elements;
//       });
//       emit(CategoryItemsSuccessState());
//       return elementsForCategories;
//     } catch (error) {
//       print(error.toString());
//       emit(CategoryItemsErrorState(error.toString()));
//       return AllItems();
//     }
//   }
//
// }