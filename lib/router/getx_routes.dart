import 'package:get/get.dart';
import 'package:oro/bindings/data_binding.dart';
import 'package:oro/screens/choose_plan_page.dart';
import 'package:oro/screens/home_page.dart';
import 'package:oro/screens/locker_page.dart';

class GetxRoutes{
  static final routes=[
    GetPage(name: '/home', page: ()=>HomePage(), binding: DataBinding()),
    GetPage(name: '/locker', page: ()=>LockerPage(), binding: DataBinding()),
    GetPage(name: '/choose', page: ()=>ChoosePlanPage(), binding: DataBinding())
  ];
}