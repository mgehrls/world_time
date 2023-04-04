import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/loading.dart';
import 'package:flutter_application_1/pages/choose_location.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    }));
