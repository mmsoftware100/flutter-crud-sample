import 'dart:io';


import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

Future<String> fixture(String fileName) async {
  return await rootBundle.loadString('assets/fixtures/$fileName');
}

