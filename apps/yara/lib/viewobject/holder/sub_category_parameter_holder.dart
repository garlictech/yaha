import 'package:fluttermultirestaurant/constant/ps_constants.dart';
import 'package:fluttermultirestaurant/viewobject/common/ps_holder.dart';

class SubCategoryParameterHolder extends PsHolder<dynamic> {
  SubCategoryParameterHolder() {
    orderType = '';
    orderBy = PsConst.FILTERING__ADDED_DATE;
    searchTerm = '';
  }

  String? orderBy;
  String? orderType;
  String? searchTerm;

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['order_type'] = orderType;
    map['order_by'] = orderBy;
    map['searchterm'] = searchTerm;
    return map;
  }

  @override
  dynamic fromMap(dynamic dynamicData) {
    orderType = '';
    orderBy = PsConst.FILTERING__ADDED_DATE;
    searchTerm = dynamicData['searchterm'];
    return this;
  }

  @override
  String getParamKey() {
    String result = '';

    if (orderType != '') {
      result += orderType!;
    }
    if (orderBy != '') {
      result += orderBy!;
    }
    if (searchTerm != '') {
      result += searchTerm!;
    }

    return result;
  }
}
