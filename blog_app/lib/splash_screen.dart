import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final int duration;
  final String navigateTo;
  const SplashScreen({
    super.key,
    required this.duration,
    required this.navigateTo,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    homeScreenNavigator();
    super.initState();
  }

  void homeScreenNavigator() {
    Timer(Duration(seconds: widget.duration + 2), () {
      Navigator.of(context).pushReplacementNamed(widget.navigateTo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.fill),
        ),
        child: Hero(
          tag: "Title",
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Serenade",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
              Text(
                "Sphere",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
