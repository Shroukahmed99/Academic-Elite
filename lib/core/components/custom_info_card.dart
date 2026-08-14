// import 'package:flutter/material.dart';
// import 'package:istibdal/core/extensions/theme_extension.dart';
// import 'package:istibdal/core/utils/app_sizes.dart';

// class CustomInfoCard extends StatelessWidget {
//   const CustomInfoCard({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.icon,
//     this.backgroundColor,
//     this.borderColor,
//     this.titleStyle,
//     this.descriptionStyle,
//   });

//   final String title;
//   final String description;

//   final Widget icon;

//   final Color? backgroundColor;
//   final Color? borderColor;

//   final TextStyle? titleStyle;
//   final TextStyle? descriptionStyle;

//   @override
//   Widget build(BuildContext context) {
//     final primary = context.theme.colorScheme.primary;

//     return Container(
//       padding: EdgeInsets.all(
//         AppSizes.p16,
//       ),
//       decoration: BoxDecoration(
//         color: backgroundColor ??
//             primary.withValues(
//               alpha: .08,
//             ),
//         borderRadius: BorderRadius.circular(
//           AppSizes.r16,
//         ),
//         border: Border.all(
//           color: borderColor ??
//               primary.withValues(
//                 alpha: .18,
//               ),
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment:
//             CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//               top: AppSizes.h(2),
//             ),
//             child: icon,
//           ),

//           SizedBox(
//             width: AppSizes.w(10),
//           ),

//           Expanded(
//             child: Column(
//               crossAxisAlignment:
//                   CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style:
//                       titleStyle ??
//                           context.textTheme.displaySmall,
//                 ),

//                 SizedBox(
//                   height: AppSizes.h(6),
//                 ),

//                 Text(
//                   description,
//                   style:
//                       descriptionStyle ??
//                           context.textTheme.bodySmall,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }