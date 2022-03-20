import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/sizing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: context.screenHeight(0.5),
            width: double.maxFinite,
            padding: const EdgeInsets.only(left: 30, right: 40, bottom: 50),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/zag.jpg'), fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const YGap(60),
                const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                const YGap(10),
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.transparent,
                      child: const Text(
                        'News of the day',
                        style: TextStyle(
                            color: AppColor.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const YGap(20),
                const Text(
                  'V.I.P immunization for the powerful and their cronies Rattles south america',
                  maxLines: 3,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColor.white),
                ),
                const YGap(15),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Text(
                        'Learn more',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white),
                      ),
                      XGap(10),
                      Icon(Icons.arrow_forward, color: AppColor.white)
                    ],
                  ),
                )
              ],
            ),
          ),
          const YGap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Breaking News',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: AppColor.black),
                ),
                Text(
                  'More',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black),
                )
              ],
            ),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20, left: 6),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: context.screenWidth(0.6),
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              'images/job.jpg',
                              fit: BoxFit.cover,
                              width: context.screenWidth(0.6),
                            ),
                          ),
                        ),
                        const YGap(5),
                        const Text(
                          'Immortal Hidan called Sasori a red puppet',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColor.black),
                        ),
                        const YGap(10),
                        const Text(
                          '4 hours ag0',
                          style: TextStyle(color: AppColor.grey),
                        ),
                        const YGap(10),
                        const Text(
                          'By Uchiha R. Jaeger',
                          style: TextStyle(color: AppColor.grey),
                        ),
                        const YGap(50)
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
