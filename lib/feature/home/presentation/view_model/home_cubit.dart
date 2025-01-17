import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safall_final_mobile_app/feature/home/presentation/view_model/home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
