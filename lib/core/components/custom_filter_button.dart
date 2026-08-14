// import 'package:academic_elite/core/utils/app_sizes.dart';
// import 'package:academic_elite/core/utils/colors_manager.dart';
// import 'package:flutter/material.dart';

// class CustomFilterButton
//     extends StatelessWidget {
//   const CustomFilterButton({
//     super.key,
//     this.onTap,
//     this.icon =
//         Icons.tune_rounded,
//     this.backgroundColor,
//     this.borderColor,
//     this.iconColor,
//     this.size,
//   });

//   final VoidCallback? onTap;
//   final IconData icon;
//   final Color? backgroundColor;
//   final Color? borderColor;
//   final Color? iconColor;
//   final double? size;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius:
//           BorderRadius.circular(
//         AppSizes.r12,
//       ),
//       onTap: onTap,
//       child: Container(
//         width:
//             size ??
//             AppSizes.w48,
//         height:
//             size ??
//             AppSizes.h48,
//         decoration:
//             BoxDecoration(
//           color:
//               backgroundColor ??
//               ColorsManager.white,
//           borderRadius:
//               BorderRadius.circular(
//             AppSizes.r12,
//           ),
//           border: Border.all(
//             color:
//                 borderColor ??
//                 ColorsManager.stroke,
//           ),
//         ),
//         alignment:
//             Alignment.center,
//         child: Icon(
//           icon,
//           color:
//               iconColor ??
//               ColorsManager.gray,
//         ),
//       ),
//     );
//   }
// }