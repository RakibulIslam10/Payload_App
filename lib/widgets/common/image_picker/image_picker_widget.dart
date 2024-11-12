import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payloadui/controller/dashboard/dashboard_controller.dart';
import '../../../backend/utils/custom_snackbar.dart';
import '../../../controller/profile/update_profile_controller.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../views/utils/custom_color.dart';
import '../../../views/utils/dimensions.dart';
import '../others/custom_image_widget.dart';
import 'image_picker.dart';

File? imageFile;

class ImagePickerWidget extends StatelessWidget {
  ImagePickerWidget({super.key});

  final controller = Get.put(UpdateProfileController());
  final imgController = Get.put(InputImageController());
  final dController = Get.put(DashboardController());

  Future pickImage(imageSource) async {
    try {
      final image = await ImagePicker().pickImage(
        source: imageSource,
        imageQuality: 40,
        maxHeight: 600,
        maxWidth: 600,
      );
      if (image == null) return;

      imageFile = File(image.path);
      imgController.setImagePath(imageFile!.path);
    } on PlatformException catch (e) {
      CustomSnackBar.error('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
          child: imgController.isImagePathSet.value == true
              ? GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      pageBuilder: (ctx, a1, a2) {
                        return const Icon(
                          Icons.close,
                          color: Colors.red,
                        );
                      },
                      transitionBuilder: (ctx, a1, a2, child) {
                        var curve = Curves.easeInOut.transform(a1.value);
                        return Transform.scale(
                          scale: curve,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius * 2),
                            ),
                            content: _imagePickerBottomSheetWidget(context),
                          ),
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 400),
                    );
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: Dimensions.paddingSize,
                        bottom: Dimensions.paddingSize,
                      ),
                      height: Dimensions.heightSize * 8.3,
                      width: Dimensions.widthSize * 11.5,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius * 1.5),
                          color: CustomColor.primaryLightColor,
                          border: Border.all(
                              color: CustomColor.primaryBGLightColor, width: 5),
                          image: DecorationImage(
                              image: FileImage(
                                File(
                                  imageController.imagePath.value,
                                ),
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                )
              : _userImageWidget(context));
    });
  }

  _imagePickerBottomSheetWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.height * 0.12,
      margin: EdgeInsets.all(Dimensions.marginSizeVertical * 0.5),
      child: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:Dimensions.paddingSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(
                      Icons.image,
                      color: CustomColor.primaryLightColor,
                      size: 50,
                    )),

                IconButton(
                    onPressed: () {
                      Get.back();
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(
                      Icons.camera,
                      color: CustomColor.primaryLightColor,
                      size: 50,
                    )),
              ],
            ),
          ),
          Positioned(
            top: -12,
            right: -15,
            child: IconButton(
              onPressed: () {
                Get.close(1);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _userImageWidget(BuildContext context) {
    // var data = controller.profileInfoModel.data;
    final image = dController.defaultImage.value;
    final defaultImage = dController.defaultImage.value;
    return Stack(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(
              top: Dimensions.paddingSize,
              bottom: Dimensions.paddingSize,
            ),
            height: Dimensions.heightSize * 8.3,
            width: Dimensions.widthSize * 11.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius * 10),
              color: CustomColor.primaryLightColor,
              border:
                  Border.all(color: CustomColor.primaryLightColor, width: 5),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.radius * 10),
                child: Image.network(
                  image.isNotEmpty ? image : defaultImage,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      Assets.logo.profilePic.path,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                )),
          ),
        ),
        GestureDetector(
          onTap: () {
            showGeneralDialog(
              context: context,
              pageBuilder: (ctx, a1, a2) {
                return const Icon(
                  Icons.close,
                  color: Colors.red,
                );
              },
              transitionBuilder: (ctx, a1, a2, child) {
                var curve = Curves.easeInOut.transform(a1.value);
                return Transform.scale(
                  scale: curve,
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius * 2),
                    ),
                    content: _imagePickerBottomSheetWidget(context),
                  ),
                );
              },
              transitionDuration: const Duration(milliseconds: 400),
            );
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * 2.6),
              child: CustomImageWidget(
                path: Assets.icons.camera,
                color: CustomColor.whiteColor,
                height: Dimensions.heightSize * 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
