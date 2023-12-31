import 'package:photo_manager/photo_manager.dart';

class MediaServices {
  Future loadAlbums(RequestType requestType) async {
    var permission = await PhotoManager.requestPermissionExtend();
    List<AssetPathEntity> albumlist = [];

    if (permission.isAuth == true) {
      albumlist = await PhotoManager.getAssetPathList(
        type: requestType,
      );
    } else {
      PhotoManager.openSetting();
    }

    return albumlist;
  }

  Future loadAssets(AssetPathEntity selectedAlbum) async {
    print("ios Count : ${selectedAlbum.assetCount}");
    if (selectedAlbum.assetCount == 0){
      return List<AssetEntity>;
    }else{
      List<AssetEntity> assetList = await selectedAlbum.getAssetListRange(
        start: 0, end: selectedAlbum.assetCount,);
      return assetList;
    }

  }
}