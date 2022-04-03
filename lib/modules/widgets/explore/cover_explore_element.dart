import 'package:e_book/modules/screens/details_screen.dart';
import 'package:e_book/shared/network/remote/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/loading_widget.dart';
import '../../../view_models/cubits/app_cubit.dart';
import '../../../view_models/states/app_state.dart';

class CoverExploreElement extends StatelessWidget {
  const CoverExploreElement(
      {Key? key,
      // required this.categories,

      required this.indexOfItems})
      : super(key: key);
  // final List<String> categories;


  final int indexOfItems;
  @override
  Widget build(BuildContext context) {
    // ItemsRepository itemsRepository = ItemsRepository(AppApi());

    List<String> categories = [
      'classics',
      'comics',
      'ebook',
      'fiction',
      'humor',
      'mystery',
      'philosophy',
      'poetry',
      'psychology',
      'technology'
    ];
    print('index=$indexOfItems');
    return
      BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child:
      BlocBuilder<AppCubit, AppState>(
          buildWhen: (previous,current){
            for(int index = 0; index<=100; index++){
              if(current is ExploreCoversSuccessState) {
                return true;
              }else {
                return false;
              }
            }
            return false;
          },
          builder: (context ,state){
            var appCubit = AppCubit.get(context);
            List<Items> items = appCubit.getExploreCoversItems(category: categories[indexOfItems]);
            return
              state is ExploreCoversSuccessState ?
                _buildCoversLists(context, items)
                :const LoadingWidget();
        }
        ),
    );
  }

  Widget _buildCoversLists(BuildContext context, items,){
    return SizedBox(
          height: 180,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            primary: false,
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8.0),
            itemBuilder:(context, index){
              // Items item = appCubit.getExploreCoversItems(category: category)[index];
              var item =items[index];
              return InkWell(
                onTap: () {
                  navigateTo(context, DetailsScreen(items: item));
                }, // Handle your callback.
                child: Ink(
                  height: 180,
                  width: 125,
                  decoration: BoxDecoration(
                    border: defaultImageBorder(context),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(15.0)),
                    image: DecorationImage(
                      image:
                      // item.thumbnail!.isEmpty
                      //     ? const AssetImage('assets/images/imageError.png')
                      //         as ImageProvider
                      //     :
                      NetworkImage(item.thumbnail!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }
          ),
        );


  }
}

