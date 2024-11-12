import 'package:flutter/material.dart';
import 'package:payloadui/views/profile/update_profile_screen/update_profile_mobile_screen_layout.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: UpdateProfileMobileScreenLayout());
  }
}
