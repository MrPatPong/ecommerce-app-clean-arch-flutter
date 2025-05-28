// import 'package:ecommerce_appclean_arch_flutter/core/constants/usecase/usecase.dart';
// import 'package:ecommerce_appclean_arch_flutter/features/auth/presentation/cubit/auth_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(LoginLoading());

//    Future<void> login({dynamic params, required Usecase usecase}) async {
//     emit(ButtonStateLoading());
//     try {
//       Either returnedData = await usecase.call(params);

//       returnedData.fold((error) {
//         emit(ButtonStateFailure(error));
//       }, (data) {
//         emit(ButtonStateSuccess(message: data.toString()));
//       });
//     } catch (e) {
//       emit(ButtonStateFailure(e.toString()));
//     }
//   }
// }