import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/core/components/custom_app_bar.dart';
import 'package:academic_elite/core/extensions/localization_extension.dart';
import 'package:academic_elite/core/extensions/navigation_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/features/onboarding/data/model/onboarding_model.dart';
import 'package:academic_elite/features/onboarding/presentation/widgets/onboarding_list.dart';
import 'package:academic_elite/features/onboarding/presentation/widgets/onboarding_navigation.dart';
import 'package:academic_elite/features/onboarding/presentation/widgets/page_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late final PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    final List<OnboardingModel> items = _getOnboardingItems(context);

    return ColoredBox(
      color: ColorsManager.primary,
      child: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: _buildContent(items),
          ),
        ],
      ),
    );
  }

  List<OnboardingModel> _getOnboardingItems(BuildContext context) {
    return [
      OnboardingModel(
        image: AssetsManager.onboarding1,
        title: context.l10n.onboardingLearnSmarterTitle,
        highlightedWord: context.l10n.onboardingLearnSmarterHighlight,
        description: context.l10n.onboardingLearnSmarterDescription,
      ),
      OnboardingModel(
        image: AssetsManager.onboarding2,
        title: context.l10n.onboardingOrganizeStudyTitle,
        highlightedWord: context.l10n.onboardingOrganizeStudyHighlight,
        description: context.l10n.onboardingOrganizeStudyDescription,
      ),
      OnboardingModel(
        image: AssetsManager.onboarding3,
        title: context.l10n.onboardingAcademicSupportTitle,
        highlightedWord: context.l10n.onboardingAcademicSupportHighlight,
        description: context.l10n.onboardingAcademicSupportDescription,
      ),
    ];
  }

 Widget _buildAppBar() {
  return SizedBox(
    height: AppSizes.h(108),
    child: CustomAppBar(
      title: '',
      showBackButton: true,
      onBackPressed: _previousPage,
    ),
  );
}

  Widget _buildContent(List<OnboardingModel> items) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.r28),
          topRight: Radius.circular(AppSizes.r28),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.r28),
          topRight: Radius.circular(AppSizes.r28),
        ),
        child: Column(
          children: [
            Expanded(
              child: OnboardingList(
                controller: _pageController,
                items: items,
                onPageChanged: _onPageChanged,
              ),
            ),
            PageIndicator(
              count: items.length,
              currentPage: _currentPage,
            ),
            SizedBox(height: AppSizes.h(28)),
            OnboardingNavigation(
              onNext: () => _nextPage(items),
              onSkip: _skip,
            ),
            SizedBox(height: AppSizes.h(30)),
          ],
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage(List<OnboardingModel> items) {
    if (_currentPage == items.length - 1) {
      _navigateToLogin();
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    if (_currentPage == 0) {
      return;
    }

    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _skip() {
    _navigateToLogin();
  }

  void _navigateToLogin() {
    context.pushNamedAndRemoveUntil(
      AppRoutes.login,
    );
  }
}