import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';

void showTopNotification({
  required BuildContext context,
  required String message,
  required Color backgroundColor,
  required String title,
}) {
  final overlayState = Overlay.of(context);
  late OverlayEntry overlayEntry;

  double top = -150.h;

  overlayEntry = OverlayEntry(
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AnimatedPositioned(
            duration: Duration(milliseconds: 150),
            top: top,
            left: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: 150.h,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  image: DecorationImage(
                    image: AssetImage(
                      backgroundColor == AppColors.error
                          ? 'assets/images/red_banner.png'
                          : 'assets/images/green_banner.png',
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    12.height,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Text(
                          message,
                          style: TextStyle(
                            color: backgroundColor,
                            fontSize: 16,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    16.height,
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );

  overlayState.insert(overlayEntry);

  Future.delayed(Duration(milliseconds: 50), () {
    overlayEntry.markNeedsBuild();
    top = 0;
  });

  Future.delayed(Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
