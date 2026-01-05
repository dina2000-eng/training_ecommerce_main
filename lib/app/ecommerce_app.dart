import 'package:flutter/material.dart';
import '../core/routes/app_router.dart';
import '../core/routes/routes.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Metropolis",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.login,
    );
  }
}
