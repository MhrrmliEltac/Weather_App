import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_page.dart';

void main() {
    runApp(Home());
}

class Home extends StatelessWidget {
    Home({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: HomePage(),
        );
    }

}
