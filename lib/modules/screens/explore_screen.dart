import 'package:e_book/modules/widgets/explore/cover_explore_element.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import 'category_screen.dart';


class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ExploreCubit cubit = ExploreCubit.get(context);
    List<String> categories = [
      'classics',
      'comics',
      'ebook',
      'fiction',
      'humor',
      'mystery',
      'philosophy',
      'poetry',
      'psychology',
      'technology'
    ];
    return Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            primary: false,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                primary: false,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCategoryHeader(context, category: categories[index]),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CoverExploreElement(indexOfItems: index),
                    ],
                  );
                },
                separatorBuilder: (context, index) =>const SizedBox(height: 10.0,),
                itemCount: categories.length
            ),
          ),
        );
  }
  Widget _buildCategoryHeader(BuildContext context, {required String category}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            category,
            style: Theme.of(context).textTheme.headline5,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextButton(
          onPressed: () {
            navigateTo(context, CategoryScreen(category: category));
          },
          child: Text(
            'See All',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 17.0,
            ),
          ),
        ),
      ],
    );
  }
  // Widget _buildClassicsPackage(BuildContext context){
  //   AllItems? allItems = exploreCubit.getExploreCoversItems(category: 'classics');
  //   return Column(
  //     children: [
  //       _buildCategoryHeader(context,category: 'Classics'),
  //       const SizedBox(height: 10.0,),
  //       SizedBox(
  //         height: 180,
  //         child: ListView.separated(
  //           physics: const BouncingScrollPhysics(),
  //           primary: false,
  //           scrollDirection: Axis.horizontal,
  //           itemCount: 10,
  //           separatorBuilder: (context, index) => const SizedBox(width: 8.0),
  //           itemBuilder:(context, index)=> InkWell(
  //             onTap: () {
  //               navigateTo(context, DetailsScreen(items: allItems!.items![index]));
  //             }, // Handle your callback.
  //             child: Ink(
  //               height: 180,
  //               width: 125,
  //               decoration: BoxDecoration(
  //                 border: defaultImageBorder(context),
  //                 borderRadius:
  //                 const BorderRadius.all(Radius.circular(15.0)),
  //                 image: DecorationImage(
  //                   image:
  //                   // allElements
  //                   //             .items![index].volumeInfo!.imageLinks ==
  //                   //         null
  //                   //     ? const AssetImage('assets/images/imageError.png')
  //                   //         as ImageProvider
  //                   //     :
  //                   NetworkImage(allItems!.items![index].thumbnail!),
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  // Widget _buildComicsPackage(BuildContext context){
  //   AllItems? allItems = exploreCubit.getExploreCoversItems(category: 'comics');
  //   return Column(
  //     children: [
  //       _buildCategoryHeader(context,category: 'Comics'),
  //       const SizedBox(height: 10.0,),
  //       SizedBox(
  //         height: 180,
  //         child: ListView.separated(
  //           physics: const BouncingScrollPhysics(),
  //           primary: false,
  //           scrollDirection: Axis.horizontal,
  //           itemCount: 10,
  //           separatorBuilder: (context, index) => const SizedBox(width: 8.0),
  //           itemBuilder: (context, index)=>InkWell(
  //             onTap: () {
  //               navigateTo(context, DetailsScreen(items: allItems!.items![index]));
  //             }, // Handle your callback.
  //             child: Ink(
  //               height: 180,
  //               width: 125,
  //               decoration: BoxDecoration(
  //                 border: defaultImageBorder(context),
  //                 borderRadius:
  //                 const BorderRadius.all(Radius.circular(15.0)),
  //                 image: DecorationImage(
  //                   image:
  //                   // allElements
  //                   //             .items![index].volumeInfo!.imageLinks ==
  //                   //         null
  //                   //     ? const AssetImage('assets/images/imageError.png')
  //                   //         as ImageProvider
  //                   //     :
  //                   NetworkImage(allItems!.items![index].thumbnail!),
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  // Widget _buildEbookPackage(BuildContext context){
  //   AllItems? allItems = exploreCubit.getExploreCoversItems(category: 'ebook');
  //   return Column(
  //     children: [
  //       _buildCategoryHeader(context,category: 'E-Book'),
  //       const SizedBox(height: 10.0,),
  //       SizedBox(
  //         height: 180,
  //         child: ListView.separated(
  //           physics: const BouncingScrollPhysics(),
  //           primary: false,
  //           scrollDirection: Axis.horizontal,
  //           itemCount: 10,
  //           separatorBuilder: (context, index) => const SizedBox(width: 8.0),
  //           itemBuilder:(context, index) =>InkWell(
  //             onTap: () {
  //               navigateTo(context, DetailsScreen(items: allItems!.items![index]));
  //             }, // Handle your callback.
  //             child: Ink(
  //               height: 180,
  //               width: 125,
  //               decoration: BoxDecoration(
  //                 border: defaultImageBorder(context),
  //                 borderRadius:
  //                 const BorderRadius.all(Radius.circular(15.0)),
  //                 image: DecorationImage(
  //                   image:
  //                   // allElements
  //                   //             .items![index].volumeInfo!.imageLinks ==
  //                   //         null
  //                   //     ? const AssetImage('assets/images/imageError.png')
  //                   //         as ImageProvider
  //                   //     :
  //                   NetworkImage(allItems!.items![index].thumbnail!),
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  // Widget _buildFictionPackage(BuildContext context){
  //   AllItems? allItems = exploreCubit.getExploreCoversItems(category: 'fiction');
  //   return Column(
  //     children: [
  //       _buildCategoryHeader(context,category: 'Fiction'),
  //       const SizedBox(height: 10.0,),
  //       SizedBox(
  //         height: 180,
  //         child: ListView.separated(
  //           physics: const BouncingScrollPhysics(),
  //           primary: false,
  //           scrollDirection: Axis.horizontal,
  //           itemCount: 10,
  //           separatorBuilder: (context, index) => const SizedBox(width: 8.0),
  //           itemBuilder: (context, index) => SizedBox(
  //             child: InkWell(
  //               onTap: () {
  //                 navigateTo(context, DetailsScreen(items: allItems!.items![index]));
  //               }, // Handle your callback.
  //               child: Ink(
  //                 height: 180,
  //                 width: 125,
  //                 decoration: BoxDecoration(
  //                   border: defaultImageBorder(context),
  //                   borderRadius:
  //                   const BorderRadius.all(Radius.circular(15.0)),
  //                   image: DecorationImage(
  //                     image:
  //                     // allElements
  //                     //             .items![index].volumeInfo!.imageLinks ==
  //                     //         null
  //                     //     ? const AssetImage('assets/images/imageError.png')
  //                     //         as ImageProvider
  //                     //     :
  //                     NetworkImage(allItems!.items![index].thumbnail!),
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  // Widget _buildHumorPackage(BuildContext context){
  //   AllItems? allItems = exploreCubit.getExploreCoversItems(category: 'humor');
  //   return Column(
  //     children: [
  //       _buildCategoryHeader(context,category: 'Humor'),
  //       const SizedBox(height: 10.0,),
  //       SizedBox(
  //         height: 180,
  //         child: ListView.separated(
  //           physics: const BouncingScrollPhysics(),
  //           primary: false,
  //           scrollDirection: Axis.horizontal,
  //           itemCount: 10,
  //           separatorBuilder: (context, index) => const SizedBox(width: 8.0),
  //           itemBuilder: (context, index) => SizedBox(
  //             child: InkWell(
  //               onTap: () {
  //                 navigateTo(context, DetailsScreen(items: allItems!.items![index]));
  //               }, // Handle your callback.
  //               child: Ink(
  //                 height: 180,
  //                 width: 125,
  //                 decoration: BoxDecoration(
  //                   border: defaultImageBorder(context),
  //                   borderRadius:
  //                   const BorderRadius.all(Radius.circular(15.0)),
  //                   image: DecorationImage(
  //                     image:
  //                     // allElements
  //                     //             .items![index].volumeInfo!.imageLinks ==
  //                     //         null
  //                     //     ? const AssetImage('assets/images/imageError.png')
  //                     //         as ImageProvider
  //                     //     :
  //                     NetworkImage(allItems!.items![index].thumbnail!),
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  // Widget _buildMysteryPackage(BuildContext context){
  //   AllItems? allItems = exploreCubit.getExploreCoversItems(category: 'mystery');
  //   return Column(
  //     children: [
  //       _buildCategoryHeader(context,category: 'Mystery'),
  //       const SizedBox(height: 10.0,),
  //       SizedBox(
  //         height: 180,
  //         child: ListView.separated(
  //           physics: const BouncingScrollPhysics(),
  //           primary: false,
  //           scrollDirection: Axis.horizontal,
  //           itemCount: 10,
  //           separatorBuilder: (context, index) => const SizedBox(width: 8.0),
  //           itemBuilder: (context, index) => SizedBox(
  //             child: InkWell(
  //               onTap: () {
  //                 navigateTo(context, DetailsScreen(items: allItems!.items![index]));
  //               }, // Handle your callback.
  //               child: Ink(
  //                 height: 180,
  //                 width: 125,
  //                 decoration: BoxDecoration(
  //                   border: defaultImageBorder(context),
  //                   borderRadius:
  //                   const BorderRadius.all(Radius.circular(15.0)),
  //                   image: DecorationImage(
  //                     image:
  //                     // allElements
  //                     //             .items![index].volumeInfo!.imageLinks ==
  //                     //         null
  //                     //     ? const AssetImage('assets/images/imageError.png')
  //                     //         as ImageProvider
  //                     //     :
  //                     NetworkImage(allItems!.items![index].thumbnail!),
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  // Widget _buildPhilosophyPackage(BuildContext context){
  //   AllItems? allItems = exploreCubit.getExploreCoversItems(category: 'philosophy');
  //   return Column(
  //     children: [
  //       _buildCategoryHeader(context,category: 'Philosophy'),
  //       const SizedBox(height: 10.0,),
  //       SizedBox(
  //         height: 180,
  //         child: ListView.separated(
  //           physics: const BouncingScrollPhysics(),
  //           primary: false,
  //           scrollDirection: Axis.horizontal,
  //           itemCount: 10,
  //           separatorBuilder: (context, index) => const SizedBox(width: 8.0),
  //           itemBuilder: (context, index) => SizedBox(
  //             child: InkWell(
  //               onTap: () {
  //                 navigateTo(context, DetailsScreen(items: allItems!.items![index]));
  //               }, // Handle your callback.
  //               child: Ink(
  //                 height: 180,
  //                 width: 125,
  //                 decoration: BoxDecoration(
  //                   border: defaultImageBorder(context),
  //                   borderRadius:
  //                   const BorderRadius.all(Radius.circular(15.0)),
  //                   image: DecorationImage(
  //                     image:
  //                     // allElements
  //                     //             .items![index].volumeInfo!.imageLinks ==
  //                     //         null
  //                     //     ? const AssetImage('assets/images/imageError.png')
  //                     //         as ImageProvider
  //                     //     :
  //                     NetworkImage(allItems!.items![index].thumbnail!),
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  // Widget _buildPoetryPackage(BuildContext context){
  //   AllItems? allItems = exploreCubit.getExploreCoversItems(category: 'poetry');
  //   return Column(
  //     children: [
  //       _buildCategoryHeader(context,category: 'Poetry'),
  //       const SizedBox(height: 10.0,),
  //       SizedBox(
  //         height: 180,
  //         child: ListView.separated(
  //           physics: const BouncingScrollPhysics(),
  //           primary: false,
  //           scrollDirection: Axis.horizontal,
  //           itemCount: 10,
  //           separatorBuilder: (context, index) => const SizedBox(width: 8.0),
  //           itemBuilder: (context, index) => SizedBox(
  //             child: InkWell(
  //               onTap: () {
  //                 navigateTo(context, DetailsScreen(items: allItems!.items![index]));
  //               }, // Handle your callback.
  //               child: Ink(
  //                 height: 180,
  //                 width: 125,
  //                 decoration: BoxDecoration(
  //                   border: defaultImageBorder(context),
  //                   borderRadius:
  //                   const BorderRadius.all(Radius.circular(15.0)),
  //                   image: DecorationImage(
  //                     image:
  //                     // allElements
  //                     //             .items![index].volumeInfo!.imageLinks ==
  //                     //         null
  //                     //     ? const AssetImage('assets/images/imageError.png')
  //                     //         as ImageProvider
  //                     //     :
  //                     NetworkImage(allItems!.items![index].thumbnail!),
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  // Widget _buildPsychologyPackage(BuildContext context){
  //   AllItems? allItems = exploreCubit.getExploreCoversItems(category: 'psychology');
  //   return Column(
  //     children: [
  //       _buildCategoryHeader(context,category: 'Psychology'),
  //       const SizedBox(height: 10.0,),
  //       SizedBox(
  //         height: 180,
  //         child: ListView.separated(
  //           physics: const BouncingScrollPhysics(),
  //           primary: false,
  //           scrollDirection: Axis.horizontal,
  //           itemCount: 10,
  //           separatorBuilder: (context, index) => const SizedBox(width: 8.0),
  //           itemBuilder: (context, index) => SizedBox(
  //             child: InkWell(
  //               onTap: () {
  //                 navigateTo(context, DetailsScreen(items: allItems!.items![index]));
  //               }, // Handle your callback.
  //               child: Ink(
  //                 height: 180,
  //                 width: 125,
  //                 decoration: BoxDecoration(
  //                   border: defaultImageBorder(context),
  //                   borderRadius:
  //                   const BorderRadius.all(Radius.circular(15.0)),
  //                   image: DecorationImage(
  //                     image:
  //                     // allElements
  //                     //             .items![index].volumeInfo!.imageLinks ==
  //                     //         null
  //                     //     ? const AssetImage('assets/images/imageError.png')
  //                     //         as ImageProvider
  //                     //     :
  //                     NetworkImage(allItems!.items![index].thumbnail!),
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  // Widget _buildTechnologyPackage(BuildContext context){
  //   AllItems? allItems = exploreCubit.getExploreCoversItems(category: 'technology');
  //   return Column(
  //     children: [
  //       _buildCategoryHeader(context,category: 'Technology'),
  //       const SizedBox(height: 10.0,),
  //       SizedBox(
  //         height: 180,
  //         child: ListView.separated(
  //           physics: const BouncingScrollPhysics(),
  //           primary: false,
  //           scrollDirection: Axis.horizontal,
  //           itemCount: 10,
  //           separatorBuilder: (context, index) => const SizedBox(width: 8.0),
  //           itemBuilder: (context ,index)=>InkWell(
  //             onTap: () {
  //               navigateTo(context, DetailsScreen(items: allItems!.items![index]));
  //             }, // Handle your callback.
  //             child: Ink(
  //               height: 180,
  //               width: 125,
  //               decoration: BoxDecoration(
  //                 border: defaultImageBorder(context),
  //                 borderRadius:
  //                 const BorderRadius.all(Radius.circular(15.0)),
  //                 image: DecorationImage(
  //                   image:
  //                   // allElements
  //                   //             .items![index].volumeInfo!.imageLinks ==
  //                   //         null
  //                   //     ? const AssetImage('assets/images/imageError.png')
  //                   //         as ImageProvider
  //                   //     :
  //                   NetworkImage(allItems!.items![index].thumbnail!),
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}

