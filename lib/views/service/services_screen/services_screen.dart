import 'package:flutter/material.dart';
import '../../utils/responsive_layout.dart';
import 'services_mobile_layout_screen.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: ServicesMobileLayoutScreen());
  }
}
