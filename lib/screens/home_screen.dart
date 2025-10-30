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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 80,
                width: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.logo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.r),
              child: Column(
                children: [
                  Text(
                    'Mobile Web Services',
                    style: AppTextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'SANDBOX',
                    style: AppTextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: 140.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: Colors.black, width: 1.5)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r)),
                            backgroundColor: Color(0xFF6568FF)),
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
                          'Login',
                          style: AppTextStyle(
                              fontSize: 26.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'This is a secure site for authorized users only.',
                    textAlign: TextAlign.center,
                    style: AppTextStyle(fontSize: 14.sp, color: Colors.black87),
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
                  SizedBox(height: 20.h),
                  Text(
                    'Powered by Waterstreet',
                    style: AppTextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Franchise Management Software',
                    style: AppTextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w500),
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
