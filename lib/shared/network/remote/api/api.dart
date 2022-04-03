// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:e_book/shared/network/remote/items.dart';
//
// import '../../../components/constants/api_consts.dart';
//
// class Api{
//   Dio dio = Dio();
//
//   Future <Items> getCategory(String url)async{
//     var response = await dio.get(url.toString()).catchError((error){
//       print(error.toString);
//       throw(error);
//     });
//     Items allItems;
//     if(response.statusCode == 200){
//       var json = jsonDecode(response.data);
//       allItems = Items.fromJson(json);
//     }else{
//       throw('Error ${response.statusCode}');
//     }
//     return allItems;
//   }
//
// }
//
