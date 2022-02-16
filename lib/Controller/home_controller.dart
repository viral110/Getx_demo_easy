import 'package:bloc_api/Model/home_model.dart';
import 'package:bloc_api/main.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    apiCall();
    super.onInit();
  }

  static HomeController get to => Get.find();

  final count = 0.obs;
  final nameStorage = "".obs;

  Rx<HomeModel> homeModel = HomeModel().obs;

  apiCall() {
    homeModel.value = HomeModel.fromJson({"success": 20000});
  }

  setDataInLocal() {
    getStorage.write("name", "viral vegad");
  }

  getDataInLocal() {
    nameStorage.value = getStorage.read("name");
  }
}
