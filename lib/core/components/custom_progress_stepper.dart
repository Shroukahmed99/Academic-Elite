// import 'package:flutter/material.dart';
// import 'package:istibdal/core/extensions/localization_extension.dart';
// import 'package:istibdal/core/extensions/theme_extension.dart';
// import 'package:istibdal/core/utils/app_sizes.dart';
// import 'package:istibdal/core/utils/colors_manager.dart';

// class CustomProgressStepper extends StatelessWidget {
//   const CustomProgressStepper({
//     super.key,
//     required this.currentStep,
//     required this.totalSteps,
//     this.showLocalizedText = true,
//     this.showSaveDraft = false,
//     this.onSaveDraft,
//   });

//   final int currentStep;
//   final int totalSteps;
//   final bool showLocalizedText;
//   final bool showSaveDraft;
//   final VoidCallback? onSaveDraft;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Directionality(
//           textDirection: TextDirection.ltr,
//           child: Row(
//             children: [
//               if (showSaveDraft)
//                 GestureDetector(
//                   onTap: onSaveDraft,
//                   behavior: HitTestBehavior.opaque,
//                   child: Text(
//                     context.l10n.saveDraft,
//                     style: context.textTheme.displaySmall,
//                   ),
//                 ),

//               const Spacer(),

//               Text(
//                 showLocalizedText
//                     ? context.l10n.stepProgress(
//                         currentStep,
//                         totalSteps,
//                       )
//                     : '$currentStep/$totalSteps',
//                 style: context.textTheme.bodySmall,
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: AppSizes.h(8),
//         ),
//         ClipRRect(
//           borderRadius: BorderRadius.circular(
//             AppSizes.r20,
//           ),
//           child: LinearProgressIndicator(
//             value: currentStep / totalSteps,
//             minHeight: AppSizes.h(6),
//             backgroundColor: ColorsManager.stroke,
//             valueColor: const AlwaysStoppedAnimation(
//               ColorsManager.primary,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }