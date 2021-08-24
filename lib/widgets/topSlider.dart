import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:monibie/enums/const.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TopSlider extends StatefulWidget {
  const TopSlider({Key? key}) : super(key: key);

  @override
  _TopSliderState createState() => new _TopSliderState();
}

class _TopSliderState extends State<TopSlider> {
  int activeIndex = 0;

  final controller = ScrollController(initialScrollOffset: 0.8);

  Widget buildImage(String url, int index, context) => SizedBox(
      // height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Image.asset(
          url,
          fit: BoxFit.contain,
          width: MediaQuery.of(context).size.width,
        ),
      ));

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: imgList.length,
        effect: ScrollingDotsEffect(
          // fixedCenter: true,
          dotHeight: 10,
          dotWidth: 10,
          dotColor: HexColor(cgrey),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CarouselSlider.builder(
            itemCount: imgList.length,
            itemBuilder: (context, index, i) {
              final urlImage = imgList[index];
              return buildImage(urlImage, index, context);
            },
            options: CarouselOptions(
                // aspectRatio: 2.0,
                onPageChanged: (i, reason) => setState(() => activeIndex = i),
                height: MediaQuery.of(context).size.height / 5,
                viewportFraction: 1),
          ),
          Positioned(
              top: 130,
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(child: buildIndicator())),
        ],
      ),
    );
  }
}
