
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pisyadmin/controller/login_controller.dart';
import 'package:pisyadmin/util/util.dart';
import 'package:pisyadmin/view/layout_builder.dart';

class Login extends GetView<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktopBody: const Scaffold(),
      mobileBody: Scaffold(
        body: Container(
          // decoration: const BoxDecoration(
          //     // image: DecorationImage(
          //     //   image: AssetImage("lib/assets/bg/v3.jpg"),
          //     //   fit: BoxFit.cover,
          //     // ),
          //     ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        // width: size.width * .35,
                        // height: size.height * .15,
                        child: Image.asset(
                          "lib/assets/pisy_logo.png",
                          fit: BoxFit.fill,
                          scale: .6,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .025,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .02),
                      child: Text(
                        "Mobile Number",
                        style: TextStyle(
                          fontSize: size.height * .02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Obx(() => TextField(
                          autofocus: true,
                          enableSuggestions: true,
                          enabled: !controller.isOtpSent.value,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            LengthLimitingTextInputFormatter(10),
                          ],
                          onChanged: (value) {
                            controller.validation(value);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            errorText: controller.errortext.value.isEmpty
                                ? null
                                : controller.errortext.value,
                            border: const OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: size.height * .019,
                              horizontal: size.width * .03,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: size.height * .02,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .02),
                      child: Text(
                        "OTP",
                        style: TextStyle(
                          fontSize: size.height * .02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Obx(
                      () => TextField(
                        enabled: controller.isOtpSent.value,
                        textAlign: TextAlign.center,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'[.*]')),
                          LengthLimitingTextInputFormatter(4)
                        ],
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: size.height * .019,
                            horizontal: size.width * .03,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: size.height * .02,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Center(
                      child: Obx(
                        () => ElevatedButton(
                          style: ElevatedButton.styleFrom(),
                          onPressed: controller.isnumvalid.value == true
                              ? () {
                                  controller.sendOtp();
                                }
                              : null,
                          child: Text(controller.isOtpSent.value == false
                              ? "Request OTP"
                              : "Login"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
