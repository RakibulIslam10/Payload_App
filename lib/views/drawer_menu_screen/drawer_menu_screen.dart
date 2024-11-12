import 'package:flutter/cupertino.dart';
import '../utils/responsive_layout.dart';
import 'drawer_menu_mobile_layout_screen.dart';

class DowerMenuScreen extends StatelessWidget {
  const DowerMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MyDrawerMenu()
    );
  }
}
