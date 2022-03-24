import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/sizing.dart';
import 'package:news_app/model/news.dart';

class DetailScreen extends StatelessWidget {
  final News news;
  const DetailScreen({required this.news, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: context.screenHeight(0.60),
              width: context.screenWidth(),
              padding: const EdgeInsets.only(left: 30, right: 40, bottom: 50),
              decoration: BoxDecoration(
                image: (news.urlToImage == null)
                    ? const DecorationImage(
                        image: AssetImage('images/job.jpg'), fit: BoxFit.cover)
                    : DecorationImage(
                        image: CachedNetworkImageProvider(news.urlToImage!),
                        fit: BoxFit.cover),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.transparent,
                        child: const Text('Health',
                            style: TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  const YGap(20),
                  Text(
                    news.title!,
                    maxLines: 3,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColor.white,
                        height: 1.5),
                  ),
                  const YGap(20),
                  Text(news.description!,
                      style:
                          const TextStyle(color: AppColor.white, height: 1.5))
                ],
              ),
            ),
          ),
          Positioned(
            top: context.screenHeight(0.55),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: context.screenWidth(),
                height: context.screenHeight(40),
                padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
                decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 5, top: 5, bottom: 5, right: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.black,
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 15,
                              ),
                              const XGap(10),
                              Text(news.sourceName!,
                                  style: const TextStyle(
                                      color: AppColor.white, fontSize: 15))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.lightGrey,
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.access_time,
                                  size: 16, color: AppColor.grey),
                              XGap(10),
                              Text('2 h',
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ],
                    ),
                    const YGap(25),
                    Text(news.content!,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            wordSpacing: 2,
                            height: 2,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text('conitue reading',
                            style: TextStyle(
                                wordSpacing: 2,
                                fontSize: 17,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
