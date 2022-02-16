import 'package:bloc_api/Controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MaterialButton(
        onPressed: () {
          HomeController.to.apiCall();
        },
        child: const Text("Pressed"),
      ),
      body: Center(
        child: Obx(() {
          return Text(HomeController.to.homeModel.value.success.toString());
        }),
      ),
    );
  }
}
