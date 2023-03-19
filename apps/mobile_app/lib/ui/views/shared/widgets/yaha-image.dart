import "dart:async";
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/states/image/bad_images.dart';
import 'yaha-colors.dart';

class YahaImage extends ConsumerWidget {
  final String imageUrl;
  const YahaImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badImagesNotifier = ref.read(badImagesProvider.notifier);

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
        errorWidget: (context, url, error) {
          Future.delayed(Duration.zero).then((x) {
            badImagesNotifier.addBadImage(imageUrl);
          });
          return Container(color: Colors.black);
        });
  }
}
