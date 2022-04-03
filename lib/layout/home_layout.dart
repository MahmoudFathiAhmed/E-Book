import 'package:e_book/shared/components/components.dart';
import 'package:e_book/view_models/cubits/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_models/states/app_state.dart';

class HomeLayout extends StatelessWidget {

    const HomeLayout(this.isDark,{Key? key}) : super(key: key);
   final bool isDark;
   // final AppRouter appRouter;

  // var cubit = EBookCubit.get(context);

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context) => AppCubit()..changeAppMode(fromShared: isDark),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context,state) {
          AppCubit appCubit = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-book',
            theme: lightTheme().copyWith(
                colorScheme: darkTheme().colorScheme.copyWith(secondary: Colors.deepOrangeAccent,),),
            darkTheme: darkTheme().copyWith(
                colorScheme: darkTheme().colorScheme.copyWith(secondary: Colors.deepOrangeAccent),),
            themeMode: appCubit.isDark ? ThemeMode.dark:ThemeMode.light,
            home: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: (){
                        appCubit.changeAppMode();
                      },
                      icon: const Icon(Icons.brightness_4_outlined)),
                ],
                title: Text(appCubit.titles[appCubit.currentIndex],
                ),
              ),
              body: appCubit.screens[appCubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: appCubit.currentIndex,
                onTap: (index) {
                  appCubit.changeIndex(index);
                },
                items: appCubit.bottomItems,
              ),
            ),
          );
        },
      ),
    );
  }
}