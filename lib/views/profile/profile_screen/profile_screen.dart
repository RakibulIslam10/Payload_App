import 'package:flutter/material.dart';
import '../../utils/responsive_layout.dart';
import 'profile_mobile_layout_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: ProfileMobileLayoutScreen());
  }
}
