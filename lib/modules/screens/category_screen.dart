import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/components/loading_widget.dart';
import '../../shared/network/remote/items.dart';
import '../../view_models/cubits/app_cubit.dart';
import '../../view_models/states/app_state.dart';
import 'details_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key, required this.category}) : super(key: key);
  final String category;
  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
      create: (BuildContext context)=>AppCubit()..getCategoryScreenItems(category: category),
      child:
      BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous,current){
          for(int index = 0; index<=10; index++){
            if(current is CategoryItemsSuccessState) {
              return true;
            }else {
              return false;
            }
          }
          return false;
        },
        builder: (context, state){
          // AppCubit appCubit = AppCubit(itemsRepository);
          AppCubit appCubit = AppCubit.get(context);
          var categoryItem =appCubit.getCategoryScreenItems(category: category);
          return Scaffold(
            appBar: AppBar(
              title:  Text(category),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 20.0,left: 20.0),
              child: state is !CategoryItemsLoadingState ?
                ListView.separated(
                itemBuilder: (context, index) {
                  Items item = categoryItem[index];
                  return Row(
                    children: [
                      InkWell(
                        onTap: (){
                          navigateTo(context, DetailsScreen(items: item));
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
                              NetworkImage(item.thumbnail!),
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
                              item.title!,
                              style: Theme.of(context).textTheme.subtitle1,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 7.0,),
                            Text(
                              item.author!,
                              style: const TextStyle(fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color:Colors.deepOrangeAccent,
                              ),
                            ),
                            const SizedBox(height: 10.0,),
                            Text(
                              item.description!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index)=>const SizedBox(height: 20.0,),
                itemCount: 10,
              ) : const LoadingWidget(),
            ),
          );
        },
      ),

    );
  }
}
