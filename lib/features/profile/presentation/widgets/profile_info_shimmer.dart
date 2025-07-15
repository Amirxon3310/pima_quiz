import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoShimmer extends StatelessWidget {
  const ProfileInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey[800]!;
    final highlightColor = Colors.grey[700]!;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          children: [
            Container(
              height: 110.h,
              width: 110.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: baseColor,
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              height: 1,
              width: double.infinity,
              color: baseColor,
            ),
            SizedBox(height: 24.h),
            ...List.generate(5, (index) => _buildTextFieldShimmer()),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldShimmer() {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            height: 32.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
