import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/core/components/custom_app_bar.dart';
import 'package:academic_elite/core/components/custom_button.dart';
import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/extensions/localization_extension.dart';
import 'package:academic_elite/core/extensions/navigation_extension.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/core/utils/strings_manager.dart';
import 'package:academic_elite/features/language/presentation/manager/language/language_cubit.dart';
import 'package:academic_elite/features/language/presentation/manager/language/language_state.dart';
import 'package:academic_elite/features/language/presentation/widgets/language_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageBody extends StatelessWidget {
  const LanguageBody({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Container(
          color: ColorsManager.primary,
          child: Column(
            children: [
              const CustomAppBar(title: '', showBackButton: false),

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.w(16)),
                    child: Column(
                      children: [
                        SizedBox(height: AppSizes.h(28)),

                        _buildLogo(),

                        SizedBox(height: AppSizes.h(24)),

                        _buildTitle(context),

                        SizedBox(height: AppSizes.h(8)),

                        _buildDescription(context),

                        SizedBox(height: AppSizes.h(20)),

                        _buildLanguageCards(context, state),

                        const Spacer(),

                        _buildContinueButton(context, state),

                        SizedBox(height: AppSizes.h(30)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      width: AppSizes.w(90),
      height: AppSizes.h(120),
      child: Image.asset(AssetsManager.logoPng, fit: BoxFit.contain),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final TextStyle titleStyle = context.textTheme.headlineSmall!;

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '${context.l10n.chooseLanguageStart} ',
            style: titleStyle,
          ),
          TextSpan(
            text: '${context.l10n.chooseLanguageMiddle} ',
            style: titleStyle.copyWith(color: ColorsManager.secondary),
          ),
          TextSpan(text: context.l10n.chooseLanguageEnd, style: titleStyle),
        ],
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return CustomText(
      text: context.l10n.changeLanguageLater,
      textAlign: TextAlign.center,
      style: context.textTheme.bodyMedium!,
    );
  }

  Widget _buildLanguageCards(BuildContext context, LanguageState state) {
    return Column(
      children: [
        LanguageCard(
          title: StringsManager.arabicLanguage,
          flag: '🇯🇴',
          selected: state.selectedLanguage == 'ar',
          onTap: () => _selectLanguage(context, 'ar'),
        ),

        SizedBox(height: AppSizes.h(12)),

        LanguageCard(
          title: StringsManager.englishLanguage,
          flag: '🇬🇧',
          selected: state.selectedLanguage == 'en',
          onTap: () => _selectLanguage(context, 'en'),
        ),
      ],
    );
  }

  Future<void> _selectLanguage(
    BuildContext context,
    String languageCode,
  ) async {
    final cubit = context.read<LanguageCubit>();

    cubit.selectLanguage(languageCode);

    await cubit.saveLanguage();
  }

  Widget _buildContinueButton(BuildContext context, LanguageState state) {
    return CustomButton(
      text: context.l10n.continueText,
      onPressed: () {
        context.pushNamedAndRemoveUntil(AppRoutes.onboardingView);
      },
      textStyle: context.textTheme.titleMedium!.copyWith(color: Colors.white),
      suffixIcon: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
