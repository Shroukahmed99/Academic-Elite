import 'package:academic_elite/features/home/presentation/manager/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;

  void changeTab(int index) {
    currentIndex = index;
    emit(HomeChangeTabState());
  }
}