// Column(
// children: [
// state is !ExploreCategoriesLoadedState ?_buildClassicsPackage(context):const LoadingWidget(),
// const SizedBox(height: 10.0,),
// state is !ExploreCategoriesLoadedState ?_buildComicsPackage(context):const LoadingWidget(),
// const SizedBox(height: 10.0,),
// state is !ExploreCategoriesLoadedState ?_buildEbookPackage(context):const LoadingWidget(),
// const SizedBox(height: 10.0,),
// state is !ExploreCategoriesLoadedState ?_buildFictionPackage(context):const LoadingWidget(),
// const SizedBox(height: 10.0,),
// state is !ExploreCategoriesLoadedState ?_buildHumorPackage(context):const LoadingWidget(),
// const SizedBox(height: 10.0,),
// state is !ExploreCategoriesLoadedState ?_buildMysteryPackage(context):const LoadingWidget(),
// const SizedBox(height: 10.0,),
// state is !ExploreCategoriesLoadedState ?_buildPhilosophyPackage(context):const LoadingWidget(),
// const SizedBox(height: 10.0,),
// state is !ExploreCategoriesLoadedState ?_buildPoetryPackage(context):const LoadingWidget(),
// const SizedBox(height: 10.0,),
// state is !ExploreCategoriesLoadedState ?_buildPsychologyPackage(context):const LoadingWidget(),
// const SizedBox(height: 10.0,),
// state is !ExploreCategoriesLoadedState ?_buildTechnologyPackage(context):const LoadingWidget(),
// const SizedBox(height: 10.0,),
// ],
// )









