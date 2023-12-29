import "dart:async";
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/app/app.dart';
import 'yaha-colors.dart';

class YahaImage extends ConsumerWidget {
  final String? placeholderImagePath;
  final String? imageUrl;
  const YahaImage(
      {super.key, required this.imageUrl, this.placeholderImagePath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badImagesNotifier = ref.read(badImagesServiceProvider.notifier);
    final placeHolder = placeholderImagePath != null
        ? Container(
            decoration: BoxDecoration(
                image: DecorationImage(
            image: AssetImage(placeholderImagePath!),
            fit: BoxFit.cover,
          )))
        : Container(color: Colors.black);

    if (imageUrl != null) {
      return ClipRRect(
          child: CachedNetworkImage(
              imageUrl: imageUrl!,
              imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )),
                  ),
              placeholder: (context, url) => placeholderImagePath == null
                  ? const CircularProgressIndicator(
                      color: YahaColors.lightGreen)
                  : placeHolder,
              errorWidget: (context, url, error) {
                Future.delayed(Duration.zero).then((x) {
                  badImagesNotifier.addBadImage(imageUrl!);
                });
                return placeHolder;
              }));
    }

    return placeHolder;
  }
}
