import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_images.dart';

class MyStatisticScreen extends StatefulWidget {
  const MyStatisticScreen({super.key});

  @override
  State<MyStatisticScreen> createState() => _MyStatisticScreenState();
}

class _MyStatisticScreenState extends State<MyStatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
        ),
        title: Text(
          "My Statistic",
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: SizedBox(
              height: 28,
              child: SvgPicture.asset(
                AppIcons.moreCircle,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.dark2,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Your Point this Week',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontFamily: 'Nunito',
                            )),
                        Text('875 Pt',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Nunito',
                            )),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 180.h,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, _) {
                                  final days = [
                                    'Mon',
                                    'Tue',
                                    'Wed',
                                    'Thu',
                                    'Fri',
                                    'Sat',
                                    'Sun'
                                  ];
                                  return Text(
                                    days[value.toInt()],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  );
                                },
                                interval: 1,
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 1000),
                                FlSpot(1, 300),
                                FlSpot(2, 600),
                                FlSpot(3, 650),
                                FlSpot(4, 500),
                                FlSpot(5, 950),
                                FlSpot(6, 875),
                              ],
                              isCurved: true,
                              gradient: LinearGradient(
                                colors: [Color(0xFF7759FF), Color(0xFF6C4DFF)],
                              ),
                              barWidth: 3.w,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(show: false),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Text('Your Achievements',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Nunito',
                  )),
              SizedBox(height: 16.h),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 1.8,
                children: [
                  StatBox(
                    icon: AppImages.splashImage,
                    label: 'Quizzo',
                    value: '85',
                  ),
                  StatBox(
                    icon: AppImages.splashImage,
                    label: 'Lifetime Point',
                    value: '245,679',
                  ),
                  StatBox(
                    icon: AppImages.splashImage,
                    label: 'Quiz Passed',
                    value: '124',
                  ),
                  StatBox(
                    icon: AppImages.splashImage,
                    label: 'Top 3 Positions',
                    value: '38',
                  ),
                  StatBox(
                    icon: AppImages.splashImage,
                    label: 'Challenge Pass',
                    value: '269',
                  ),
                  StatBox(
                    icon: AppImages.splashImage,
                    label: 'Fastest Record',
                    value: '72',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StatBox extends StatelessWidget {
  final String icon;
  final String label;
  final String value;

  const StatBox(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.dark2,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.all(12.w),
      child: Row(
        children: [
          SizedBox(height: 28.h, child: Image.asset(icon)),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white70,
                  fontFamily: 'Nunito',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
