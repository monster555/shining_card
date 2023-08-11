import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A widget representing a rotating Pokemon card with a shining effect.
class RotatingShiningCard extends StatefulWidget {
  /// A card widget that rotates and shines on mouse hover.
  ///
  /// [image] is the path to the image of the card.
  final String image;

  /// [width] and [height] are the dimensions of the card.
  final double width, height;

  const RotatingShiningCard({
    super.key,
    required this.image,
    required this.width,
    required this.height,
  });

  @override
  RotatingShiningCardState createState() => RotatingShiningCardState();
}

/// The state for a [RotatingShiningCard] widget.
class RotatingShiningCardState extends State<RotatingShiningCard> {
  /// The current X angle of the card.
  double xAngle = 0.0;

  /// The current Y angle of the card.
  double yAngle = 0.0;

  /// The offset of the shining effect relative to the card.
  Offset shineOffset = Offset.zero;

  void onHover(PointerEvent event) {
    // Calculate the angles of rotation based on the position of the mouse
    // pointer
    final dx = event.localPosition.dx - (context.size!.width / 2);
    final dy = event.localPosition.dy - (context.size!.height / 2);
    final angleX = math.atan2(dy, context.size!.height);
    final angleY = math.atan2(dx, context.size!.width);

    // Store the position of the mouse pointer
    shineOffset = event.localPosition;

    // Update the state to trigger a rebuild with the new angles of rotation
    setState(() {
      xAngle = angleX;
      yAngle = angleY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: onHover,
      child: Transform(
        // Set the center point of the rotation to be the center of the widget
        alignment: FractionalOffset.center,
        // Apply a series of transformations to the widget
        transform: Matrix4.identity()
          // Set a small perspective effect by adjusting the z value
          ..setEntry(3, 2, 0.001)
          // Rotate the widget around the x-axis based on the y position of the
          // mouse
          ..rotateX(-xAngle)
          // Rotate the widget around the y-axis based on the x position of the
          // mouse
          ..rotateY(-yAngle),
        child: ClipRect(
          child: Stack(
            children: [
              // Display the Pokemon card image
              Image.asset(
                widget.image,
                width: widget.width,
                height: widget.height,
              ),
              // Add a shining effect based on the position of the mouse
              // pointer.
              // A gradient that creates the shine effect on the card
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
                      stops: const [0, 1],
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
