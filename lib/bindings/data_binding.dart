import 'package:get/get.dart';
import 'package:oro/controllers/choose_plan_controller.dart';
import 'package:oro/controllers/home_controller.dart';
import 'package:oro/controllers/locker_controller.dart';

class DataBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LockerController());
    Get.lazyPut(() => ChoosePlanController());
  }
}