import 'package:avatar_glow/avatar_glow.dart';
import 'package:cosmic/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    // Adding a delay before navigating to the next page

    Future.delayed(const Duration(milliseconds: 1700), () {
      Navigator.pushReplacementNamed(context, 'login');
    });

    return Scaffold(
      body: Container(
          height: GlobalVariables.sizeHeight(context),
          width: GlobalVariables.sizeWidth(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/Cosmic Background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AvatarGlow(
                  endRadius: 160,
                  animate: true,
                  repeatPauseDuration: const Duration(milliseconds: 1600),
                  duration: const Duration(milliseconds: 600),
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(
                        side: BorderSide(
                            width: 1, color: Colors.white.withOpacity(0.1)),
                      ),
                    ),
                    child: Image.asset(
                      'lib/assets/Cosmic logo.png',
                    ),
                  ),
                ),
                CircularPercentIndicator(
                  radius: 160,
                  percent: 0.78,
                  lineWidth: 8,
                  progressColor: Colors.white.withOpacity(0.5),
                  backgroundColor: Colors.transparent,
                  circularStrokeCap: CircularStrokeCap.round,
                )
              ],
            ),
          )),
    );
  }
}
