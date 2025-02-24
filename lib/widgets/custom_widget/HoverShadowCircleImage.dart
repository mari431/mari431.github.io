import 'package:flutter/material.dart';

class HoverShadowCircleImage extends StatefulWidget {
  final String imageUrl; // Image URL or asset path
  final bool isAssetImage;

  HoverShadowCircleImage({required this.imageUrl,required this.isAssetImage});

  @override
  _HoverShadowCircleImageState createState() => _HoverShadowCircleImageState();
}

class _HoverShadowCircleImageState extends State<HoverShadowCircleImage> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      child: AnimatedContainer(
        height: 120,
        width: 120,
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Make the decoration circular
          boxShadow: _isHovering
              ? [
            BoxShadow(
              color: Colors.black,
              offset: Offset(5, 4),
              spreadRadius: 10,
              blurRadius: 8,
            ),
          ]
              : [],
        ),
        child: widget.isAssetImage == false ?
        ClipOval(
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.fill,
            // width: 120, // Set a fixed width for the circle
            // height: 120, // Set a fixed height for the circle
          ),
        ) : ClipOval(
          child: Image.asset(
            widget.imageUrl,
            fit: BoxFit.fill,
            // width: 120,
            // height: 120,
          ),
        ),
      ),
    );
  }
}