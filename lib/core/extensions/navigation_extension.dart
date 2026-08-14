import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<T?> push<T>(Route<T> route) {
    return Navigator.push<T>(
      this,
      route,
    );
  }

  Future<T?> pushNamed<T>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed<T>(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> pushReplacementNamed<T>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed<T, T>(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName,
  ) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      this,
      routeName,
      (route) => false,
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.pop(
      this,
      result,
    );
  }
}