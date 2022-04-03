
import 'package:e_book/shared/components/loading_widget.dart';
import 'package:e_book/view_models/cubits/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/network/remote/items.dart';
import '../../view_models/states/app_state.dart';
import 'category_screen.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
            Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: SingleChildScrollView(
              controller: ScrollController(),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<AppCubit,AppState>(
                  buildWhen: (previous,current){
                      for(int index = 0; index<=10; index++){
                        if(current is HomeCoversSuccessState) {
                          return true;
                        }else {
                          return false;
                        }
                      }
                      return false;
                    },
                    builder: (context,state){
                      var appCubit = AppCubit.get(context);
                      List<Items> coversList = appCubit.getHomeCoversList();
                      return state is HomeCoversSuccessState?
                      _buildCoverHomeElement(coversList):
                      const LoadingWidget();
                    },
                  ),
                  // state is !HomeCoversLoadingState? _buildCoverHomeElement(coversList) : const LoadingWidget(),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  BlocBuilder<AppCubit,AppState>(
                    buildWhen: (previous,current){
                      for(int index = 0; index<=10; index++){
                        if(current is HomeCategoriesSuccessState) {
                          return true;
                        }else {
                          return false;
                        }
                      }
                      return false;
                    },
                    builder: (context,state){
                      var appCubit = AppCubit.get(context);
                      List<Items> categoriesList = appCubit.getHomeCategoriesList();
                      return state is HomeCategoriesSuccessState?
                      _buildCategoriesHomeElement(categoriesList):
                      const LoadingWidget();
                    },
                  ),
                  // state is !HomeCategoriesLoadingState? _buildCategoriesHomeElement(categoriesList) : const LoadingWidget(),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Recently Added',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  BlocBuilder<AppCubit,AppState>(
                    buildWhen: (previous,current){
                      for(int index = 0; index<=10; index++){
                        if(current is HomeRecentSuccessState) {
                          return true;
                        }else {
                          return false;
                        }
                      }
                      return false;
                    },
                    builder: (context,state){
                      var appCubit = AppCubit.get(context);
                      List<Items> recentList = appCubit.getHomeRecentItems();
                      return state is HomeRecentSuccessState?
                      _buildRecentlyHomeElement(recentList):
                      const LoadingWidget();
                    },
                  ),
                  // state is !HomeRecentLoadingState? _buildRecentlyHomeElement(recentItems) : const LoadingWidget(),
                ],
              ),
            ),
          );
        // },
      // ),

    // );
  }
      // buildBlocWidget();

Widget _buildCoverHomeElement(coversList){
    return SizedBox(
      height: 170,
      width: 110,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 14.0,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            navigateTo(context, DetailsScreen(items: coversList[index]));
          }, // Handle your callback.
          child: Ink(
            height: 170,
            width: 110,
            decoration: BoxDecoration(
              border: defaultImageBorder(context),
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
              image: DecorationImage(
                image:
                // coversList.items![index].thumbnail == null
                //     ? const AssetImage('assets/images/imageError.png')
                //         as ImageProvider
                //     :
                NetworkImage(coversList[index].thumbnail!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        itemCount: coversList.length,
      ),
    );
}
Widget _buildCategoriesHomeElement(categoriesList){
  return SizedBox(
    height: 40,
    child: ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categoriesList.length,
      itemBuilder: (context, index) =>
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23.0)),
            onPressed: () {
              navigateTo(context,  CategoryScreen(category: categoriesList[index].category!));
            },
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              categoriesList[index].category!,
              style: const TextStyle(
                fontSize: 17.0,
                color: Colors.white,
              ),
            ),
          ),
      separatorBuilder: (context, index) =>
      const SizedBox(
        width: 12.0,
      ),
    ),
  );
}
Widget _buildRecentlyHomeElement(recentItems){
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => Row(
        children: [
          InkWell(
            onTap: (){
              navigateTo(context, DetailsScreen(items: recentItems[index]));
            },
            child: Ink(
              height: 130,
              width: 90,
              decoration: BoxDecoration(
                border: defaultImageBorder(context),
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                  // recentItems.items![index].thumbnail==null
                  //     ? const AssetImage('assets/images/imageError.png') as ImageProvider
                  //     :
                  NetworkImage(recentItems[index].thumbnail!),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  recentItems
                  [index].title!,
                  style: Theme.of(context).textTheme.subtitle1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 7.0,),
                Text(
                  recentItems[index].author!,
                  style: const TextStyle(fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color:Colors.deepOrangeAccent,
                  ),
                ),
                const SizedBox(height: 10.0,),
                Text(
                  recentItems[index].description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20.0,
      ),
      itemCount: recentItems.length,
    );
}
}
