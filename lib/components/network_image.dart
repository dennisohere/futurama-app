import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class PNetworkImage extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  final double? width, height;
  const PNetworkImage(this.image, {Key? key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String img = "https://picsum.photos/200";

    return CachedNetworkImage(
      imageUrl: image.isEmpty ? img : image,
      placeholder: (context, url) =>
          Center(child: CircularProgressIndicator()
              .constrained(width: width ?? 20, height: width ?? 20)),
      errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
      fit: fit,
      width: width,
      height: height,
    );
  }
}
