import 'package:flutter/material.dart';
import 'package:profff/auth/widget/auth_guard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: '',
    anonKey:
        '',
  );

  runApp(MaterialApp(home: AuthGuard()));
}
