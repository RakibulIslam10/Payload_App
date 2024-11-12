import 'package:flutter/material.dart';
import 'package:payloadui/views/news_and_blog_screen/news_and_blog_mobile_layout_screen.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

class NewsAndBlogScreen extends StatelessWidget {
  const NewsAndBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: NewsAndBlogMobileLayoutScreen());
  }
}
