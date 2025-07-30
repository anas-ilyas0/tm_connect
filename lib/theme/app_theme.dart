import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmconnect/constants/app_constants.dart';
import 'package:tmconnect/theme/app_colors.dart';
import 'package:tmconnect/theme/app_text_style.dart';

class AppTheme {
  static final theme = ThemeData(
    fontFamily: AppConstants.poppins,
    scaffoldBackgroundColor: AppColors.white,
    splashFactory: InkRipple.splashFactory,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
            AppColors.primaryColor.withValues(alpha: 0.1)),
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.white,
      titleSpacing: -5,
      titleTextStyle: AppTextStyle(
        fontSize: 18.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.poppins,
      ),
      iconTheme: IconThemeData(color: AppColors.white, size: 18.sp),
    ),
  );
}
