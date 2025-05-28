
abstract class ButtonState {}

class ButtonStateInitial extends ButtonState {}

class ButtonStateLoading extends ButtonState {}

class ButtonStateSuccess extends ButtonState {
  final String? message;
  ButtonStateSuccess({this.message});
}

class ButtonStateFailure extends ButtonState {
  final String error;

  ButtonStateFailure(this.error);
}

