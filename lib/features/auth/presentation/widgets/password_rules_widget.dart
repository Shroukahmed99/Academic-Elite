// import 'package:flutter/material.dart';
// import 'package:istibdal/core/extensions/localization_extension.dart';
// import 'package:istibdal/core/utils/app_sizes.dart';
// import 'package:istibdal/core/validators/validation_helper.dart';
// import 'package:istibdal/features/auth/presentation/widgets/password_rule_item.dart';

// class PasswordRulesWidget extends StatelessWidget {
//   const PasswordRulesWidget({
//     super.key,
//     required this.password,
//     required this.confirmPassword,
//   });

//   final String password;
//   final String confirmPassword;

//   @override
//   Widget build(BuildContext context) {

//     return Column(
//       children: [
//         PasswordRuleItem(
//           text: context.l10n.passwordRuleLength,
//           isValid: ValidationHelper.hasMinLength(
//             password,
//           ),
//         ),

//         SizedBox(
//           height: AppSizes.h(8),
//         ),

//         PasswordRuleItem(
//           text: context.l10n.passwordRuleLetters,
//           isValid:
//               ValidationHelper.hasUpperCase(
//                 password,
//               ) &&
//               ValidationHelper.hasLowerCase(
//                 password,
//               ),
//         ),

//         SizedBox(
//           height: AppSizes.h(8),
//         ),

//         PasswordRuleItem(
//           text: context.l10n.passwordRuleNumber,
//           isValid: ValidationHelper.hasNumber(
//             password,
//           ),
//         ),

//         SizedBox(
//           height: AppSizes.h(8),
//         ),

//         PasswordRuleItem(
//           text: context.l10n.passwordRuleSpecial,
//           isValid:
//               ValidationHelper.hasSpecialCharacter(
//             password,
//           ),
//         ),

//         SizedBox(
//           height: AppSizes.h(8),
//         ),

//         PasswordRuleItem(
//           text: context.l10n.passwordRuleMatch,
//           isValid:
//               password.isNotEmpty &&
//               password == confirmPassword,
//         ),
//       ],
//     );
//   }
// }