import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/sizing.dart';

class NewsListTile extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? timeAgo;
  const NewsListTile({this.imageUrl, this.title, this.timeAgo, Key? key})
      : super(key: key);

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
            child: Image.asset(imageUrl!,
                width: 80, height: 80, fit: BoxFit.cover),
          ),
          const XGap(10),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
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
                          const Icon(Icons.access_time, size: 14),
                          const XGap(2),
                          Text(timeAgo!)
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.remove_red_eye, size: 14),
                          XGap(2),
                          Text('347 Views')
                        ],
                      ),
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
