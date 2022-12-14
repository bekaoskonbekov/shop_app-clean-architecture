import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:shop_app_clean_architecture/features/register/presentation/controller/cubit/password_visibility_cubit.dart';
import 'package:shop_app_clean_architecture/features/register/presentation/controller/register_bloc/register_bloc.dart';

import '../../../../core/components/custom_text_form_field_component.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../generated/locale_keys.g.dart';

class SignUpPasswordFieldComponent extends StatelessWidget {
  const SignUpPasswordFieldComponent({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterBloc>(),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          var cubit = PasswordVisibilityBloc.get(context);

          return CustomTextFormField(
            prefixIcon: const Icon(Icons.lock_open),
            context: context,
            hintText: LocaleKeys.password.tr(),
            validator: qValidator([
              IsRequired(LocaleKeys.passwordValidator.tr()),
              MinLength(8, LocaleKeys.passwordLengthValidator.tr()),
            ]),
            isPassword: cubit.isPasswordHidden,
            suffixIcon: cubit.suffixIcon,
            suffixPressed: () {
              cubit.passwordVisibility();
            },
            controller: passwordController,
            type: TextInputType.text,
          );
        },
      ),
    );
  }
}
