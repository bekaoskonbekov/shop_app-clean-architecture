import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';

import '../../../../core/components/build_header.dart';
import '../../../../core/components/build_second_header.dart';
import '../../../../core/components/custom_text_button_component.dart';
import '../../../../core/components/custom_text_form_field_component.dart';
import '../../../../core/components/navigation_component.dart';
import '../../../../core/components/screen_status.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/constance.dart';
import '../../../../core/utils/token_secure_storage.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../home/presentation/screens/home_layout.dart';
import '../components/login_custom_button_component.dart';
import '../components/login_password_field_component.dart';
import '../controller/login_bloc/login_bloc.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => sl<LoginBloc>(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          state.when(
            initial: () => showLoading(),
            loading: () => showLoading(),
            success: (register) {
              TokenSecureStorage.saveSecureToken(
                register.registerData.token,
              ).then((value) {
                token = register.registerData.token;
                navigateAndFinish(context, const HomeLayout());
              });
              //print('token is:/// ${register.registerData.token}');
            },
            error: (networkExceptions) {
              showError(
                networkExceptions,
              );
            },
          );
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: AppSize.paddingAll,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BuildHeader(
                        title: LocaleKeys.signIn.tr(),
                      ),
                      Row(
                        children: [
                          BuildSecondHeader(
                            title: LocaleKeys.haveNotAccount.tr(),
                          ),
                          CustomTextButton(
                            onPressed: () {
                              navigateTo(context, SignUpScreen());
                            },
                            child: LocaleKeys.signUp.tr(),
                          ),
                        ],
                      ),
                      AppSize.sizedBox28,
                      CustomTextFormField(
                        prefixIcon: const Icon(Icons.email),
                        context: context,
                        hintText: LocaleKeys.email.tr(),
                        validator: qValidator([
                          IsRequired(LocaleKeys.emailValidator.tr()),
                          IsEmail(LocaleKeys.emailAddressFormat.tr()),
                        ]),
                        controller: emailController,
                        type: TextInputType.emailAddress,
                      ),
                      AppSize.sizedBox15,
                      LoginPasswordFieldComponent(
                        passwordController: passwordController,
                      ),
                      AppSize.sizedBox15,
                      LoginCustomButtonComponent(
                        formKey: _formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
