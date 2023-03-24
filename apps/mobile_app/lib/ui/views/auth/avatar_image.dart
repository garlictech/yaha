import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/data/auth/avatar_image_url.dart';

class AvatarImage extends ConsumerWidget {
  static const placeHolderImage = 'assets/images/profile-unknown.png';

  const AvatarImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarImageUrl = ref.watch(avatarImageUrlProvider);

    final image = avatarImageUrl == null
        ? Image.asset(placeHolderImage, fit: BoxFit.cover)
        : Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(avatarImageUrl))));

    return Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: image);
  }
}
