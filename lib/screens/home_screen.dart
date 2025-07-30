import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmconnect/constants/app_constants.dart';
import 'package:tmconnect/constants/app_images.dart';
import 'package:tmconnect/theme/app_colors.dart';
import 'package:tmconnect/theme/app_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  customRow(String text) {
    return Row(
      spacing: 5.w,
      children: [
        Image.asset(height: 20, AppImages.checkBox),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(height: 100.h, AppImages.tmConnectIcon),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(24.r),
              child: Column(
                children: [
                  Text(
                    'Your Companion for Mobile Productivity',
                    style:
                        AppTextStyle(fontSize: 16.sp, color: Color(0xFF6C6C6C)),
                  ),
                  // SizedBox(height: 30.h),
                  // Text.rich(
                  //   TextSpan(
                  //     text: 'Welcome to ',
                  //     style: AppTextStyle(fontSize: 16.sp),
                  //     children: [
                  //       TextSpan(
                  //         text: AppConstants.appName,
                  //         style: AppTextStyle(
                  //           fontSize: 16.sp,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       TextSpan(
                  //         text:
                  //             ' for Mobile. Your all-in-one productivity app for managing your leads, customers, calendars, and more.',
                  //         style: AppTextStyle(fontSize: 16.sp),
                  //       ),
                  //     ],
                  //   ),
                  //   textAlign: TextAlign.start,
                  // ),
                  // SizedBox(height: 25.h),
                  // customRow('Sales Leads'),
                  // SizedBox(height: 5.h),
                  // customRow('Customer List'),
                  // SizedBox(height: 5.h),
                  // customRow('Estimates'),
                  // SizedBox(height: 5.h),
                  // customRow('Active Jobs'),
                  // SizedBox(height: 5.h),
                  // customRow('Invoices'),
                  // SizedBox(height: 5.h),
                  // customRow('Schedule Board'),
                  SizedBox(height: 50.h),
                  SizedBox(
                    width: 250.w,
                    height: 50.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r)),
                            backgroundColor: AppColors.green),
                        onPressed: () async {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            ),
                          );
                          await Future.delayed(const Duration(seconds: 2));
                          Navigator.pop(context);
                          final Uri tmConnectUrl =
                              Uri.parse(AppConstants.tmConnectUrl);
                          try {
                            await launchUrl(tmConnectUrl,
                                mode: LaunchMode.externalApplication);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Could not launch TMConnect'),
                                dismissDirection: DismissDirection.horizontal,
                              ),
                            );
                          }
                        },
                        child: Text(
                          AppConstants.appName,
                          style: AppTextStyle(
                              fontSize: 16.sp, color: AppColors.white),
                        )),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    '2025 The Maids. All rights reserved.',
                    style: AppTextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        ),
                      );
                      await Future.delayed(const Duration(seconds: 2));
                      Navigator.pop(context);
                      final Uri privacyPolicy =
                          Uri.parse(AppConstants.privacyPolicy);
                      try {
                        await launchUrl(privacyPolicy,
                            mode: LaunchMode.externalApplication);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Could not launch privacy policy'),
                            dismissDirection: DismissDirection.horizontal,
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Privacy Policy',
                      style: AppTextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'Offline',
                    style: AppTextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Click here to download today`s schedule',
                    style: AppTextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
