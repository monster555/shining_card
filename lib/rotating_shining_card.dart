import 'dart:math' as math;
import 'package:flutter/material.dart';

class RotatingShiningCard extends StatefulWidget {
  final String imageUrl;
  final double width, height;

  const RotatingShiningCard({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  RotatingShiningCardState createState() => RotatingShiningCardState();
}

class RotatingShiningCardState extends State<RotatingShiningCard> {
  double xAngle = 0.0;
  double yAngle = 0.0;
  Offset shineOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        final dx = event.localPosition.dx - (context.size!.width / 2);
        final dy = event.localPosition.dy - (context.size!.height / 2);
        final angleX = math.atan2(dy, context.size!.height);
        final angleY = math.atan2(dx, context.size!.width);
        shineOffset = event.localPosition;
        setState(() {
          xAngle = angleX;
          yAngle = angleY;
        });
      },
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(-xAngle)
          ..rotateY(-yAngle),
        child: ClipRect(
          child: Stack(
            children: [
              Image.network(
                widget.imageUrl,
                width: widget.width,
                height: widget.height,
              ),
              Positioned(
                left: shineOffset.dx - widget.width,
                top: shineOffset.dy - widget.height,
                child: Container(
                  width: widget.width * 2,
                  height: widget.height * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.white.withOpacity(.5),
                        Colors.transparent,
                      ],
                      stops: [0, 1],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
