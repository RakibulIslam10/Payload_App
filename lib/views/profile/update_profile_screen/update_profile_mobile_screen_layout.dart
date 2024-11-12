import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/profile/update_profile_controller.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import '../../../widgets/common/buttons/primary_button.dart';
import '../../../widgets/common/image_picker/image_picker_widget.dart';
import '../../../widgets/common/inputs/custom_form_widget.dart';
import '../../../widgets/common/dropdown_field/country_dropdown.dart';

class UpdateProfileMobileScreenLayout extends StatelessWidget {
  UpdateProfileMobileScreenLayout({super.key});

  final controller = Get.put(UpdateProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        Strings.updateProfile,
        showBackButton: false,
        autoLeading: true,
        appbarSize: Dimensions.heightSize * 2,
      ),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImagePickerWidget(),
              _inputFormWidget(context),
              _buttonWidget(context)
            ],
          ),
        ));
  }



  _inputFormWidget(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          CustomFormWidget(
              hint: Strings.firstName,
              controller: controller.firstNameController,
              label: Strings.firstName),
          CustomFormWidget(
              hint: Strings.lastName,
              controller: controller.lastNameController,
              label: Strings.lastName),
          CustomFormWidget(
              hint: Strings.phoneNumber,
              controller: controller.numberController,
              keyboardType: TextInputType.number,
              label: Strings.phoneNumber),
          CustomFormWidget(
              hint: Strings.emailAddress,
              controller: controller.emailController,
              label: Strings.emailAddress),
          CountryDropDown(
            label: Strings.selectCountry,
            selectMethod: controller.selectedCountry.value,
            itemsList: controller.profileInfoModel.data.countries,
            onChanged: (value) {
              controller.countryName.value = value!.name;
              controller.mobileCode.value = value.mobileCode;
            },
          )
        ],
      ),
    );
  }
  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSizeVertical,
        bottom: Dimensions.marginSizeVertical,
      ),
      child: Obx(
            () => controller.isUpdateLoading
            ? const CustomLoadingAPI(
        )
            : PrimaryButton(
            title: Strings.updateProfile.tr,
            onPressed: () {
              if (controller.formKey.currentState!.validate()) {
                if (controller.imageController.isImagePathSet.value) {
                  controller.profileUpdateWithImageProcess();
                } else {
                  controller.profileUpdateWithOutImageProcess();
                }
              }
            }),
      ),
    );
  }

}
