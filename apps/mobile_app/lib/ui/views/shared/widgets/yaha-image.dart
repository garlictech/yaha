import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'yaha-colors.dart';

class YahaImage extends StatelessWidget {
  final String imageUrl;
  const YahaImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        )),
      ),
      placeholder: (context, url) =>
          const CircularProgressIndicator(color: YahaColors.lightGreen),
      errorWidget: (context, url, error) => Container(color: Colors.black),
    );
  }
}
