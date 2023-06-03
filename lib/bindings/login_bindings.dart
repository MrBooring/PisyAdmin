import 'package:get/get.dart';
import 'package:pisyadmin/controller/login_controller.dart';

class LoginBinder implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}
