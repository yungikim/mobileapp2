import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:photo_manager/photo_manager.dart';

import 'media_picker.dart';

class MultiImageSelect extends StatefulWidget {
  const MultiImageSelect({Key? key}) : super(key: key);

  @override
  State<MultiImageSelect> createState() => _MultiImageSelectState();
}

class _MultiImageSelectState extends State<MultiImageSelect> {
  List<AssetEntity> selectedAssetList = [];

  Future pickAssets(
      { required int maxCount, required RequestType requestType}) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return MediaPicker(maxCount, requestType);
        })
    );
    if (result.isNotEmpty || result != null) {
      setState(() {
        selectedAssetList = result;
        printPath(selectedAssetList);
        // if (selectedAssetList.isEmpty){
        //
        // }else{
        //   for (var item in selectedAssetList){
        //     File? file = await item.file;
        //     print(file.toString());
        //   }
        // }
      });
    }
  }

  Future<void> printPath(List<AssetEntity> sel) async {
    for (var item in sel){
      File? file = await item.file;
      Future<int>? size = file?.length();
      print(file!.path + "/" + size.toString() + "/" + item.size.toString() + "/" + item.width.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: selectedAssetList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,),
          itemBuilder: (context, index) {
            AssetEntity assetEntity = selectedAssetList[index];
            return Padding(
              padding: const EdgeInsets.all(2),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AssetEntityImage(
                      assetEntity,
                      isOriginal: false,
                      thumbnailSize: const ThumbnailSize.square(1000),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, statckTrace) {
                        return const Center(
                          child: Icon(Icons.error, color: Colors.red,),
                        );
                      },
                    ),
                  ),
                  if (assetEntity.type == AssetType.video)
                    const Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Iconsax.video5,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    )

                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pickAssets(maxCount: 10, requestType: RequestType.image,);
          },
          child: const Icon(Iconsax.image5),
        ),
      ),
    );
  }
}
