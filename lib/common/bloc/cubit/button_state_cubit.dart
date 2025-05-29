import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_appclean_arch_flutter/common/bloc/cubit/button_state_state.dart';
import 'package:ecommerce_appclean_arch_flutter/core/constants/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonStateInitial());

  Future<void> execute({dynamic params, required Usecase usecase}) async {
    emit(ButtonStateLoading());
    try {
      Either returnedData = await usecase.call(params: params);

      returnedData.fold((error) {
        emit(ButtonStateFailure(error));
      }, (data) {
        emit(ButtonStateSuccess(message: data.toString()));
      });
    } catch (e) {
      emit(ButtonStateFailure(e.toString()));
    }
  }
}
