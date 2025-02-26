import 'package:flutter/material.dart';
import 'package:profff/auth/widget/auth_guard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://iwfxddfsqdzvaegjpoec.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml3ZnhkZGZzcWR6dmFlZ2pwb2VjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzgyNTEyMzAsImV4cCI6MjA1MzgyNzIzMH0.GmW1_4hTCAF5t_a9lLA0eKOM1lKnf-j9SACd0GI4o-Y',
  );

  runApp(MaterialApp(home: AuthGuard()));
}
