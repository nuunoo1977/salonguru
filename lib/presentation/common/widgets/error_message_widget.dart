import 'package:flutter/material.dart';

import '../../../configs/theme/app_textstyles.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;
  final Function()? onRetry;
  const ErrorMessageWidget({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextstyles.errorMessage,
          ),
          if (onRetry != null) SizedBox(height: 16),
          if (onRetry != null)
            ElevatedButton.icon(
              onPressed: onRetry,
              label: Text("Try again"),
              icon: Icon(Icons.refresh),
            ),
        ],
      ),
    );
  }
}
