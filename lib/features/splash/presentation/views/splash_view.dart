import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/core/extensions/navigation_extension.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/features/splash/presentation/widgets/splash_app_name.dart';
import 'package:academic_elite/features/splash/presentation/widgets/splash_background.dart';
import 'package:academic_elite/features/splash/presentation/widgets/splash_developer_section.dart';
import 'package:academic_elite/features/splash/presentation/widgets/splash_loading_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _progressAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.addStatusListener(_handleAnimationStatus);
    _controller.forward();
  }

  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _goToNextScreen();
    }
  }

  void _goToNextScreen() {
    if (!mounted) {
      return;
    }

    context.pushReplacementNamed(AppRoutes.language);
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_handleAnimationStatus);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: ColorsManager.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SplashViewBody(
          progressAnimation: _progressAnimation,
        ),
      ),
    );
  }
}

class SplashViewBody extends StatelessWidget {
  final Animation<double> progressAnimation;

  const SplashViewBody({
    super.key,
    required this.progressAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const SplashBackground(),
        const SplashAppName(),
        SplashLoadingSection(
          progressAnimation: progressAnimation,
        ),
        const SplashDeveloperSection(),
      ],
    );
  }
}