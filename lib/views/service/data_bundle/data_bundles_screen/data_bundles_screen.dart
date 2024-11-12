import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

import 'data_bundles_mobile_layout_screen.dart';

class DataBundlesScreen extends StatelessWidget {
  const DataBundlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: DataBundlesMobileLayoutScreen());
  }
}
