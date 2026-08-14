// import 'package:flutter/material.dart';
// import 'package:istibdal/core/components/custom_text.dart';
// import 'package:istibdal/core/extensions/localization_extension.dart';
// import 'package:istibdal/core/extensions/theme_extension.dart';
// import 'package:istibdal/core/utils/app_sizes.dart';
// import 'package:istibdal/core/utils/colors_manager.dart';
// import 'package:istibdal/core/validators/validation_helper.dart';

// class PasswordStrengthWidget extends StatelessWidget {
//   const PasswordStrengthWidget({
//     super.key,
//     required this.password,
//   });

//   final String password;

//   @override
//   Widget build(BuildContext context) {
//     AppSizes.init(context);

//     final strength =
//         ValidationHelper.getPasswordStrength(
//       password,
//     );

//     int activeBars;
//     Color color;
//     String text;

//     switch (strength) {
//       case PasswordStrength.weak:
//         activeBars = 1;
//         color = ColorsManager.error;
//         text = context.l10n.passwordWeak;
//         break;

//       case PasswordStrength.medium:
//         activeBars = 2;
//         color = ColorsManager.warning;
//         text = context.l10n.passwordMedium;
//         break;

//       case PasswordStrength.strong:
//         activeBars = 3;
//         color = ColorsManager.success;
//         text = context.l10n.passwordStrong;
//         break;
//     }

//     return Column(
//       crossAxisAlignment:
//           CrossAxisAlignment.start,
//       children: [
//         CustomText(
//           text: text,
//           style: context.textTheme.titleMedium
//               ?.copyWith(
//             color: color,
//           ),
//         ),

//         SizedBox(
//           height: AppSizes.h(8),
//         ),

//         Row(
//           children: List.generate(
//             3,
//             (index) {
//               return Expanded(
//                 child: Container(
//                   margin: EdgeInsets.symmetric(
//                     horizontal: AppSizes.p4,
//                   ),
//                   height: AppSizes.h(6),
//                   decoration: BoxDecoration(
//                     color:
//                         index < activeBars
//                             ? color
//                             : context
//                                 .theme
//                                 .dividerColor,
//                     borderRadius:
//                         BorderRadius.circular(
//                       AppSizes.r(100),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }