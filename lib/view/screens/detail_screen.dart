import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/sizing.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: context.screenHeight(0.55),
              width: context.screenWidth(),
              padding: const EdgeInsets.only(left: 30, right: 40, bottom: 50),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/job.jpg'), fit: BoxFit.cover),
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
                  const Text(
                    'How useful is the sharingan to the uchihas in konohagakure',
                    maxLines: 3,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColor.white,
                        height: 1.5),
                  ),
                  const YGap(20),
                  const Text(
                      'A new study indicates that the condition of the activation of the sharingan requires the emition of certain hormones.',
                      style: TextStyle(color: AppColor.white, height: 1.5))
                ],
              ),
            ),
          ),
          Positioned(
            top: context.screenHeight(0.50),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: context.screenWidth(),
                height: context.screenHeight(45),
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
                            children: const [
                              CircleAvatar(
                                radius: 15,
                              ),
                              XGap(10),
                              Text('Hatake S.',
                                  style: TextStyle(
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
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.lightGrey,
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.remove_red_eye,
                                  size: 16, color: AppColor.grey),
                              XGap(10),
                              Text('376',
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ],
                    ),
                    const YGap(25),
                    const Text('Uchiha Sasuke called Orochimaru a snake',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))
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
