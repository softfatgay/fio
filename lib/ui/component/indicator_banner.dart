import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/round_net_image.dart';
import 'package:untitled/ui/constant/colors.dart';

typedef OnPress = void Function(int index);

enum IndicatorType { num, line, none }

class IndicatorBanner extends StatefulWidget {
  final double height;
  final List<String> dataList;
  final BoxFit fit;
  final OnPress onPress;
  final EdgeInsetsGeometry margin;
  final Color backGroundColor;
  final double corner;
  final double indicatorWidth;
  final IndicatorType indicatorType;

  const IndicatorBanner({
    Key? key,
    this.height = 160,
    this.dataList = const [],
    this.fit = BoxFit.contain,
    this.backGroundColor = backColor,
    this.corner = 6,
    this.indicatorWidth = 20,
    this.indicatorType = IndicatorType.line,
    this.margin = const EdgeInsets.symmetric(horizontal: 0),
    required this.onPress,
  }) : super(key: key);

  @override
  _IndicatorBannerState createState() => _IndicatorBannerState();
}

class _IndicatorBannerState extends State<IndicatorBanner> {
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildWidget();
  }

  Widget _buildWidget() {
    return Stack(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
              height: widget.height,
              autoPlay: widget.dataList.length > 1 ? true : false,
              enlargeCenterPage: false,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
          itemCount: widget.dataList.length,
          itemBuilder: (context, index, realIdx) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: backColor,
                  borderRadius: BorderRadius.circular(widget.corner),
                ),
                margin: widget.margin,
                child: RoundNetImage(
                  url: widget.dataList[index],
                  width: double.infinity,
                  height: widget.height,
                  fit: widget.fit,
                  corner: widget.corner,
                ),
              ),
              onTap: () {
                widget.onPress(index);
              },
            );
          },
        ),
        if (widget.dataList.length > 1)
          if (widget.indicatorType != IndicatorType.none)
            widget.indicatorType == IndicatorType.line
                ? Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.dataList.asMap().entries.map((entry) {
                        return Container(
                          width: widget.indicatorWidth,
                          height: 2.0,
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: _currentIndex == entry.key
                                  ? Colors.white
                                  : const Color(0x80F2F4F9)),
                        );
                      }).toList(),
                    ),
                  )
                : Positioned(
                    bottom: 10,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          color: const Color(0x80FFFFFF),
                          borderRadius: BorderRadius.circular(2)),
                      child: Text(
                        '${_currentIndex + 1}/${widget.dataList.length}',
                        style: t12black,
                      ),
                    ),
                  ),
      ],
    );
  }
}
