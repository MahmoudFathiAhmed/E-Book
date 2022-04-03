import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_book/modules/screens/category_screen.dart';
import 'package:e_book/modules/screens/pdf_viewer_screen.dart';
import 'package:e_book/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../shared/network/remote/items.dart';
import '../../view_models/cubits/app_cubit.dart';
import '../../view_models/states/app_state.dart';


class DetailsScreen extends StatelessWidget {
  final Items items;
   const DetailsScreen(
      {Key? key,
      required this.items,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..createDatabase(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state){
          var appCubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    appCubit.isFavourite=!appCubit.isFavourite;
                    appCubit.updateData(title: items.title!, category: items.category!, thumbnail: items.thumbnail!, id: items.id!);
                    print(appCubit.favourites.first['thumbnail']);
                  },
                  icon: Icon(appCubit.isFavourite == false ?  Icons.favorite_border: Icons.favorite),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                IconButton(
                    onPressed: () async{
                      await Share.share(items.previewLink!);
                    },
                    icon:  Icon(Icons.share,color: Theme.of(context).colorScheme.secondary,)),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image(
                          height: 200,
                          width: 135,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              items.thumbnail!
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items.title!,
                                style:  Theme.of(context).textTheme.headline5,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                items.author!,
                                style: Theme.of(context).textTheme.subtitle1,

                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  MaterialButton(
                                    minWidth: 105.0,
                                    height: 30.0,
                                    onPressed: () {
                                      navigateTo(context, CategoryScreen(category: items.category!));
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side:  BorderSide(
                                          width: 1.7,
                                          style: BorderStyle.solid,
                                          color: Theme.of(context).colorScheme.secondary),
                                    ),
                                    textColor: Theme.of(context).colorScheme.secondary,
                                    child: Text(
                                      items.category!,
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      navigateTo(context,
                                          PdfViewerScreen(url: "http://www.africau.edu/images/default/sample.pdf",
                                            title: items.title!,));
                                    },
                                    child:  Text(
                                      'Read',
                                      style: Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                  const SizedBox(width: 5.0,),
                                  TextButton(
                                    onPressed: () => openFile(
                                      url: "http://www.africau.edu/images/default/sample.pdf",
                                      fileName: 'sample.pdf',
                                    ),
                                    child:  Text(
                                      'Download',
                                      style: Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Book Description',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const Divider(
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                        items.description!,
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child:  Text(
                          'See All',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
Future openFile({required String url,required String fileName})async{
    final file = await downloadFile(url, fileName);
    if(file == null)return;
      print('Path: ${file.path}');
      OpenFile.open(file.path);

}
Future<File?>downloadFile(String url, String name)async{
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
      final response = await Dio().get(
          url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
          )
      );
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;

}

}

