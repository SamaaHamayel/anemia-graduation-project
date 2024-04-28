import 'package:animeacheck/core/api/endPoints/end_point.dart';
import 'package:animeacheck/core/cache_helper/cache_helper.dart';
import 'package:animeacheck/features/home/presentation/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../onboarding/presentation/view/onboarding1.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


FlutterTts flutterTts = FlutterTts();

late AnimationController _opacityController;
late final Animation<double> _opacityAnimation;

late AnimationController _scaleController;
late final Animation<double> _scaleAnimation;

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _initTts();
    ttsDelayed();
    initScalingAnimation();
    initOpacityAnimation();
    navigateToHome();
  }

  Future<void> ttsDelayed() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        flutterTts.speak(AppLocalizations.of(context)!.eyeNemia);
      },
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  void _initTts() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.50);
    await flutterTts.setVolume(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _scaleAnimation,
            child:
                Image.asset('lib/core/utils/appImages/images/splash.png'),
          ),
          const SizedBox(height: 10),
          FadeTransition(
            opacity: _opacityAnimation,

            // child: Text(
            //   'Anadoc',
            //   style: GoogleFonts.kodchasan(
            //     color: Colors.white,
            //     fontSize: 63,
            //     fontWeight: FontWeight.w400,
            //     fontStyle: FontStyle.normal,
            //   ),
            // ),

          ),
        ],
      ),
    );
  }


  void initOpacityAnimation() {
    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    Tween<double> opacityTween = Tween<double>(begin: 0.0, end: 1.0);
    _opacityAnimation = opacityTween.animate(_opacityController);
    _opacityController.forward();
  }


  void initScalingAnimation() {
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.fastOutSlowIn,
    );
    _scaleController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 4),
      ()  async {
        await sl<CacheHelper>().getData(key: ApiKeys.token)==null
        ?Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ),
        ):Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
  }
}
