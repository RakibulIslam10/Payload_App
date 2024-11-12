import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/others/grid_custom_card_widget.dart';
import '../../controller/news_and_blog/news_and_blog_screen_controller.dart';
import '../../language/language.dart';

class NewsAndBlogMobileLayoutScreen extends StatelessWidget {
  NewsAndBlogMobileLayoutScreen({super.key});

  final NewsAndBlogScreenController _controller = Get.put(NewsAndBlogScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        _sliderImageWidget(context),
        verticalSpace(Dimensions.marginSizeVertical),
        _gridViewWidget()
      ],
    );
  }

  _gridViewWidget() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.5),
        child: Obx(
            () => GridView.builder(
              itemCount: _controller.gridCardModel.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: Dimensions.marginSizeHorizontal * 0.5,
                mainAxisSpacing: Dimensions.marginSizeVertical * 0.5,
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                final card = _controller.gridCardModel[index];
                return GridCustomCardWidget(
                  imagePath: card.imagePath,
                  timeText: card.timeText,
                  dateText: card.dateText,
                  title: card.title,
                  description: card.description,
                  onAddMore: () {},
                );
              },
            ),
          )
      ),
    );
  }

  _sliderImageWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.21,
      child: PageView.builder(
        onPageChanged: (index) {
          _controller.currentIndex.value = index;
        },
        controller: _controller.pageController,
        itemCount: _controller.imageList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * 0.5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius * 1.2),
                image: DecorationImage(
                    image: AssetImage(_controller.imageList[index]),
                    fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }

  _appbarWidget() {
    return PrimaryAppBar(
      autoLeading: true,
      appbarSize: Dimensions.heightSize * 4.5,
      Strings.newsAndBlog,
      showBackButton: false,
      centerTitle: false,
      action: [
        IconButton(
            onPressed: () {},
            icon: Padding(
              padding: EdgeInsets.only(right: Dimensions.paddingSize * 0.5),
              child: const Icon(
                Icons.search_sharp,
              ),
            ),)
      ],
    );
  }
}
