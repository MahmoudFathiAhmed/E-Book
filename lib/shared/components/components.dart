import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../network/remote/items.dart';
//HOME SCREEN COMPONENTS
Widget buildCoversItemHomeScreen(cover,context) => InkWell(
  onTap: () {}, // Handle your callback.
  child: Ink(
    height: 170,
    width: 110,
    decoration:  BoxDecoration(
      border: defaultImageBorder(context),
      borderRadius: const BorderRadius.all(Radius.circular(15.0),),
      image: DecorationImage(
        image: NetworkImage('${cover['volumeInfo']['imageLinks']['thumbnail']}'),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

Widget buildCategoriesItem(categories,context) => MaterialButton(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23.0)),
  onPressed: (){},
  color: Theme.of(context).colorScheme.secondary,
  child:  Text(
    '${categories['volumeInfo']['categories'][0]}',
    style: const TextStyle(
      fontSize: 17.0,
      color: Colors.white,
    ),
  ),
);

Widget buildRecentlyAddedItem(newest,context) => Row(
  children: [
    InkWell(
      child: Ink(
        height: 130,
        width: 90,
        decoration: BoxDecoration(
          border: defaultImageBorder(context),
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              '${newest['volumeInfo']['imageLinks']['thumbnail']}',
            ),
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
            '${newest['volumeInfo']['title']}',
            style: Theme.of(context).textTheme.subtitle1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 7.0,),
          Text(
            '${newest['volumeInfo']['authors'][0]}',
            style: const TextStyle(fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color:Colors.deepOrangeAccent,
            ),
          ),
          const SizedBox(height: 10.0,),
          Text(
            '${newest['volumeInfo']['description']}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    ),
  ],
);

//EXPLORE SCREEN COMPONENTS
Widget buildCategoryExploreItem(Items item,context) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(item.category!,
            style: Theme.of(context).textTheme.headline5,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextButton(
          onPressed: (){},
          child: Text(
            'See All',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 17.0,
            ),
          ),
        ),
      ],
    ),

  ],
);

//general
  TextStyle defaultTextStyle(){
    return const TextStyle(
      fontSize: 22.0,
      color: Colors.white70,
      fontWeight: FontWeight.w500,
    );
  }

  BoxBorder defaultImageBorder(context){
    return Border.all(
      color: Theme.of(context).colorScheme.secondary,
      width: 2.0,
      style: BorderStyle.solid,
    );
  }

  //navigate to
void navigateTo(BuildContext context, widget)=>Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context)=>widget,
    ));

//check connection error
bool checkConnectionError(e) {
  if (e.toString().contains('SocketException') ||
      e.toString().contains('HandshakeException')) {
    return true;
  } else {
    return false;
  }
}

//Theme Settings
/*
* 1:-
* Color(0xFEC610),
* Color(0x000F20),
* ***************************8
*
* */
  ThemeData lightTheme(){
    return ThemeData(
      // accentColor: Color(0xff2ca8e2),
      // primarySwatch: Colors.lightBlue,
      //general
      primaryColor: Colors.orangeAccent,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor:  Colors.white,
      brightness: Brightness.light,
      //components
      textTheme: const TextTheme(
        headline5: TextStyle(
          fontSize: 22.0,
          color: Colors.black87,
          fontWeight: FontWeight.w800
        ),
        subtitle1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color:Colors.black54,
        ),
        bodyText2: TextStyle(
          fontSize: 13.0,
          color:Colors.black,
        ),),
      appBarTheme: const AppBarTheme(
        // titleSpacing: ,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.deepOrangeAccent,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white24,
          statusBarIconBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.black54,
        elevation: 20.0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }

  ThemeData darkTheme(){
    return ThemeData(
      // accentColor: Color(0xff2ca8e2),
      // primarySwatch: Colors.deepOrange,
      //general
      primaryColor: Colors.orange,
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      //components
      textTheme: const TextTheme(
        headline5: TextStyle(
          fontSize: 22.0,
          color: Colors.white,
          // fontWeight: FontWeight.w800
        ),
        subtitle1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color:Colors.grey,
        ),
        bodyText2: TextStyle(
          fontSize: 13.0,
          color:Colors.white70,
        ),
      ),
      appBarTheme: const AppBarTheme(
        // titleSpacing: ,
        backgroundColor: Colors.black12,
        elevation: 0.0,
        centerTitle: true,

        iconTheme: IconThemeData(
          color: Colors.deepOrangeAccent,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black12,
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.grey,
        elevation: 20.0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }


