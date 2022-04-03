import 'package:e_book/modules/screens/about_screen.dart';
import 'package:e_book/modules/screens/download_screen.dart';
import 'package:e_book/modules/screens/favourites_screen.dart';
import 'package:e_book/modules/screens/licence_screen.dart';
import 'package:e_book/shared/components/components.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
   const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'icon': Icons.favorite_border,
        'title': 'Favourites',
        'function':  ()=>navigateTo(context, const FavouritesScreen()),
      },
      {
        'icon': Icons.download_rounded,
        'title': 'Download',
        'function': ()=>navigateTo(context, const DownloadScreen()),
      },
      {
        'icon': Icons.info_outline,
        'title': 'About',
        'function': ()=>navigateTo(context, const AboutScreen()),
      },
      {
        'icon': Icons.request_page,
        'title': 'Licenses',
        'function': ()=>navigateTo(context, const LicenceScreen()),
      }
    ];
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder:
          (context,index)=>ListTile(
            iconColor: Theme.of(context).colorScheme.secondary,
            trailing: Icon(items[index]['icon']),
            onTap: items[index]['function'],
            title: Text('${items[index]['title']}'),
    )
      ,itemCount: items.length,
    );
      

  }
}