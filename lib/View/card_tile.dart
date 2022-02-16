import 'package:bloc_api/Model/makeup_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTileMakeUp extends StatelessWidget {
  final MakeUpModel makeUpModel;

  // ignore: use_key_in_widget_constructors
  const CardTileMakeUp(this.makeUpModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.network(
                  makeUpModel.imageLink!,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                child: Obx(() => CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: makeUpModel.isFavorite.value
                            ? const Icon(Icons.favorite_rounded)
                            : const Icon(Icons.favorite_border),
                        onPressed: () {
                          makeUpModel.isFavorite.toggle();
                        },
                      ),
                    )),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            makeUpModel.name!,
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.w800),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          if (makeUpModel.rating != null)
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    makeUpModel.rating.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          const SizedBox(height: 8),
          Text('\$${makeUpModel.price}', style: const TextStyle(fontSize: 32)),
        ],
      ),
    );
  }
}
