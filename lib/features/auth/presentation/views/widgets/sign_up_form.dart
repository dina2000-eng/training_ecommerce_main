import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/widgets/app_text_field.dart';
import '../../../../../core/components/widgets/main_button.dart';
import '../../../../../core/routes/routes.dart';
import 'navigate_text_widget.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // إذا كل شيء صحيح
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم التسجيل بنجاح')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: _nameController,
            hintText: "Name",
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) return "Name مطلوب";
              return null;
            },
          ),
          8.verticalSizedBox,
          AppTextField(
            controller: _emailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) return "Email مطلوب";
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) return "Email غير صالح";
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
              if (value == null || value.isEmpty) return "Password مطلوب";
              if (value.length < 6)
                return "Password يجب أن تكون 6 أحرف على الأقل";
              return null;
            },
          ),
          16.verticalSizedBox,
          NavigateTextWidget(
            title: "Already have an account?",
            onTap: () {
              context.pushNamed(Routes.login);
            },
          ),
          32.verticalSizedBox,
          MainButton(title: "SIGN UP", onTap: _submit),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
