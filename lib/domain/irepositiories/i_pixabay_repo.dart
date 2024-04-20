import 'package:application/app/utils/logger.dart';
import 'package:application/data/common/constants/api_endpoints_constants.dart';
import 'package:application/data/model/getIm_pixabay_model.dart';
import 'package:application/data/providers/network/api_response.dart';
import 'package:application/data/providers/network/apikey_token/api.dart';
import 'package:application/data/repositiories/pixabay_repository.dart';

class IPixabayRepo extends PixaBayRepository {

  @override
  Future<List<GetImagepixabayModel>> getAllImagePixabay() async {
    try {
      var response = await apiService.get(url: '', body: {'key': ApiStringConst.apiKey},);
      if(response.statusCode == 200){
        List<dynamic> data = response.data['hits'];
        List<GetImagepixabayModel> listOfData = data.map((e) => GetImagepixabayModel.fromJson(e)).toList();
        return listOfData;
      }
      throw Exception("res.m");
    } catch (e) {
      logger.i("Error when get image : ${e.toString()}");
      rethrow;
    }
  }

}