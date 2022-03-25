import 'package:get/get.dart';

class DummyScreenController extends GetxController {
  
  RxBool isDropdownOpen = false.obs;
  RxBool isError = false.obs;

  void toggleDropdownFlag() {
    isDropdownOpen.update((dropdownState) {
      dropdownState = !isDropdownOpen.value;
      isDropdownOpen.value = dropdownState;
    });
  }

  void toogleError() {
    isError.update((error) {
      error = !isError.value;
      isError.value = error;
    });
  }
}
