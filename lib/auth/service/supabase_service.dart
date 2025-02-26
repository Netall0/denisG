import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<AuthResponse> signInWithEmail(String email, String password) async {
    return await _supabaseClient.auth
        .signInWithPassword(password: password, email: email);
  }
}
