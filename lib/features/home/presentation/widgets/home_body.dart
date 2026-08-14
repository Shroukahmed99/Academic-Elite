// import 'package:academic_elite/core/utils/colors_manager.dart';
// import 'package:academic_elite/features/home/presentation/manager/home_cubit.dart';
// import 'package:academic_elite/features/home/presentation/manager/home_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeBody extends StatelessWidget {
//   const HomeBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         final cubit = context.read<HomeCubit>();

//         return Scaffold(
//           extendBody: true,

//           body: IndexedStack(
//             index: cubit.currentIndex,
//             children: const [
//               HomeTab(),
//               OffersTab(),
//               AddProductView(),
//               WalletView(),
//               ProfileTab(),
//             ],
//           ),

//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerDocked,

//           floatingActionButton: FloatingActionButton(
//             backgroundColor: ColorsManager.primary,
//             elevation: 5,
//             shape: const CircleBorder(),
//             onPressed: () => cubit.changeTab(2),
//             child: Icon(Icons.add, color: ColorsManager.white),
//           ),

//           bottomNavigationBar: CustomBottomNavBar(
//             currentIndex: cubit.currentIndex,
//             onTap: cubit.changeTab,
//           ),
//         );
//       },
//     );
//   }
// }
