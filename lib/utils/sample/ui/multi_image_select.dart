import 'dart:collection';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../util_function.dart';
import 'media_picker.dart';

class MultiImageSelect extends StatefulWidget {
  const MultiImageSelect({Key? key}) : super(key: key);

  @override
  State<MultiImageSelect> createState() => _MultiImageSelectState();
}

class _MultiImageSelectState extends State<MultiImageSelect> {
  List<AssetEntity> selectedAssetList = [];

  bool isMulitSelectionEnabled = false;
  HashSet selectedItem = new HashSet();

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
        selectedAssetList.addAll(result);
     //   selectedAssetList = result;
     //   printPath(selectedAssetList);
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

  deleteItem() {
    //선택된 항목을 제거한다.
    selectedItem.forEach((element) {
      selectedAssetList.remove(element);
    });
    //항목을 삭제하면 상태를 변경해 준다.
    setState(() {
      isMulitSelectionEnabled = false;
      selectedItem.clear();
    });
  }

  sendItem(title, image, content){
    //image는 asset 안에 있는 이미지 이다.
    //CommonUtil.showPopup(context, title, "", content);
    // CommonUtil.Alert(context, title, content);

    CommonUtil.showAlertDialog(context, "전송","선택된 이미지로 전시를 생성하시겠습니까?").then((value) {
      print(value);
      if (value == "OK"){
        printPath(selectedAssetList);
      }else{
        print("취소한다");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: isMulitSelectionEnabled
              ? IconButton(
              onPressed: () {
                setState(() {
                  isMulitSelectionEnabled = false;
                  selectedItem.clear();
                });
              },
              icon: const Icon(Icons.close))
              : null,
          title: Text(isMulitSelectionEnabled
              ? getHeaderCountText()
              : tr("selectimage"), style: const TextStyle(fontSize: 20),),
          actions: [
            Visibility(
              visible: isMulitSelectionEnabled ? true : false,
              child: GestureDetector(
                  onTap: () {
                    deleteItem();
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: (){
                          deleteItem();
                        },
                      )
                  )),
            ),
            Visibility(
                visible: isMulitSelectionEnabled ? false : true,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    onPressed: (){
                      sendItem("전시 생성","","선택하신 파일을 활용하여 전시가 생성되었습니다.");
                    },
                    icon: const Icon(Icons.send),
                  ),
                )
            )
          ],
        ),
        body: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: selectedAssetList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,),
          itemBuilder: (context, index) {
            AssetEntity assetEntity = selectedAssetList[index];
            return getGridItem(assetEntity);
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

  String getHeaderCountText() {
    return selectedItem.isNotEmpty
        ? "${selectedItem.length} item selectd"
        : tr("selectimage");
  }

  void doMultiSelection(AssetEntity assetEntity) {
    if (isMulitSelectionEnabled) {
      setState(() {
        if (selectedItem.contains(assetEntity)) {
          selectedItem.remove(assetEntity);
          if (selectedItem.isEmpty){
            isMulitSelectionEnabled = false;
          }
        } else {
          selectedItem.add(assetEntity);
        }
      });
    }
  }

  GridTile getGridItem(AssetEntity assetEntity){
    return GridTile(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: InkWell(
          onTap: (){
            doMultiSelection(assetEntity);
          },
          onLongPress: (){
            if (!isMulitSelectionEnabled) {
              isMulitSelectionEnabled = true;
            }
            doMultiSelection(assetEntity);
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AssetEntityImage(
                      assetEntity,
                      isOriginal: false,
                      thumbnailSize: const ThumbnailSize.square(1000),
                      fit: BoxFit.cover,
                      color: Colors.black
                          .withOpacity(selectedItem.contains(assetEntity) ? 1 : 0),
                      colorBlendMode: BlendMode.color,
                      errorBuilder: (context, error, statckTrace) {
                        return const Center(
                          child: Icon(Icons.error, color: Colors.red,),
                        );
                      },
                    ),
                    Visibility(
                      visible: selectedItem.contains(assetEntity),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.check, color: Colors.white, size: 30,),
                      ),
                    )
                  ],
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
        ),
      ),
    );
  }
}
