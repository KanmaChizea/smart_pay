import 'package:flutter/material.dart';

extension Loader on ElevatedButton {
  withLoader(bool isLoading) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : child,
    );
  }
}
