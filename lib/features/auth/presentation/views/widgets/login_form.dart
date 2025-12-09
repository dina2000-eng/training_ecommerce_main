import 'package:ecommerce/core/components/widgets/main_button.dart';
import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/widgets/app_text_field.dart';
import '../../../../../core/routes/routes.dart';
import 'navigate_text_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    Navigator.of(context).pushReplacementNamed(Routes.HomeScreen);
    // if (_formKey.currentState!.validate()) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('تم تسجيل الدخول بنجاح')),
    //   );
    // } else {
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: _emailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email مطلوب";
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return "Email غير صالح";
              }
              return null;
            },
          ),
          8.verticalSizedBox,
          AppTextField(
            controller: _passwordController,
            hintText: "Password",
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password مطلوب";
              }
              if (value.length < 6) {
                return "Password يجب أن تكون 6 أحرف على الأقل";
              }
              return null;
            },
          ),
          16.verticalSizedBox,
          NavigateTextWidget(
            title: "Forgot your password?",
            onTap: () {
              context.pushNamed(Routes.forgotPassword);
            },
          ),
          32.verticalSizedBox,
          MainButton(
            title: "LOGIN",
            onTap: _submit,
          ),
        ],
      ),
    );
  }
}
