// import 'package:flutter/material.dart';
// import 'package:istibdal/core/extensions/localization_extension.dart';
// import 'package:istibdal/core/extensions/theme_extension.dart';

// class TermsCheckboxWidget extends StatelessWidget {
//   const TermsCheckboxWidget({
//     super.key,
//     required this.value,
//     required this.onChanged,
//   });

//   final bool value;
//   final ValueChanged<bool?> onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Checkbox(
//           value: value,
//           onChanged: onChanged,
//         ),

//         Expanded(
//           child: RichText(
//             text: TextSpan(
//               style: context.textTheme.bodyMedium,
//               children: [
//                 TextSpan(
//                   text:
//                       '${context.l10n.agreeToTermsPrefix} ',
//                 ),
//                 TextSpan(
//                   text:
//                       context.l10n.termsAndPrivacy,
//                   style:
//                       context.textTheme.titleMedium,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }