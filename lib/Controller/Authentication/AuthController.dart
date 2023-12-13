import 'package:get/get.dart';

class SigninController extends GetxController {
  RxBool showpsw = true.obs;
  RxString selectedValueGender = 'Male'.obs;
  RxString selectedValueProvince = 'Northern'.obs;
  RxString selectedValueSDistrict = 'Jaffna'.obs;
  RxString selectedDate = '11/12/2023'.obs;
  void toggleVisiblePsw() {
    showpsw.value = !showpsw.value;
    update();
  }

  void setSelectedValue(String selectedvalue) {
    selectedValueGender.value = selectedvalue;
    update();
  }

  void setSelectedValueProvince(String selectedvalue) {
    selectedValueProvince.value = selectedvalue;
    update();
  }

  void setSelectedValueDistrict(String selectedvalue) {
    selectedValueSDistrict.value = selectedvalue;
    update();
  }

  void setSelectedValueDOB(DateTime selectedvalue) {
    selectedDate.value = selectedvalue.toString();
    print(selectedDate.value.toString()); // Print date changes
    update();
  }
}
