import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileapp/utils/util_function.dart';

class ImagePickerSample extends StatefulWidget {
  const ImagePickerSample({Key? key}) : super(key: key);

  @override
  State<ImagePickerSample> createState() => _ImagePickerSampleState();
}

class _ImagePickerSampleState extends State<ImagePickerSample> {
  final ImagePicker _imagePicker = ImagePicker();
  List<File> multiImages = [];

  bool isMulitSelectionEnabled = false;
  HashSet selectedItem2 = new HashSet();

  multiImagePicker() async {
    final List<XFile> pickerImage = await _imagePicker.pickMultiImage(imageQuality: 10);

    if(pickerImage.length>4){

      return;
    }

    if (pickerImage != null) {
      pickerImage.forEach((e) {
        multiImages.add(File(e.path));
        debugPrint(e.path);
      });
    }
    setState(() {});
  }

  deleteItem() {
    //선택된 항목을 제거한다.
    selectedItem2.forEach((element) {
      multiImages.remove(element);
    });
    //항목을 삭제하면 상태를 변경해 준다.
    setState(() {
      isMulitSelectionEnabled = false;
      selectedItem2.clear();
    });
  }

  sendItem(title, image, content){
    //image는 asset 안에 있는 이미지 이다.
    //CommonUtil.showPopup(context, title, "", content);
   // CommonUtil.Alert(context, title, content);

   CommonUtil.showAlertDialog(context, "전송","선택된 이미지로 전시를 생성하시겠습니까?").then((value) {
     print(value);
     if (value == "OK"){

     }else{

     }
   });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: isMulitSelectionEnabled
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isMulitSelectionEnabled = false;
                      selectedItem2.clear();
                    });
                  },
                  icon: const Icon(Icons.close))
              : null,
          title: Text(isMulitSelectionEnabled
              ? getHeaderCountText()
              : "Image Multi Selection"),
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
                    // String content = "";
                    // debugPrint(content);
                    // multiImages.forEach((element) {
                    //   if (content == ""){
                    //     content = element.path;
                    //   }else{
                    //     content = content + element.path;
                    //   }
                    // });
                    // debugPrint(content);
                    sendItem("전시 생성","","선택하신 파일을 활용하여 전시가 생성되었습니다.");

                  },
                  icon: const Icon(Icons.send),
                ),
              )
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            multiImagePicker();
          },
          child: const Icon(Icons.image),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          // child: GridView.count(
          //   shrinkWrap: true,
          //   crossAxisCount: 3,
          //   crossAxisSpacing: 5.5,
          //   children: multiImages.map((e) => Image.file(File(e.path), fit: BoxFit.cover,)).toList(),
          // ),
          child: GridView.builder(
            itemCount: multiImages.length,
            shrinkWrap: true,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                crossAxisSpacing: 5, mainAxisSpacing: 5, childAspectRatio: 1,
                ),
            itemBuilder: (context, index){
              return getGridItem(multiImages[index]);
            },
          ),
          // child: MasonryGridView.builder(
          //   gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2),
          //   itemBuilder: (context, index) => Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Image.file(File(multiImages[index].path),),
          //   )
          // ),
          // child: MasonryGridView.count(
          //   shrinkWrap: true,
          //   crossAxisCount: 2,
          //   crossAxisSpacing: 5.5,
          //   mainAxisSpacing: 5.5,
          //   itemCount: multiImages.length,
          //   itemBuilder: (context, index) {
          //     //return Image.file(File(multiImages[index].path),);
          //     return getGridItem(multiImages[index]);
          //   },
          // ),
        ));
  }

  String getHeaderCountText() {
    return selectedItem2.isNotEmpty
        ? "${selectedItem2.length} item selectd"
        : "No item selected";
  }

  void doMultiSelection(File file) {
    if (isMulitSelectionEnabled) {
      setState(() {
        if (selectedItem2.contains(file)) {
          selectedItem2.remove(file);
        } else {
          selectedItem2.add(file);
        }
      });
    }
  }

  GridTile getGridItem(File file) {
    return GridTile(
      child: InkWell(
          onTap: () {
            doMultiSelection(file);
          },
          onLongPress: () {
            if (!isMulitSelectionEnabled) {
              isMulitSelectionEnabled = true;
            }
            doMultiSelection(file);
          },
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Image.file(
                file,
                fit: BoxFit.cover,
                color: Colors.black
                    .withOpacity(selectedItem2.contains(file) ? 1 : 0),
                colorBlendMode: BlendMode.color,
              ),
              Visibility(
                visible: selectedItem2.contains(file),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
