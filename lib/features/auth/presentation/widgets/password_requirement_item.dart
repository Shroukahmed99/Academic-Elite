// import 'package:flutter/material.dart';
// import 'package:istibdal/core/components/custom_text.dart';
// import 'package:istibdal/core/extensions/theme_extension.dart';
// import 'package:istibdal/core/utils/app_sizes.dart';
// import 'package:istibdal/core/utils/icons_manager.dart';


// class PasswordRequirementItem extends StatelessWidget {
//   const PasswordRequirementItem({
//     super.key,
//     required this.text,
//     required this.isValid,
//   });

//   final String text;
//   final bool isValid;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(
//           isValid
//               ? Icons.check_circle
//               : Icons.radio_button_unchecked,
//           size: IconsManager.medium20,
//           color: isValid
//               ? context.colorScheme.secondary
//               : context.theme.dividerColor,
//         ),

//         SizedBox(
//           width: AppSizes.p8,
//         ),

//         Expanded(
//           child: CustomText(
//             text: text,
//             style: context.textTheme.bodyMedium,
//           ),
//         ),
//       ],
//     );
//   }
// }