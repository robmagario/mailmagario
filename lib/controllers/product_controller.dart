/*
import 'package:get/get.dart';
import 'package:mailmagario/controllers/auth_controller.dart';
import 'package:mailmagario/models/product.dart';
import 'package:mailmagario/services/database.dart';

class ProductController extends GetxController {
  Rx<List<ProductModel>> productList = Rx<List<ProductModel>>();

  List<ProductModel> get products => productList.value;

  var total = 0.obs;

  addtoTotal(double weighttoAdd) {
    total = total + weighttoAdd.toInt();
  }

  deductfromTotal (double weighttoDeduct) {
    total = total - weighttoDeduct.toInt();
  }

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.toString();
    productList
        .bindStream(Database().productStream(uid)); //stream coming from firebase
  }
}

 */