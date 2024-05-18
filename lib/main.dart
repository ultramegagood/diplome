import 'package:diplome/screens/home_screen.dart';
import 'package:diplome/screens/login.dart';
import 'package:diplome/screens/register.dart';
import 'package:diplome/screens/pdf_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      themeMode: ThemeMode.light,
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60)))),
      darkTheme: ThemeData(
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60)))),
      routerConfig: routes,
    );
  }
}

GoRouter routes = GoRouter(
  initialLocation: '/auth',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: "/auth",
        builder: (context, state) => AuthScreen(),
        redirect: (context, state) {
          if (FirebaseAuth.instance.currentUser != null) {
            return "/";
          }
        }),
    GoRoute(
      path: "/",
      builder: (context, state) => UploadDocumentScreen(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: "/pdf",
      builder: (context, state) => PDFViewerScreen(
        pdfUrl: state.extra as Map<String, dynamic>,
      ),
    ),
  ],
);
