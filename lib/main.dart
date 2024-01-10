import 'package:flutter/material.dart';
import 'package:torrins_assignment/app.dart';
import 'package:torrins_assignment/utils/dependency_injection.dart';

void main() {
  DependencyInjection.init();
  runApp(const App());
}

