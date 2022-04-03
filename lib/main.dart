import 'package:bloc/bloc.dart';
import 'package:e_book/layout/home_layout.dart';
import 'package:e_book/shared/cubit/bloc_observer.dart';
import 'package:e_book/shared/network/local/cache_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';




void main() async{
  FlutterServicesBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);
  await CacheHelper.init();
  BlocOverrides.runZoned(
        (){
          runApp(const MyApp());
        },
    blocObserver: MyBlocObserver(),
  );
}
void initialization(BuildContext context) async {
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isDark = CacheHelper.getBoolean(key: 'isDark');
    // return  const HomeLayout(true);
    return  HomeLayout(isDark!);
  }
}



