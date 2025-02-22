import 'package:flutter/material.dart';
import 'package:profff/auth/widget/auth_guard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://yqgxbbzdopsnogdfgqag.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlxZ3hiYnpkb3Bzbm9nZGZncWFnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk5NzcxMjYsImV4cCI6MjA1NTU1MzEyNn0.TIZ271LKR06yRr594wr976f_kEU0fJoHGY-PYDdOC4w',
  );

  runApp(MaterialApp(home: AuthGuard()));
}
