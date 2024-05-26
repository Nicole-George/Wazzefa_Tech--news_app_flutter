// import 'dart:async';
// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:new_app/controller/news_controller.dart';
// import 'package:new_app/screens/view/Details/details_screen.dart';
// import 'package:new_app/screens/view/category/category_view.dart';
// import 'package:new_app/screens/widgets/cards/newsCard.dart';
// import 'package:new_app/screens/widgets/searchTextFormField/search_text_form_field.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class HomePage extends StatefulWidget {
//   String txt;
//   HomePage({super.key, required this.txt});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//  {
//   final NewsController newsController = Get.put(NewsController());
//   final TextEditingController searchController = TextEditingController();
//  List<Image> item = [
//     Image.asset('assets/images/news1.jpg', fit: BoxFit.fill, ),
//     Image.asset('assets/images/news2.jpg', fit: BoxFit.fill,  ),
//     Image.asset('assets/images/news3.jpg', fit: BoxFit.fill,  ),
//     Image.asset('assets/images/news4.jpg', fit: BoxFit.fill,  ),
//   ];
//   String? _imageFile;
//   final ImagePicker _picker = ImagePicker();




//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body:
//         CustomScrollView(
//           slivers: [
//          SliverAppBar(
//                   automaticallyImplyLeading: false,

//               expandedHeight: 130.0,
//               // pinned: true,
//               flexibleSpace: FlexibleSpaceBar(
//                 background: Container(
//                   decoration: const BoxDecoration(
//                     color: Color(0xff2b3868),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(50),
//                       bottomRight: Radius.circular(50),
//                     ),
//                   ),
//                   child:
//                    Padding(
//                     padding: const EdgeInsets.only(left: 10, top: 5),
//                     child: Column(
//                       children: [
//                          Row(
//                           children: [
//                            const SizedBox(
//                               width: 10,
//                             ),
//                             imageProfile(context),

//                            const SizedBox(
//                               width: 10,
//                             ),

//                            const SizedBox(
//                               width: 10,
//                             ),
//                            Text(
//                               widget.txt,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),

//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         SearchTextFormField(
//                           txt: 'Search with name',
//                           controller: searchController,
//                           onChanged: (value) {
//                             newsController.searchNews(value);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//            const SliverToBoxAdapter(child: SizedBox(height: 10,),),

//             SliverToBoxAdapter(
//               child: CarouselSlider(
//                 items: item,
//                 options: CarouselOptions(
//                   height: 100,
//                   enableInfiniteScroll: true,
//                   autoPlay: true,
//                   autoPlayInterval:const Duration(seconds: 4),
//                   autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                   autoPlayCurve: Curves.fastOutSlowIn,
//                 ),
//               ),
//             ),
//            const SliverToBoxAdapter( child: SizedBox(height: 10,),),

//            SliverToBoxAdapter(child: CategoryView(),),
//           //  NewsListViewBuilder(category: 'general',),

//          // const SliverToBoxAdapter( child: SizedBox(height: 10,),),

//            SliverFillRemaining (
//               child: Obx(() {
//                 return newsController.isLoading.value
//                     ?const Center(
//                         child: CircularProgressIndicator(
//                           color: Colors.pink,
//                         ),
//                       )
//                     : ListView.separated(
//                         itemBuilder: ((context, index) {
//                           return InkWell(
//                             onTap: () {
//                               Get.to(
//                                 DetailsScreen(
//                                   title: newsController
//                                       .filteredNewsArticles[index].title,
//                                   author: newsController
//                                       .filteredNewsArticles[index].author,
//                                   description: newsController
//                                       .filteredNewsArticles[index]
//                                       .description,
//                                   imageUrl: newsController
//                                       .filteredNewsArticles[index].urlToImage,
//                                   publishedAt: newsController
//                                       .filteredNewsArticles[index]
//                                       .publishedAt
//                                       .toString(),
//                                   content: newsController
//                                       .filteredNewsArticles[index].content,
//                                 ),
//                               );
//                             },
//                             child: NewsCard(
//                               title: newsController
//                                   .filteredNewsArticles[index].title,
//                               author: newsController
//                                   .filteredNewsArticles[index].author,
//                               description: newsController
//                                   .filteredNewsArticles[index].description,
//                               imageUrl: newsController
//                                   .filteredNewsArticles[index].urlToImage,
//                               publishedAt: newsController
//                                   .filteredNewsArticles[index].publishedAt
//                                   .toString(),
//                             ),
//                           );
//                         }),
//                         separatorBuilder: ((context, index) {
//                           return const SizedBox(height: 5);
//                         }),
//                         itemCount:
//                             newsController.filteredNewsArticles.length,
//                       );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget imageProfile(BuildContext context) {
//     return Stack(
//       children: [
//         CircleAvatar(
//           radius: 20.0,
//        backgroundImage: _imageFile == null
//               ? AssetImage('assets/images/person.jpg')
//               : Image.file(File (_imageFile!)).image
//         ),
//         Positioned(
//             bottom: 20,
//             right: 20,
//             child: InkWell(
//                 onTap: () {
//                   showModalBottomSheet(
//                       context: context, builder: ((builder) => bottomSheet()));
//                 },
//                 child: const Icon(
//                   Icons.camera_alt,
//                   size: 30,
//                   color: Colors.teal,
//                 )))
//       ],
//     );
//   }

