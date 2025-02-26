import 'package:flutter/material.dart';
import 'package:profff/home/widget/home_screen.dart';
import 'package:profff/auth/widget/log_in_widget.dart';
import 'package:profff/splash/widget/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (contex, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null) {
          return const SplashScreen();
        }
        return const LogInWidget();
      },
    );
  }
}
