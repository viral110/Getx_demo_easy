import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StoreFileController extends GetxController {
  final storeName = "Hello World".obs;
  final followerCount = 0.obs;
  final storeStatus = true.obs;
  final listOfFollower = [].obs;
  final storeNameController = TextEditingController();

  updateStoreName(String name) {
    storeName(name);
  }

  updateFollowerCount() {
    followerCount(followerCount.value + 1);
  }

  void storeStatusOpen(bool isOpen) {
    storeStatus(isOpen);
  }
}
