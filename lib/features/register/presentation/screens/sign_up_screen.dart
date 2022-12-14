import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:shop_app_clean_architecture/features/register/presentation/components/sign_up_custom_button_component.dart';

import '../../../../core/components/build_header.dart';
import '../../../../core/components/build_second_header.dart';
import '../../../../core/components/custom_text_button_component.dart';
import '../../../../core/components/custom_text_form_field_component.dart';
import '../../../../core/components/navigation_component.dart';
import '../../../../core/components/screen_status.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../generated/locale_keys.g.dart';
import '../components/sign_up_password_field_component.dart';
import '../controller/register_bloc/register_bloc.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => sl<RegisterBloc>(),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          state.when(
            initial: () => showLoading(),
            loading: () => showLoading(),
            success: () => navigateTo(context, LoginScreen()),
            error: (networkExceptions) => showError(networkExceptions),
          );
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: AppSize.paddingAll,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildHeader(
                          title: LocaleKeys.signUp.tr(),
                        ),
                        Row(
                          children: [
                            BuildSecondHeader(
                              title: LocaleKeys.haveAccount.tr(),
                            ),
                            CustomTextButton(
                              onPressed: () {
                                navigateTo(context, LoginScreen());
                              },
                              child: LocaleKeys.signIn.tr(),
                            ),
                          ],
                        ),
                        AppSize.sizedBox28,
                        CustomTextFormField(
                          prefixIcon: const Icon(Icons.person),
                          context: context,
                          hintText: LocaleKeys.fullName.tr(),
                          validator: qValidator([
                            IsRequired(LocaleKeys.requiredField.tr()),
                          ]),
                          controller: fullNameController,
                          type: TextInputType.name,
                        ),
                        AppSize.sizedBox15,
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
                        SignUpPasswordFieldComponent(
                          passwordController: passwordController,
                        ),
                        AppSize.sizedBox15,
                        CustomTextFormField(
                          prefixIcon: const Icon(Icons.phone),
                          context: context,
                          hintText: LocaleKeys.phone.tr(),
                          validator: qValidator([
                            // IsRequired(LocaleKeys.requiredField.tr()),
                            // IsEgyptianPhone(LocaleKeys.isPhoneNumber.tr()),
                          ]),
                          controller: phoneController,
                          type: TextInputType.phone,
                        ),
                        AppSize.sizedBox15,
                        SignUpCustomButtonComponent(
                          formKey: _formKey,
                          emailController: emailController,
                          fullNameController: fullNameController,
                          passwordController: passwordController,
                          phoneController: phoneController,
                        ),
                      ],
                    ),
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
