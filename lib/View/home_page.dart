import 'package:bloc_api/Controller/makeup_controller.dart';
import 'package:bloc_api/View/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final MakeUpController makeUpController = Get.put(MakeUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("GetxDemo E-Com"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                    child: Text(
                  "All Products",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                )),
                IconButton(
                    icon: const Icon(Icons.view_list_rounded),
                    onPressed: () {}),
                IconButton(icon: const Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (makeUpController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemCount: makeUpController.productList.length,
                  itemBuilder: (context, index) {
                    return CardTileMakeUp(makeUpController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
