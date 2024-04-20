import 'package:application/app/routes/app_routes.dart';
import 'package:application/presentation/common/components/main_scaffold.dart';
import 'package:application/presentation/common/constants/assets_constants.dart';
import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/common/constants/string_constants.dart';
import 'package:application/presentation/modules/common/common_raw_widget.dart';
import 'package:application/presentation/modules/pixabay_screen/pixabay_ctrl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PixaBayGalleryScreen extends StatelessWidget {
  PixaBayGalleryScreen({super.key});

  final PixaBayCtrl c = Get.put(PixaBayCtrl());

  final String image = ImageConstants.applogin;

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      widget: c.obx(
        (state) => GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: state?.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.pixabayDtlScr,arguments: state[index]);
              },
              child: Hero(
                tag: "1",
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: CachedNetworkImage(
                          imageUrl: state![index].previewUrl,
                          height: state[index].previewHeight.toDouble(),
                          width: state[index].previewWidth.toDouble(),
                          placeholder: (context, url) {
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 36.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.blackColor.withOpacity(0.4),
                                AppColors.blackColor.withOpacity(0.6)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,

                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: CommonRawWidget(
                                  icon: Icons.favorite_outlined,
                                  num: state[index].views.toString(),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: CommonRawWidget(
                                  icon: Icons.remove_red_eye,
                                  num: state[index].likes.toString(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        onEmpty: Center(
          child: Text(
            StringConstants.noDataAvailable,
            style: context.textTheme.headlineLarge?.copyWith(
              fontSize: 24.0,
            ),
          ),
        ),
        onError: (error) {
          return Center(
            child: Text(
              StringConstants.noDataAvailable,
              style: context.textTheme.headlineLarge?.copyWith(
                fontSize: 24.0,
              ),
            ),
          );
        },
        onLoading: const Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}