import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:multiplatform_login_screen/bloc/login_bloc.dart';

import 'main_button.dart';
import 'custom_text_field.dart';
import 'login_social_button.dart';

class LoginCard extends StatelessWidget {
  LoginCard({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  final TextEditingController _emailFieldController = TextEditingController();

  final _emailFormKey = GlobalKey<FormState>();

  final TextEditingController _passwordFieldController =
      TextEditingController();

  final _passwordFormKey = GlobalKey<FormState>();

  void submitForm(BuildContext context) {
    if (_emailFormKey.currentState!.validate() &&
        _passwordFormKey.currentState!.validate()) {
      context.read<LoginBloc>().add(LoginEvent.request(
          login: _emailFieldController.text,
          password: _passwordFieldController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                color: Colors.white70,
              ),
              child: loginBloc.state is LoginStateLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : loginBloc.state is LoginStateSuccess
                      ? const Center(
                          child: Icon(
                            Icons.check_circle_rounded,
                            color: Colors.green,
                            size: 150,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Вход",
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              Text(
                                "Введите данные, чтобы войти в личный кабинет.",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              loginBloc.state is LoginStateError
                                  ? Text(
                                      "Проверьте правильность введенных данных.",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error,
                                          ),
                                    )
                                  : const SizedBox(),
                              Form(
                                key: _emailFormKey,
                                child: CustomTextField(
                                  label: 'E-mail',
                                  isObscure: false,
                                  textInputAction: TextInputAction.next,
                                  controller: _emailFieldController,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                        errorText: "Поле не может быть пустым"),
                                    FormBuilderValidators.email(
                                        errorText:
                                            "Пожалуйста, введите правильный e-mail"),
                                  ]),
                                ),
                              ),
                              Form(
                                key: _passwordFormKey,
                                child: CustomTextField(
                                  label: "Пароль",
                                  isObscure: true,
                                  textInputAction: TextInputAction.done,
                                  controller: _passwordFieldController,
                                  validator: FormBuilderValidators.required(
                                      errorText: "Поле не может быть пустым"),
                                ),
                              ),
                              Text(
                                "Забыли пароль?",
                                textAlign: TextAlign.end,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              BigButton(
                                title: "Войти",
                                onTap: () {
                                  submitForm(context);
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width / 7,
                                    height: 1,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                  ),
                                  Text("Или войдите с помощью:",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(fontSize: width / 25)),
                                  Container(
                                    width: width / 7,
                                    height: 1,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LoginSocialButton(
                                    imageAsset: 'assets/images/yandex_logo.png',
                                    size: width / 13,
                                  ),
                                  SizedBox(width: width / 22),
                                  LoginSocialButton(
                                    imageAsset: 'assets/images/google_logo.png',
                                    size: width / 13,
                                  ),
                                  SizedBox(width: width / 22),
                                  LoginSocialButton(
                                    imageAsset: 'assets/images/vk_logo.png',
                                    size: width / 13,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Ещё нет акаунта?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(fontSize: width / 25),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Зарегистрируйтесь",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(fontSize: width / 25),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
            ),
          ),
        );
      },
    );
  }
}
