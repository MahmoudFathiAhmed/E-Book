import 'package:dio/dio.dart';
import 'package:e_book/shared/components/constants/api_consts.dart';

class AppApi {
  Dio dio = Dio();
  // static init(){
  //   dio = Dio(
  //     BaseOptions(
  //       baseUrl: baseUrl,
  //       receiveDataWhenStatusError: true,
  //     ),
  //   );
  // }
  AppApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      // 20 seconds
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getItems({required category}) async {
    try{
    Response response = await dio.get('$category.json');
    // print(response.data.runtimeType);
    return response.data;
    }catch(error){
      print(error.toString());
      return [];
    }
  }

  // Future<AllItems> getExploreCategoriesItems({required category}) async {
  //   Response response = await dio.get(
  //     'ebookapi/$category.json',).catchError((error){
  //     print(error.toString);
  //     throw(error);
  //   });
  //   AllItems allItems;
  //   if(response.statusCode == 200){
  //     var json = response.data;
  //     allItems = AllItems.fromJson(json);
  //   }else{
  //     throw ('Error ${response.statusCode}');
  //   }
  //   return allItems;
  //   // print(elements.items![1].volumeInfo!.title);
  //   // try {
  //   //   Response response = await dio.get(
  //   //       'books/v1/volumes', queryParameters: queryParameters);
  //   //   print(response.statusCode);
  //   //   var jsonData = response.data['items'];
  //   //   print(jsonData);
  //   //   return jsonData;
  //   // } catch (error) {
  //   //   print(error.toString());
  //   //   return [];
  //   // }
  // }
  //
  // Future<AllItems> getExploreCoversItems({required String category}) async {
  //   // try {
  //   Response response = await dio.get(
  //     'ebookapi/$category.json', ).catchError((error){
  //     print(error.toString);
  //     throw(error);
  //   });
  //   AllItems allItems;
  //   if(response.statusCode == 200){
  //     var json = response.data;
  //     allItems = AllItems.fromJson(json);
  //   }else{
  //     throw ('Error ${response.statusCode}');
  //   }
  //   return allItems;
  //   // print(elements.items![1].volumeInfo!.title);
  //   //   print(response.statusCode);
  //   //   var jsonData = response.data;
  //   //   print(jsonData);
  //   //   return jsonDecode(jsonData);
  //   // } catch (error) {
  //   //   print(error.toString());
  //   //   return AllElements();
  //   // }
  // }
  //
  // Future<AllItems> getCategoryScreenItems({required category}) async {
  //   Response response = await dio.get(
  //     'ebookapi/$category.json',).catchError((error){
  //     print(error.toString);
  //     throw(error);
  //   });
  //   AllItems allItems;
  //   if(response.statusCode == 200){
  //     var json = response.data;
  //     allItems = AllItems.fromJson(json);
  //   }else{
  //     throw ('Error ${response.statusCode}');
  //   }
  //   return allItems;
  //   // print(elements.items![1].volumeInfo!.title);
  //   // try {
  //   //   Response response = await dio.get(
  //   //       'books/v1/volumes', queryParameters: queryParameters);
  //   //   print(response.statusCode);
  //   //   var jsonData = response.data['items'];
  //   //   print(jsonData);
  //   //   return jsonData;
  //   // } catch (error) {
  //   //   print(error.toString());
  //   //   return [];
  //   // }
  // }
}