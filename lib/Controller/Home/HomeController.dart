import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString selectedValuemedicalcentre = 'Jaffna'.obs;

  void setSelectedValueMedicalCentre(String selectedvalue) {
    selectedValuemedicalcentre.value = selectedvalue;
    update();
  }
}
