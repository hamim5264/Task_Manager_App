import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/data/utilities/asset_utilities.dart';
import 'package:task_manager_app/data/utilities/auth_utility.dart';
import 'package:task_manager_app/ui/screens/bottom_nav_base.dart';
import 'package:task_manager_app/ui/widgets/screen_background.dart';

import 'log_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToNextPage();
    });
  }

  void navigateToNextPage() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      final bool isUserLoggedIn = await AuthUtility.isUserLoggedIn();
      Get.offAll(
          () => isUserLoggedIn ? const BottomNavBase() : const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetsUtils.appLogoPNG,
                width: MediaQuery.sizeOf(context).width * 0.2),
          ],
        ),
      ),
    );
  }
}
