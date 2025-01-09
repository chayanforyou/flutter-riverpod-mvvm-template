import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NetworkImageLoader extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? skeleton;
  final Widget? errorWidget;

  const NetworkImageLoader({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.skeleton,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => skeleton ??
            Skeletonizer(
              enabled: true,
              child: Container(
                width: width ?? double.infinity,
                height: height ?? 200,
                color: Colors.grey[300],
              ),
            ),
        errorWidget: (context, url, error) => errorWidget ??
            Center(
              child: Icon(
                Icons.broken_image,
                color: Colors.grey,
                size: 60.0,
              ),
            ),
      ),
    );
  }
}
