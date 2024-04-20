import 'package:application/data/model/getIm_pixabay_model.dart';
import 'package:get/get.dart';

class PixabayDetailsCtrl extends GetxController{

  Rxn<GetImagepixabayModel> getImageModel = Rxn<GetImagepixabayModel>();

  @override
  void onInit() {
    getImageModel.value = Get.arguments as GetImagepixabayModel;
    super.onInit();
  }


}