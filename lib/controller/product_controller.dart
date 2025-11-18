import 'package:ecommerceapp/model/product_detail_model.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController{
  late List<ProductModel> products;

  @override
  void onInit(){
    products = Get.arguments ?? <ProductModel>[];
    super.onInit();
  }
}