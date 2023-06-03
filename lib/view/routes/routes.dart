import 'package:get/get.dart';
import 'package:pisyadmin/bindings/login_bindings.dart';
import 'package:pisyadmin/view/phone/auth/dashboard/dashboard.dart';
import 'package:pisyadmin/view/phone/auth/dashboard/notifications.dart';
import 'package:pisyadmin/view/phone/auth/loginpage.dart';

var routes = [
  GetPage(
    name: "/",
    page: () => Login(),
    binding: LoginBinder(),
  ),
  // GetPage(
  //   name: "/onboarding",
  //   page: () => Onboarding(),
  //   binding: OnbordingBindings(),
  // ),
  GetPage(
    name: "/dashboard",
    page: () => Dashboard(),
  ),
  GetPage(
    name: "/Notifications",
    page: () => const Notifications(),
  ),
];
