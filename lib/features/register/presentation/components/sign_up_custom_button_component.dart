import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom_button_component.dart';
import '../../../../core/components/screen_status.dart';
import '../../../../generated/locale_keys.g.dart';
import '../controller/register_bloc/register_bloc.dart';

class SignUpCustomButtonComponent extends StatelessWidget {
  const SignUpCustomButtonComponent({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.fullNameController,
    required this.passwordController,
    required this.phoneController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController fullNameController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        //print('Sign Up Screen $state');
        if (state is RegisterLoadingState) {
          return showLoading();
        }

        return CustomButton(
          title: LocaleKeys.signUp.tr(),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              FocusScope.of(context).unfocus();
              context.read<RegisterBloc>().add(
                    UserSignUpEvent(
                      emailController.text,
                      fullNameController.text,
                      passwordController.text,
                      phoneController.text,
                    ),
                  );
            }
          },
        );
      },
    );
  }
}
