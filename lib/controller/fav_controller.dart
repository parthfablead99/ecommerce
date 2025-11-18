import 'package:ecommerceapp/model/product_detail_model.dart';
import 'package:get/get.dart';

class FavController extends GetxController{
  RxList<ProductModel> fav = <ProductModel>[].obs;

  bool isFav(ProductModel product)=>fav.any((p)=>p.image == product.image);

  void toogleFav(ProductModel product){
    if(isFav(product)){
      fav.removeWhere((p)=> p.image == product.image);
    }else{
      fav.add(product);
    }
  }
}