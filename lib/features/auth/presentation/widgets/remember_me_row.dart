// import 'package:flutter/material.dart';
// import 'package:istibdal/core/components/custom_text.dart';
// import 'package:istibdal/core/extensions/localization_extension.dart';
// import 'package:istibdal/core/extensions/theme_extension.dart';

// class RememberMeRow extends StatelessWidget {
//   const RememberMeRow({
//     super.key,
//     required this.rememberMe,
//     required this.onRememberChanged,
//     required this.onForgotPassword,
//   });

//   final bool rememberMe;
//   final ValueChanged<bool> onRememberChanged;
//   final VoidCallback onForgotPassword;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Checkbox(
//           value: rememberMe,
//           onChanged: (value) {
//             onRememberChanged(
//               value ?? false,
//             );
//           },
//         ),

//         CustomText(
//           text: context.l10n.rememberMe,
//           style: context.textTheme.bodyMedium,
//         ),

//         const Spacer(),

//         TextButton(
//           onPressed: onForgotPassword,
//           child: CustomText(
//             text: context.l10n.forgotPassword,
//             style: context.textTheme.titleMedium,
//           ),
//         ),
//       ],
//     );
//   }
// }