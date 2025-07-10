import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedBoxExtension on num {
  SizedBox get width => SizedBox(width: w);

  SizedBox get height => SizedBox(height: h);
}
