import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircleProfileAvatar extends StatelessWidget {
  const CircleProfileAvatar({
    super.key,
    this.imageUrl,
    this.showBorder = false,
    this.size = const Size(24, 24),
    this.decoration,
    this.clipBehavior,
    this.isLeader,
  });

  final String? imageUrl;
  final Size size;
  final bool showBorder;
  final BoxDecoration? decoration;
  final Clip? clipBehavior;
  final bool? isLeader;

  @override
  Widget build(BuildContext context) {
    Widget buildImage() {
      return (imageUrl == null || (imageUrl != null && imageUrl!.isEmpty))
          ? const ProfileDummyImage()
          : CachedNetworkImage(
              imageUrl: imageUrl!,
              imageBuilder: (context, imageProvider) => SizedBox(
                width: size.width,
                height: size.height,
                child: CircleAvatar(
                  backgroundImage: imageProvider,
                ),
              ),
              fadeInDuration: Duration.zero,
              fadeOutDuration: Duration.zero,
              placeholder: (context, url) => ProfileDummyImage(size: size),
            );
    }

    return Container(
      width: size.width,
      height: size.height,
      clipBehavior: clipBehavior ?? Clip.none,
      decoration: decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(size.width / 2),
            border: Border.all(
              color: Theme.of(context).colorScheme.surface,
              width: 1,
            ),
          ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          buildImage(),
          (isLeader ?? false)
              ? Positioned(
                  left: -5,
                  top: -5,
                  child: Icon(
                    FontAwesomeIcons.crown,
                    color: Theme.of(context).colorScheme.onTertiary,
                    size: size.width / 2.5,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class ProfileDummyImage extends StatelessWidget {
  const ProfileDummyImage({
    super.key,
    this.size = const Size(24, 24),
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.person,
      size: size.width,
    );
  }
}