// SizedBox(
// height: 245,
// child: ListView.separated(
// scrollDirection: Axis.vertical,
// physics: const BouncingScrollPhysics(),
// separatorBuilder: (context, index)=>const SizedBox(height: 10.0,),
// itemCount: 10,
// itemBuilder: (context, index){
// List<Widget> categoriesPackages=[
// _buildClassicsPackage(context),
// _buildComicsPackage(context),
// _buildEbookPackage(context),
// _buildFictionPackage(context),
// _buildHumorPackage(context),
// _buildMysteryPackage(context),
// _buildPhilosophyPackage(context),
// _buildPoetryPackage(context),
// _buildPsychologyPackage(context),
// _buildTechnologyPackage(context),
// ];
// return state is !ExploreCategoriesLoadedState ? categoriesPackages[index]: const LoadingWidget();
// },
// ),
// )



// ListView.separated(
// physics: const BouncingScrollPhysics(),
// scrollDirection: Axis.vertical,
// shrinkWrap: true,
// primary: false,
// itemCount: categories.length,
// separatorBuilder: (context, index) => const SizedBox(
// height: 10.0,
// ),
// itemBuilder: (context, index) {
// print('$index and ${categories.length}');
// return CoverExploreElement(
// // categories: categories,
// length: categories.length,
// indexOfItems: index,
// );
// },
// )

