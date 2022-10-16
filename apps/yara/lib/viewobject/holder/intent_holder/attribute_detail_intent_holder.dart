import 'package:fluttermultirestaurant/viewobject/customized_detail.dart';
import 'package:fluttermultirestaurant/viewobject/product.dart';

class AttributeDetailIntentHolder {
  const AttributeDetailIntentHolder({
    required this.product,
    required this.attributeDetail,
  });
  final Product product;
  final List<CustomizedDetail> attributeDetail;
}
