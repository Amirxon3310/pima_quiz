// import 'package:flutter/widgets.dart';
// import 'package:pima_quiz/features/home/domain/entities/banner_entity.dart';

// class MyBanner extends StatelessWidget {
//   final BannerEntity banners;
//   const MyBanner({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(16.r),
//       child: Stack(
//         children: [
//           Image(
//             width: double.infinity,
//             height: 160.h,
//             fit: BoxFit.cover,
//             image: banners[index].url.isNotEmpty
//                 ? NetworkImage(banners[index].url)
//                 : AssetImage("assets/images/purple_banner.png")
//                     as ImageProvider,
//           ),
//           Positioned.fill(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//               alignment: Alignment.centerLeft,
//               color: Colors.black.withOpacity(0.3),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 220.w,
//                     child: Text(
//                       banners[index].title,
//                       style: AppTextstyles.h6w600s18.copyWith(
//                         color: Colors.white,
//                       ),
//                       maxLines: 3,
//                     ),
//                   ),
//                   SizedBox(height: 10.h),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         foregroundColor: Colors.black,
//                         padding: EdgeInsets.all(10)),
//                     child: const Text("Start"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
