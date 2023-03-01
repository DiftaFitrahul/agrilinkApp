import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gdsc_project/page/registerPage/letus.dart';
import 'package:gdsc_project/page/registerPage/silderIntro_page.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen>
    with TickerProviderStateMixin {
  bool size = false;
  bool start = false;
  bool ready = false;
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 1))
        ..forward().then((value) {
          setState(() {
            size = true;
            start = true;
          });
        });
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  late final AnimationController _controller2 = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 3600))
    ..forward();
  late final Animation<double> _animation2 =
      CurvedAnimation(parent: _controller2, curve: Curves.easeIn);

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      setState(() {
        ready = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ready
          ? Stack(children: [
              start
                  ? FadeTransition(
                      opacity: _animation2,
                      child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: SliderIntroPage()))
                  : const Center(
                      child: SizedBox(
                        height: 600,
                        width: 400,
                      ),
                    ),
              Center(
                child: FadeTransition(
                  opacity: _animation,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1800),
                    alignment: Alignment(0, size ? -9.5 : 0),
                    width: size ? 140 : 170,
                    height: size ? 140 : 170,
                    child: const Image(
                        image: AssetImage('assets/images/logo-2.png')),
                  ),
                ),
              ),
              FadeTransition(
                opacity: _animation2,
                child: Align(
                  alignment: const Alignment(0, 0.85),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const Register()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text('Skip', style: TextStyle(color: Colors.white)),
                          Icon(Icons.arrow_forward, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ])
          : const SizedBox(),
    );
  }
}

//Image(image: AssetImage('assets/images/logo-2.png')