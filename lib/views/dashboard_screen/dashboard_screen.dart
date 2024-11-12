import 'package:flutter/material.dart';
import 'package:payloadui/views/dashboard_screen/dashboard_mobile_screen_layout.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';


class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: DashboardMobileScreenLayout());

  }
}
