import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';
import '../../services/home_services.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeServices homeServices;

  HomeCubit(this.homeServices) : super(HomeInitial());

  Future<void> getHomeData() async {
    emit(HomeLoading());

    try {
      final products = await homeServices.getProducts();

      emit(
        HomeSuccess(
          salesProducts: products,
          newProducts: products,
        ),
      );
    } catch (e) {
      emit(HomeFailed(e.toString()));
    }
  }

}
