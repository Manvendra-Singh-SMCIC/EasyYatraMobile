import 'package:get/get.dart';
import 'package:easy_yatra/screens/empty_screens/location.dart';
import 'package:easy_yatra/screens/empty_screens/splash_screen_for_registered.dart';

import 'auth_cotroller.dart';

class OtpController extends GetxController {
  static OtpController get instace => Get.put(OtpController());

  void verifyOTP(String otp) async {
    var isVerified = await AuthController.instance.verifyOTP(otp);
    isVerified ? Get.offAll(() => const SplashScreenForRegisteredUser()) : Get.back();
  }
}
