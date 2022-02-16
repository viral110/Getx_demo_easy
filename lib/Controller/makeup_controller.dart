import 'package:bloc_api/Api_call/api.dart';
import 'package:bloc_api/Model/makeup_model.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class MakeUpController extends GetxController {
  final isLoading = true.obs;
  final productList = <MakeUpModel>[].obs;

  @override
  void onInit() {
    fetchMakeUpProduct();
    super.onInit();
  }

  void fetchMakeUpProduct() async {
    try {
      isLoading(true);
      var product = await ApiService.getProducts();
      if (product != null) {
        productList.value = product;
      }
    } finally {
      isLoading(false);
    }
  }
}
