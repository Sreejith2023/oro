import 'package:get/get.dart';

class ChoosePlanController extends GetxController{
  RxInt groupValue = 0.obs;

  int getGroupValue(){
    return groupValue.value;
  }

  setGroupValue(int value){
    groupValue.value = value;
  }
}