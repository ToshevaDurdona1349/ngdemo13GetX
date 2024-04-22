import 'package:get/get.dart';

import '../controllers/creat_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/update_controller.dart';


class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CreatController(), fenix: true);
    Get.lazyPut(() => UpdateController(), fenix: true);
  }
}