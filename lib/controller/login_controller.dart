import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController otpcontroller = TextEditingController();
  var phoneno = "".obs;
  var otp = "".obs;
  var errortext = "".obs;
  var isOtpSent = false.obs;
  var isnumvalid = false.obs;

  validation(value) {
    if (value.length == 10) {
      isnumvalid.value = true;
      errortext.value = "";
      phoneno.value = value;
      // sendOtp();
    } else if (value.length < 10 && value.length > 6) {
      isnumvalid.value = false;
      errortext.value = "Number must be 10 digits";
    }
    log(errortext.value);
  }

  void sendOtp() {
    if (isOtpSent.value == true) {
      Get.offAndToNamed("/dashboard");
    }
    if (phoneno.value == "0123456789") {
      isnumvalid.value = false;
      errortext.value = "Please enter a valid number";
      isOtpSent.value = false;
    } else {
      isOtpSent.value = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    otpcontroller.dispose();
  }
}
