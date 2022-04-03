import 'package:flutter/material.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Downloads'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.55,
        ),
        itemBuilder: (BuildContext context ,index){
          return  Center(
            child: _buildCoversItem(context,),
          );
        },
        itemCount: 10,
      ),
    );
  }
  Widget _buildCoversItem(context) => Column(
    // crossAxisAlignment: CrossAxisAlignment.center,
    // mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        alignment: Alignment.topRight,
        children: [
          InkWell(
            onTap: () {}, // Handle your callback.
            child: Ink(
              height: 200,
              width: 125,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://edit.org/photos/img/blog/t9i-edit-book-covers-online.jpg-840.jpg'),
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
      const Text(
        'Book Address',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