// child: ListView.separated(
//   itemCount: coverItems.length,
//   itemBuilder:
// print(eachCategory[index]);

// String categories =EBookCubit.get(context).getBooksCategoriesExplore(index);
// EBookCubit.get(context).getBooksCategoriesExplore(index);
// String cover =  EBookCubit.get(context).getBookCoverExploreScreen(categories, index);
// String eachCategory =categoriesList[index]['volumeInfo']['categories'][0];
// DioHelper.getData(
//     url: 'books/v1/volumes',
//     query: {
//       'q':'$eachCategory+subject',
//       'maxResults':'20',
//       'startIndex':"10"
//     }).then((value) {
//       String eachCategoryImage=value.data['items'][index]['volumeInfo']['imageLinks']['thumbnail'];
//       print(eachCategoryImage);
// }).catchError((error){
//   print(error.toString());
// });
// EBookCubit.get(context).getBookCoverExploreScreen(eachCategory);
// print(eachCategory);

// String eachCategory =coversList[index]['volumeInfo']['categories'][0];
// return buildCoversItemExploreScreen(eachCategory,context);

// return buildCoversItemExploreScreen(coversList[index],context);},
// separatorBuilder: (context, index)=>const SizedBox(width: 20,),
// scrollDirection: Axis.horizontal,
// physics: const BouncingScrollPhysics(),

// SizedBox(height: 15,),

// ]
