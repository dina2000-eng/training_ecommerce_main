import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../controllers/auth_controller.dart';
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
  bool _isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      await userCredential.user?.updateDisplayName(_nameController.text.trim());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم التسجيل بنجاح')),
        );
        context.pushNamed(Routes.homeScreen);
      }
    } on FirebaseAuthException catch (e) {
      String message = 'حدث خطأ ما';
      if (e.code == 'email-already-in-use') {
        message = 'البريد الإلكتروني مستخدم مسبقًا';
      } else if (e.code == 'weak-password') {
        message = 'كلمة المرور ضعيفة';
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: _nameController,
            hintText: "Name",
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            //onChanged: authController.updateName,
            validator: (value) {
              if (value == null || value.isEmpty) return "Name مطلوب";
              if (value.length < 3) return "الاسم قصير جدًا";
              return null;
            },
          ),
          8.verticalSizedBox,
          AppTextField(
            controller: _emailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onChanged: authController.updateEmail,
            validator: (value) {
              if (value == null || value.isEmpty) return "Email مطلوب";
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return "Email غير صالح";
              return null;
            },
          ),
          8.verticalSizedBox,
          AppTextField(
            controller: _passwordController,
            hintText: "Password",
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            onChanged: authController.updatePassword,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) return "Password مطلوب";
              if (value.length < 6) return "كلمة المرور قصيرة";
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
          MainButton(
            title: _isLoading ? "جارٍ التسجيل..." : "SIGN UP",
            onTap: _isLoading ? null : _submit,
          ),
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
