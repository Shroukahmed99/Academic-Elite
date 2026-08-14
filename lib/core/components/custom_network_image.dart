import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    required this.placeholderAsset,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final String placeholderAsset;

  @override
  Widget build(BuildContext context) {
    Widget image = imageUrl.isEmpty
        ? _placeholder()
        : Image.network(
            imageUrl,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (_, __, ___) =>
                _placeholder(),
          );

    if (borderRadius != null) {
      image = ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }

  Widget _placeholder() {
    return Image.asset(
      placeholderAsset,
      width: width,
      height: height,
      fit: fit,
    );
  }
}