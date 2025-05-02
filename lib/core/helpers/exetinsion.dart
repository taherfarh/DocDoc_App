import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushnamed(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushRepleacmentNamed(String routeName, {Object? argument}) {
    return Navigator.of(this).popAndPushNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushNamedAndRemoveUntill(
    String routeName, {
    Object? argument,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: argument);
  }

  void pob() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}