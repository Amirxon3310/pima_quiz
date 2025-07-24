// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pima_quiz/core/resources/app_colors.dart';
// import 'package:pima_quiz/features/home/presentation/widgets/podium_widget.dart';

// class AnimatedPodiumHeader extends StatelessWidget {
//   const AnimatedPodiumHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverPersistentHeader(
//       pinned: true,
//       delegate: _AnimatedPodiumDelegate(
//         minExtent: 180.h,
//         maxExtent: 340.h,
//       ),
//     );
//   }
// }

// class _AnimatedPodiumDelegate extends SliverPersistentHeaderDelegate {
//   @override
//   final double minExtent;
//   @override
//   final double maxExtent;

//   _AnimatedPodiumDelegate({
//     required this.minExtent,
//     required this.maxExtent,
//   });

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     final double scrollPercent =
//         (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

//     final double translateY = -100 * scrollPercent;
//     final double opacity = 1 - scrollPercent;

//     return LayoutBuilder(builder: (context, constraints) {
//       debugPrint("PodiumWidget constraints height: ${constraints.maxHeight}");
//       return ConstrainedBox(
//         constraints: BoxConstraints.expand(height: maxExtent),
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 16.h),
//           child: Stack(
//             children: [
//               Transform.translate(
//                 offset: Offset(0, translateY),
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
                  // child: Row(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     PodiumWidget(
                  //       name: "Amirxon",
                  //       point: "100",
                  //       stepType: "silver_step",
                  //       medalType: "silver_medal",
                  //       containerWidth: 124,
                  //       containerHeight: 154,
                  //       medalWidth: 130,
                  //       medalHeight: 130,
                  //       color: AppColors.primary400,
                  //       scrollPercent: scrollPercent,
                  //     ),
                  //     PodiumWidget(
                  //       name: "Azizbek",
                  //       point: "120",
                  //       stepType: "gold_step",
                  //       medalType: "gold_medal",
                  //       containerWidth: 132,
                  //       containerHeight: 188,
                  //       medalWidth: 140,
                  //       medalHeight: 140,
                  //       gradient: AppColors.gradientPurple,
                  //       scrollPercent: scrollPercent,
                  //     ),
                  //     PodiumWidget(
                  //       name: "Nodir",
                  //       point: "90",
                  //       stepType: "bronze_step",
                  //       medalType: "bronze_medal",
                  //       containerWidth: 124,
                  //       containerHeight: 124,
                  //       medalWidth: 120,
                  //       medalHeight: 120,
                  //       color: AppColors.primary400,
                  //       // scrollPercent: scrollPercent,
                  //     ),
                  //   ],
                  // ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }

//   @override
//   bool shouldRebuild(covariant _AnimatedPodiumDelegate oldDelegate) {
//     return oldDelegate.maxExtent != maxExtent ||
//         oldDelegate.minExtent != minExtent;
//   }
// }
