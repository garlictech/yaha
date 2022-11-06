import 'package:yara/viewobject/common/ps_object.dart';
import 'package:yara/viewobject/delete_object.dart';
import 'package:yara/viewobject/mobile_setting.dart';
import 'package:yara/viewobject/ps_app_version.dart';
import 'package:yara/viewobject/user_info.dart';

class PSAppInfo extends PsObject<PSAppInfo> {
  PSAppInfo({
    this.psAppVersion, 
    this.mobileSetting,
    this.deleteObject, 
    this.userInfo});

  PSAppVersion? psAppVersion;
  MobileSetting? mobileSetting;
  UserInfo? userInfo;
  List<DeleteObject>? deleteObject;

  @override
  String getPrimaryKey() {
    return '';
  }

  @override
  PSAppInfo fromMap(dynamic dynamicData) {
   // if (dynamicData != null) {
      return PSAppInfo(
          psAppVersion: PSAppVersion().fromMap(dynamicData['version']),
          mobileSetting: MobileSetting().fromMap(dynamicData['mobile_setting']),
          userInfo: UserInfo().fromMap(dynamicData['user_info']),
          deleteObject:
              DeleteObject().fromMapList(dynamicData['delete_history']));
    // } else {
    //   return null;
    // }
  }

  @override
  Map<String, dynamic>? toMap(dynamic object) {
    if (object != null) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['version'] = PSAppVersion().toMap(object.psAppVersion);
      data['mobile_setting'] = MobileSetting().toMap(object.mobileSetting);
      data['user_info'] = UserInfo().toMap(object.userInfo);
      data['delete_history'] = object.deleteObject.toList();
      return data;
    } else {
      return null;
    }
  }

  @override
  List<PSAppInfo> fromMapList(List<dynamic> dynamicDataList) {
    final List<PSAppInfo> psAppInfoList = <PSAppInfo>[];

    //if (dynamicDataList != null) {
      for (dynamic json in dynamicDataList) {
        if (json != null) {
          psAppInfoList.add(fromMap(json));
        }
      }
  //  }
    return psAppInfoList;
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<dynamic> objectList) {
    final List<dynamic> dynamicList = <dynamic>[];
   // if (objectList != null) {
      for (dynamic data in objectList) {
        if (data != null) {
          dynamicList.add(toMap(data));
        }
      }
   // }

    return dynamicList as List<Map<String, dynamic>?>;
  }
}
