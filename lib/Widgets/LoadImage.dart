import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadImage extends StatefulWidget {
  double width;
  double height;
  int padding;
  String imageUrl;
  double borderRadius;
  bool isOval;

  LoadImage(this.imageUrl, this.width, this.height, this.padding,
      this.borderRadius, this.isOval);

  @override
  _LoadImageState createState() => _LoadImageState();
}

class _LoadImageState extends State<LoadImage> {
  @override
  Widget build(BuildContext context) {
    if (widget.isOval)
      return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: widget.imageUrl,
          width: widget.width - widget.padding,
          height: widget.height - widget.padding,
          placeholder: (_, url) => Center(
            child: SizedBox(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[200],
                highlightColor: Colors.grey[100],
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    else
      return Container(
        width: widget.width,
        height: widget.height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: widget.imageUrl,
            width: widget.width - widget.padding,
            height: widget.height - widget.padding,
            placeholder: (_, url) => Center(
              child: SizedBox(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[200],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    color: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }
}
