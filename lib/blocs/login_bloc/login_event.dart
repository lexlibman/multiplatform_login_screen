part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.request({
    required String login,
    required String password,
  }) = LoginEventRequest;
}
