import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatefulWidget {
  final NetworkImage? myImage;
  final IconData? initials;
  final double? avatarRadius;
  final double? iconSize;

  CustomCircleAvatar(
      {this.myImage, this.initials, this.avatarRadius, this.iconSize});

  @override
  _CustomCircleAvatarState createState() => new _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  bool _checkLoading = true;

  @override
  void initState() {
    widget.myImage!
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((_, __) {
      if (mounted) {
        setState(() {
          _checkLoading = false;
        });
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return _checkLoading == true
        ? new CircleAvatar(
            radius: widget.avatarRadius,
            child: Icon(
              widget.initials,
              color: Colors.grey,
              size: widget.iconSize,
            ),
            backgroundColor: Colors.grey[200],
          )
        : new CircleAvatar(
            backgroundImage: widget.myImage,
            radius: widget.avatarRadius,
          );
  }
}