//   Widget bottomSheet() {
//     return Container(
//       height: 100,
//       width: 300,
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Text(
//               "Choose Profile Photo",
//               style: TextStyle(fontSize: 30),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                     onPressed: () {
//                       takePhoto(ImageSource.camera);
//                     },
//                     icon: const Icon(Icons.camera),
//                     label: const Text("Camera")),
//                 ElevatedButton.icon(
//                     onPressed: () {
//                       takePhoto(ImageSource.gallery);
//                     },
//                     icon: const Icon(Icons.image),
//                     label: const Text("Gallery"))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void takePhoto(ImageSource source)async  {
//     final pickedFile =await _picker.pickImage(source: source);
//     setState(() {
//       _imageFile = pickedFile?.path;
//     });
//   }
// }


import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_app/controller/news_controller.dart';
import 'package:new_app/screens/view/Details/details_screen.dart';
import 'package:new_app/screens/view/category/category_view.dart';
import 'package:new_app/screens/widgets/cards/newsCard.dart';
import 'package:new_app/screens/widgets/searchTextFormField/search_text_form_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  String txt;
  HomePage({Key? key, required this.txt});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsController newsController = Get.put(NewsController());
  final TextEditingController searchController = TextEditingController();
  List<Image> item = [
    Image.asset('assets/images/news1.jpg', fit: BoxFit.fill,),
    Image.asset('assets/images/news2.jpg', fit: BoxFit.fill,),
    Image.asset('assets/images/news3.jpg', fit: BoxFit.fill,),
    Image.asset('assets/images/news4.jpg', fit: BoxFit.fill,),
  ];
  String? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  void loadImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _imageFile = prefs.getString('profileImage') ?? '';
    });
  }

  Future<void> saveImage(String imagePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profileImage', imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 130.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff2b3868),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            imageProfile(context),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.txt,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SearchTextFormField(
                          txt: 'Search with name',
                          controller: searchController,
                          onChanged: (value) {
                            newsController.searchNews(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CarouselSlider(
                items: item,
                options: CarouselOptions(
                  height: 100,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval:const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CategoryView(),
            ),
            SliverFillRemaining(
              child: Obx(() {
                return newsController.isLoading.value
                    ?const Center(
                  child: CircularProgressIndicator(
                    color: Colors.pink,
                  ),
                )
                    : ListView.separated(
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          DetailsScreen(
                            title: newsController.filteredNewsArticles[index].title,
                            author: newsController.filteredNewsArticles[index].author,
                            description: newsController.filteredNewsArticles[index].description,
                            imageUrl: newsController.filteredNewsArticles[index].urlToImage,
                            publishedAt: newsController.filteredNewsArticles[index].publishedAt.toString(),
                            content: newsController.filteredNewsArticles[index].content,
                          ),
                        );
                      },
                      child: NewsCard(
                        title: newsController.filteredNewsArticles[index].title,
                        author: newsController.filteredNewsArticles[index].author,
                        description: newsController.filteredNewsArticles[index].description,
                        imageUrl: newsController.filteredNewsArticles[index].urlToImage,
                        publishedAt: newsController.filteredNewsArticles[index].publishedAt.toString(),
                      ),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return const SizedBox(height: 5);
                  }),
                  itemCount: newsController.filteredNewsArticles.length,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundImage: _imageFile == null
              ? AssetImage('assets/images/person.jpg')
              : Image.file(File(_imageFile!)).image,
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              size: 30,
              color: Colors.teal,
            ),
          ),
        )
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Choose Profile Photo",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("Camera"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text("Gallery"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile.path;
        saveImage(_imageFile!);
      });
    }
  }
}

