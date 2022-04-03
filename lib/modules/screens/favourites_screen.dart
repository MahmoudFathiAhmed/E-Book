import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/cubits/app_cubit.dart';
import '../../view_models/states/app_state.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);
// bool isFavourite= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state){
          var appCubit=AppCubit.get(context);
          var fav = appCubit.favourites;
          print(fav.first['id']);
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.55,
            ),
            itemBuilder: (BuildContext context ,index){
              return  Center(
                child: _buildCoversItem(context,title: fav[index]['title'], category: fav[index]['category'], id: fav[index]['id'],thumbnail:  fav[index]['thumbnail']),
              );
            },
            itemCount: fav.length,
          );
        }
      ),
    );
  }
Widget _buildCoversItem(context,{required String title, required String category,required String id, required String thumbnail}) => Column(

      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            InkWell(
            onTap: () {}, // Handle your callback.
            child: Ink(
              height: 200,
              width: 125,
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
            IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.favorite,color: Theme.of(context).colorScheme.secondary,
              )
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
         Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
}

