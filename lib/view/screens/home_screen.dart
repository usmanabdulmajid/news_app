import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/sizing.dart';
import 'package:news_app/viewmodel/cubit/news_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().headLines();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              if (state is NewsLoading)
                const Expanded(
                    child: Center(
                        child: SpinKitDoubleBounce(color: AppColor.black))),
              if (state is NewsLoaded)
                Container(
                  height: context.screenHeight(0.5),
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.only(left: 30, right: 40, bottom: 50),
                  decoration: BoxDecoration(
                    image: (state.news[0].urlToImage == null)
                        ? const DecorationImage(
                            image: AssetImage('images/job.jpg'),
                            fit: BoxFit.cover)
                        : DecorationImage(
                            image: CachedNetworkImageProvider(
                                state.news[0].urlToImage!),
                            fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
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
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const YGap(20),
                      Text(
                        state.news[0].title!,
                        maxLines: 3,
                        style: const TextStyle(
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
              if (state is NewsLoaded)
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
              if (state is NewsLoaded)
                Expanded(
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior(),
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 20, left: 6),
                      itemCount: state.news.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 0) return const SizedBox();
                        return Container(
                          width: context.screenWidth(0.6),
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: (state.news[index].urlToImage ==
                                            null)
                                        ? Image.asset('images/job.jpg',
                                            fit: BoxFit.cover)
                                        : CachedNetworkImage(
                                            imageUrl:
                                                state.news[index].urlToImage!,
                                            errorWidget: (context, url, err) =>
                                                const Center(
                                                    child: Icon(Icons.error)),
                                            fit: BoxFit.cover,
                                          )),
                              ),
                              const YGap(5),
                              Text(
                                state.news[index].title!,
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColor.black),
                              ),
                              const YGap(10),
                              Text(
                                state.news[index].publishedAt!
                                    .fromTimestampToTimeAgo(),
                                style: const TextStyle(color: AppColor.grey),
                              ),
                              const YGap(10),
                              Text(
                                state.news[index].sourceName!,
                                style: const TextStyle(color: AppColor.grey),
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
      },
    );
  }
}
