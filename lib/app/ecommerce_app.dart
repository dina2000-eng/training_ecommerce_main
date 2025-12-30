import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/auth/auth_cubit.dart';
import '../controllers/auth/auth_state.dart';
import '../core/routes/app_router.dart';
import '../core/routes/routes.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = AuthCubit();
        cubit.authStatus();
        return cubit;
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) =>
        current is AuthSuccess || current is AuthInitial,
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Metropolis",
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: state is AuthSuccess ? Routes.homeScreen : Routes.login,
          );
        },
      ),
    );
  }
}
