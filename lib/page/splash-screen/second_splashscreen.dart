import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen>
    with TickerProviderStateMixin {
  bool size = false;
  bool start = false;
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..forward().then((value) {
          setState(() {
            size = true;
            start = true;
          });
        });
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  late final AnimationController _controller2 =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..forward();
  late final Animation<double> _animation2 =
      CurvedAnimation(parent: _controller2, curve: Curves.easeIn);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        start
            ? Center(
                child: FadeTransition(
                  opacity: _animation2,
                  child: const Image(
                      width: 400,
                      height: 400,
                      image: AssetImage('assets/images/monitoring.png')),
                ),
              )
            : const SizedBox(
                height: 200,
                width: 200,
              ),
        Center(
          child: FadeTransition(
            opacity: _animation,
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              alignment: Alignment(0, size ? -10 : 0),
              width: size ? 120 : 170,
              height: size ? 120 : 170,
              child: const Image(image: AssetImage('assets/images/logo-2.png')),
            ),
          ),
        ),
      ]),
    );
  }
}

//Image(image: AssetImage('assets/images/logo-2.png')