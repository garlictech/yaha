import 'package:fluttermultirestaurant/viewobject/common/ps_object.dart';

class TransactionStatus extends PsObject<TransactionStatus> {
  TransactionStatus(
      {this.id,
      this.title,
      this.ordering,
      this.colorValue,
      this.startStage,
      this.finalStage,
      this.isRefundable,
      this.addedDate,
      this.addedDateStr,
      this.refundStatus,
      this.ratingStatus});

  String? id;
  String? title;
  String? ordering;
  String? colorValue;
  String? startStage;
  String? finalStage;
  String? isRefundable;
  String? addedDate;
  String? addedDateStr;
  String? refundStatus;
  String? ratingStatus;

  @override
  String? getPrimaryKey() {
    return id;
  }

  @override
  TransactionStatus fromMap(dynamic dynamicData) {
   // if (dynamicData != null) {
      return TransactionStatus(
        id: dynamicData['id'],
        title: dynamicData['title'],
        ordering: dynamicData['ordering'],
        colorValue: dynamicData['color_value'],
        startStage: dynamicData['start_stage'],
        finalStage: dynamicData['final_stage'],
        isRefundable: dynamicData['is_refundable'],
        addedDate: dynamicData['added_date'],
        addedDateStr: dynamicData['added_date_str'],
        refundStatus: dynamicData['refund_status'],
        ratingStatus: dynamicData['rating_status'],
      );
    // } else {
    //   return null;
    // }
  }

  @override
  Map<String, dynamic>? toMap(dynamic object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (object != null) {
      data['id'] = object.id;
      data['title'] = object.title;
      data['ordering'] = object.ordering;
      data['color_value'] = object.colorValue;
      data['start_stage'] = object.startStage;
      data['final_stage'] = object.finalStage;
      data['is_refundable'] = object.isRefundable;
      data['added_date'] = object.addedDate;
      data['added_date_str'] = object.addedDateStr;
      data['refund_status'] = object.refundStatus;
      data['rating_status'] = object.ratingStatus;
      return data;
    } else {
      return null;
    }
  }

  @override
  List<TransactionStatus> fromMapList(List<dynamic> dynamicDataList) {
    final List<TransactionStatus> defaultPhotoList = <TransactionStatus>[];

   // if (dynamicDataList != null) {
      for (dynamic dynamicData in dynamicDataList) {
        if (dynamicData != null) {
          defaultPhotoList.add(fromMap(dynamicData));
        }
      }
   // }
    return defaultPhotoList;
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<TransactionStatus> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];

   // if (objectList != null) {
      for (TransactionStatus? data in objectList) {
        if (data != null) {
          mapList.add(toMap(data));
        }
      }
   // }

    return mapList;
  }
}
