import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multiplatform_login_screen/exceptions/form_exception.dart';
import 'package:multiplatform_login_screen/services/auth_service.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial()) {
    on<LoginEventRequest>((event, emit) async {
      emit(const LoginState.loading());

      try {
        await AuthService.login(login: event.login, password: event.password);
        emit(const LoginState.success());
      } on FormGeneralException catch (e) {
        emit(LoginState.error(e));
      } on FormFieldsException catch (e) {
        emit(LoginState.error(e));
      } catch (e) {
        emit(LoginState.error(
          FormGeneralException(message: "Неизвестная ошибка"),
        ));
      }
    });
  }
}
