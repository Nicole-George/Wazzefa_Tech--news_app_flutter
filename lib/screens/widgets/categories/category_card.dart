import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controller/news_controller.dart';
import 'package:new_app/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({Key? key, required this.category}) : super(key: key);
  final CategoryModel category;

   NewsController newsController = Get.find<NewsController>();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          newsController.setSelectedCategory(category.categoryName);
        },
        child: Container(
          height: 100,
          width: 180,
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(category.image),
            ),
          ),
          child: Center(
            child: Text(
              category.categoryName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// // import 'package:flutter/material.dart';
// // import 'package:new_app/models/category_model.dart';
// // import 'package:new_app/screens/view/category/category_view.dart';

// // class CategoryCard extends StatelessWidget {
// //    CategoryCard( {super.key,required this.category});
// //   final CategoryModel category;

  

// //   @override
// //   Widget build(BuildContext context) {
// //     return  Padding(
// //       padding: const EdgeInsets.all(8),
// //       child: Container(
// //           height: 100,
// //           width: 180,
// //           decoration: 
// //           BoxDecoration(
// //             color: Colors.amberAccent,
// //             borderRadius: BorderRadius.circular(12),
// //             image:  DecorationImage(
// //               fit: BoxFit.fill,
// //               image: AssetImage(category.image))
// //             ),
      
      
// //           child: Center(child: Text(category.categoryName,style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.bold),))),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_app/controller/news_controller.dart';
// import 'package:new_app/models/category_model.dart';

// class CategoryCard extends StatelessWidget {
//   CategoryCard({Key? key, required this.category}) : super(key: key);
//   final CategoryModel category;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: InkWell(
//         onTap: () {
//           NewsController newsController = Get.find();
//           newsController.setSelectedCategory(category.categoryName);
//         },
//         child: Container(
//           height: 100,
//           width: 180,
//           decoration: BoxDecoration(
//             color: Colors.amberAccent,
//             borderRadius: BorderRadius.circular(12),
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               image: AssetImage(category.image),
//             ),
//           ),
//           child: Center(
//             child: Text(
//               category.categoryName,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

