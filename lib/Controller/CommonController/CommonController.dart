import 'package:get/get.dart';

class CommonController extends GetxController {
  RxBool isLoading = false.obs;

  void enableLoader(RxBool boolvalue) {
    isLoading.value = boolvalue.value;
    update();
  }
}
