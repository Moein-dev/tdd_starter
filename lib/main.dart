import 'package:flutter/material.dart';
import 'package:tdd_starter/app.dart';
import 'package:tdd_starter/core/locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  runApp(const App());
}
