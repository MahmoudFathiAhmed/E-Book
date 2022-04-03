import 'package:flutter/material.dart';

import '../../../shared/network/remote/items.dart';

class CategoriesExploreElement extends StatelessWidget {
  const CategoriesExploreElement({Key? key, required this.item}) : super(key: key);
  final Items item;
  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}
