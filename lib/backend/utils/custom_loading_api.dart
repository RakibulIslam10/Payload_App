import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:payloadui/views/utils/custom_color.dart';

class CustomLoadingAPI extends StatelessWidget {
  const CustomLoadingAPI({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitWaveSpinner(
        color: CustomColor.primaryLightColor,
      ),
    );
  }
}
