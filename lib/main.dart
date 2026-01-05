import 'package:ecommerce/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_controller.dart';
import 'app/ecommerce_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthBase>(
          create: (_) => Auth(),
        ),
        ChangeNotifierProvider<AuthController>(
          create: (context) => AuthController(
            auth: context.read<AuthBase>(),
          ),
        ),
      ],
      child: const EcommerceApp(),
    ),
  );
}
