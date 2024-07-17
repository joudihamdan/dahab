import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  var resultModel =ResultModel().obs;
  getCategory(id) async{
    resultModel.value=await CategoryService().getCategoryById(id);
  }

}