import 'package:e_book/shared/network/remote/app_api.dart';
import 'package:e_book/shared/network/remote/items.dart';

class ItemsRepository{
  final AppApi appApi;
  ItemsRepository(this.appApi);
  Future <List<Items>>getItems(category)async{
    final items = await appApi.getItems(category: category);
    return  items.map((item)=>Items.fromJson(item)).toList();
}
}