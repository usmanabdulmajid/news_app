import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/sizing.dart';

class NewsListTile extends StatefulWidget {
  final String? imageUrl;
  final String? title;
  final String? timeAgo;
  final VoidCallback onBookark;
  const NewsListTile(
      {this.imageUrl,
      this.title,
      this.timeAgo,
      required this.onBookark,
      Key? key})
      : super(key: key);

  @override
  State<NewsListTile> createState() => _NewsListTileState();
}

class _NewsListTileState extends State<NewsListTile> {
  bool isBookmark = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: context.screenWidth(),
      padding: const EdgeInsets.only(right: 20),
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: (widget.imageUrl == null)
                ? Image.asset('images/job.jpg',
                    width: 80, height: 80, fit: BoxFit.cover)
                : CachedNetworkImage(
                    imageUrl: widget.imageUrl!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover),
          ),
          const XGap(10),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.access_time,
                              size: 14, color: AppColor.grey),
                          const XGap(2),
                          Text(widget.timeAgo!,
                              style: const TextStyle(color: AppColor.grey))
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isBookmark = !isBookmark;
                          });
                          widget.onBookark;
                        },
                        child: isBookmark
                            ? const Icon(Icons.bookmark)
                            : const Icon(Icons.bookmark_outline_rounded),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
