// import 'package:academic_elite/core/extensions/theme_extension.dart';
// import 'package:academic_elite/core/utils/app_sizes.dart';
// import 'package:academic_elite/core/utils/assets_manager.dart';
// import 'package:academic_elite/core/utils/colors_manager.dart';
// import 'package:academic_elite/core/utils/icons_manager.dart';
// import 'package:flutter/material.dart';

// class CustomBottomNavBar extends StatelessWidget {
//   const CustomBottomNavBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });

//   final int currentIndex;
//   final ValueChanged<int> onTap;

//   @override
//   Widget build(BuildContext context) {
//     AppSizes.init(context);

//     final l10n = AppLocalizations.of(context)!;

//     return BottomAppBar(
//       color: ColorsManager.white,
//       elevation: 15,
//       shape: const CircularNotchedRectangle(),
//       notchMargin: AppSizes.p8,
//       child: SizedBox(
//         height: 80,
//         child: Row(
//           children: [
//             _item(
//               context: context,
//               index: 0,
//               asset: AssetsManager.home,
//               title: l10n.home,
//             ),

//             _item(
//               context: context,
//               index: 1,
//               asset: AssetsManager.offers,
//               title: l10n.offers,
//             ),

//             const Spacer(),

//             _item(
//               context: context,
//               index: 3,
//               asset: AssetsManager.wallet,
//               title: l10n.wallet,
//             ),

//             _item(
//               context: context,
//               index: 4,
//               asset: AssetsManager.profile,
//               title: l10n.profile,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _item({
//     required BuildContext context,
//     required int index,
//     required String asset,
//     required String title,
//   }) {
//     final bool selected = currentIndex == index;

//     return Expanded(
//       child: InkWell(
//         borderRadius: BorderRadius.circular(AppSizes.r12),
//         onTap: () => onTap(index),
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: AppSizes.p4),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ImageIcon(
//                 AssetImage(asset),
//                 size: IconsManager.medium20,
//                 color: selected ? ColorsManager.primary : ColorsManager.gray,
//               ),

//               SizedBox(height: AppSizes.p4),

//               Flexible(
//                 child: Text(
//                   title,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context).textTheme.labelSmall?.copyWith(
//                     color: selected
//                         ? ColorsManager.primary
//                         : ColorsManager.gray,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
