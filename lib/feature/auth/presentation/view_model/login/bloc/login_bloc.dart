// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:safall_final_mobile_app/app/di/di.dart';
// import 'package:safall_final_mobile_app/core/common/snackbar/my_snackbar.dart';
// import 'package:safall_final_mobile_app/feature/Product/presentation/view_model/bloc/product_bloc.dart';
// import 'package:safall_final_mobile_app/feature/auth/domain/use_case/login_use_usecase.dart';
// import 'package:safall_final_mobile_app/feature/auth/presentation/view_model/registration/bloc/registration_bloc.dart';
// import 'package:safall_final_mobile_app/feature/home/presentation/view/home_view.dart';
// import 'package:safall_final_mobile_app/feature/home/presentation/view_model/home_cubit.dart';
// import 'package:safall_final_mobile_app/feature/order/presentation/view_model/bloc/order_bloc.dart';

// part 'login_event.dart';
// part 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final RegistrationBloc _registerBloc;
//   final HomeCubit _homeCubit;
//   final LoginUseCase _loginUseCase;

//   LoginBloc({
//     required RegistrationBloc registerBloc,
//     required HomeCubit homeCubit,
//     required LoginUseCase loginUseCase,
//   })  : _registerBloc = registerBloc,
//         _homeCubit = homeCubit,
//         _loginUseCase = loginUseCase,
//         super(LoginState.initial()) {
//     on<NavigateRegisterScreenEvent>(
//       (event, emit) {
//         Navigator.pushReplacement(
//           event.context,
//           MaterialPageRoute(
//             builder: (context) => MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(value: getIt<OrderBloc>()),
//                 BlocProvider.value(value: getIt<ProductBloc>()),
//                 BlocProvider.value(value: _registerBloc),
//               ],
//               child: event.destination,
//             ),
//           ),
//         );
//       },
//     );

//     on<NavigateHomeScreenEvent>(
//       (event, emit) {
//         Navigator.pushReplacement(
//           event.context,
//           MaterialPageRoute(
//             builder: (context) => BlocProvider.value(
//               value: _homeCubit,
//               child: event.destination,
//             ),
//           ),
//         );
//       },
//     );

//     on<LoginCustomerEvent>(
//       (event, emit) async {
//         emit(state.copyWith(isLoading: true));
//         final result = await _loginUseCase(
//           LoginParams(
//             username: event.username,
//             password: event.password,
//           ),
//         );

//         result.fold(
//           (failure) {
//             emit(state.copyWith(isLoading: false, isSuccess: false));
//             showMySnackBar(
//               context: event.context,
//               message: "Invalid Credentials",
//               color: Colors.red,
//             );
//           },
//           (token) {
//             emit(state.copyWith(isLoading: false, isSuccess: true));
//             add(
//               NavigateHomeScreenEvent(
//                 context: event.context,
//                 destination: const HomeView(),
//               ),
//             );
//             //_homeCubit.setToken(token);
//           },
//         );
//       },
//     );
//   }
// }
























import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safall_final_mobile_app/app/di/di.dart';
import 'package:safall_final_mobile_app/core/common/snackbar/my_snackbar.dart';
import 'package:safall_final_mobile_app/feature/Product/presentation/view_model/bloc/product_bloc.dart';
import 'package:safall_final_mobile_app/feature/auth/domain/use_case/login_use_usecase.dart';
import 'package:safall_final_mobile_app/feature/auth/presentation/view_model/registration/bloc/registration_bloc.dart';
import 'package:safall_final_mobile_app/feature/home/presentation/view/home_view.dart';
import 'package:safall_final_mobile_app/feature/home/presentation/view_model/home_cubit.dart';
import 'package:safall_final_mobile_app/feature/order/presentation/view_model/bloc/order_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegistrationBloc _registerBloc;
  final HomeCubit _homeCubit;
  final LoginUseCase _loginUseCase;

  LoginBloc({
    required RegistrationBloc registerBloc,
    required HomeCubit homeCubit,
    required LoginUseCase loginUseCase,
  })  : _registerBloc = registerBloc,
        _homeCubit = homeCubit,
        _loginUseCase = loginUseCase,
        super(LoginState.initial()) {
    on<NavigateRegisterScreenEvent>(
      (event, emit) {
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: getIt<OrderBloc>()),
                BlocProvider.value(value: getIt<ProductBloc>()),
                BlocProvider.value(value: _registerBloc),
              ],
              child: event.destination,
            ),
          ),
        );
      },
    );

    on<NavigateHomeScreenEvent>(
      (event, emit) {
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _homeCubit,
              child: event.destination,
            ),
          ),
        );
      },
    );

    on<LoginCustomerEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        final result = await _loginUseCase(
          LoginParams(
            username: event.username,
            password: event.password,
          ),
        );

        result.fold(
          (failure) {
            emit(state.copyWith(isLoading: false, isSuccess: false));
            showMySnackBar(
              context: event.context,
              message: "Invalid Credentials",
              color: Colors.red,
            );
          },
          (token) {
            emit(state.copyWith(isLoading: false, isSuccess: true));
            add(
              NavigateHomeScreenEvent(
                context: event.context,
                destination: const HomeView(),
              ),
            );
            //_homeCubit.setToken(token);
          },
        );
      },
    );
  }
}
