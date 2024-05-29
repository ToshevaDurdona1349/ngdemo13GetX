import 'package:get/get.dart';
import '../../feachures/articles/presentation/getx/controllers/create_controller.dart';
import '../../feachures/articles/presentation/getx/controllers/home_controller.dart';
import '../../feachures/articles/presentation/getx/controllers/update_controller.dart';



class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CreateController(), fenix: true);
    Get.lazyPut(() => UpdateController(), fenix: true);
  }
}

const String SERVER_DEV = "jsonplaceholder.typicode.com";
const String SERVER_PROD = "jsonplaceholder.typicode.com";