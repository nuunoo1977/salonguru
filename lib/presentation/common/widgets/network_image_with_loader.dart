import 'package:flutter/material.dart';

// TODO(nunofelicio): cache network images
class NetworkImageWithLoader extends StatelessWidget {
  final String src;
  final BoxFit fit;
  const NetworkImageWithLoader(
    this.src, {
    this.fit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Image.network(
        src,
        fit: fit,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator.adaptive(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          );
        },
      );
}
