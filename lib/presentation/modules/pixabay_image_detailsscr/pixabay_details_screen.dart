import 'package:application/presentation/common/components/main_scaffold.dart';
import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/modules/common/common_raw_widget.dart';
import 'package:application/presentation/modules/pixabay_image_detailsscr/pixabay_details_ctrl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PixaBayDetailScreen extends StatelessWidget {
  PixaBayDetailScreen({Key? key}) : super(key: key);

  final PixabayDetailsCtrl c = Get.put(PixabayDetailsCtrl());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      widget: SizedBox(
        height: 500,
        child:
        Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: c.getImageModel()!.largeImageUrl,
                height: c.getImageModel()!.imageHeight.toDouble(),
                width: c.getImageModel()!.imageWidth.toDouble(),
                placeholder: (context, url) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 60.0,
              child: Row(
                children: [
                  Expanded(
                    child: CommonRawWidget(
                      icon: Icons.favorite_outlined,
                      num: c.getImageModel()!.views.toString(),
                      fontClr: AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CommonRawWidget(
                      icon: Icons.remove_red_eye,
                      num: c.getImageModel()!.likes.toString(),
                      fontClr: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
