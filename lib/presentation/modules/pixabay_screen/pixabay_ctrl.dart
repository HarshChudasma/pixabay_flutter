import 'package:application/app/utils/logger.dart';
import 'package:application/data/model/getIm_pixabay_model.dart';
import 'package:application/data/providers/network/api_response.dart';
import 'package:application/data/repositiories/pixabay_repository.dart';
import 'package:application/domain/irepositiories/i_pixabay_repo.dart';
import 'package:application/presentation/common/components/toast_components.dart';
import 'package:get/get.dart';

class PixaBayCtrl extends GetxController
    with StateMixin<List<GetImagepixabayModel>> {
  PixaBayRepository pixaBayRepository = IPixabayRepo();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  // init data
  init() async {
    await getAllImagesApiCall();
  }

  // get all images
  getAllImagesApiCall() async {
    change(null, status: RxStatus.loading());
    try {
      List<GetImagepixabayModel> imageData = await pixaBayRepository.getAllImagePixabay();
      if(imageData.isEmpty){
        change(null, status: RxStatus.empty());
      } else {
        change(imageData, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      logger.i("error : ${e.toString()}");
    }
  }
}
