import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mypcot/core/utilities/constants/app_colors.dart';

Widget buildCustomCard() {
  return CarouselSlider.builder(
    options: CarouselOptions(
      viewportFraction: 1.0,
      height: 250,
    ),
    itemCount: 3,
    itemBuilder: (context, index, realIndex) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/orders-illustration-image.svg',
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Orders',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 40,
            child: Container(
              width: 125,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCardInfo(
                      'You have 3 active\n orders from',
                      AppColors.orange,
                      const [
                        'assets/images/card1.jpg',
                        'assets/images/card1.jpg',
                        'assets/images/card1.jpg'
                      ],
                      50,
                      100),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _buildCardInfo(
                        '02 pending\n Orders from',
                        textColor: Colors.black,
                        Colors.white,
                        const [
                          'assets/images/card1.jpg',
                          'assets/images/card1.jpg',
                        ],
                        50,
                        100),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget _buildCardInfo(String text, Color bgColor, List<String> avatars,
    double height, double width,
    {Color? background, Color? textColor}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 70,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: background ?? bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 12, // Default font size
            ),
            children: text.split(' ').map((word) {
              return TextSpan(
                text: '$word ',
                style: TextStyle(
                  fontSize: word.contains(RegExp(r'\d+')) ? 16 : 12,
                  fontWeight: word.contains(RegExp(r'\d+'))
                      ? FontWeight.bold
                      : FontWeight.w500,
                ),
              );
            }).toList(),
          ),
        ),
        // child: Text(
        //   text,
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     color: textColor ?? Colors.white,
        //     fontWeight: FontWeight.w500,
        //     fontSize: 12,
        //   ),
        // ),
      ),
      Positioned(
        left: (width - (avatars.length * 25.0)) / 2,
        bottom: -25,
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: List.generate(
              avatars.length,
              (index) => Positioned(
                left: index * 26.0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.pink,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 18,
                    // backgroundColor: Colors.red,
                    backgroundImage: AssetImage(avatars[index]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
