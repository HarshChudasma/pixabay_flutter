import 'package:application/app/utils/logger.dart';
import 'package:application/data/model/getIm_pixabay_model.dart';
import 'package:application/data/providers/network/api_response.dart';

abstract class PixaBayRepository{

  // Pixabay api call
  Future<List<GetImagepixabayModel>> getAllImagePixabay();

}