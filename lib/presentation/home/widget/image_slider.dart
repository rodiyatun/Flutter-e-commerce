
import 'package:e_commerce/common/components/space_height.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/constant/colors.dart';
import 'package:flutter/material.dart';


class ImageSlider extends StatefulWidget {
  final List<String> items;
  final bool isAssets;
  const ImageSlider({super.key, required this.items, this.isAssets=true});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  
  get image => null;

  @override
  Widget build(BuildContext context) {
    // print('cek');
    // print(widget.items);
    return Column(

      children: [
        CarouselSlider(
          items: widget.isAssets ? widget.items
        
              .map((e) => Image.asset(
                    e,
                    height: 206.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ))
              .toList() :
              widget.items
              .map((e) => Image.network(
                    e,
                    height: 206.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 343 / 206,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _current = index;
              setState(() {});
            },
          ),
        ),
        const SpaceHeight(22.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.items.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? ColorName.grey
                            : ColorName.primary)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
