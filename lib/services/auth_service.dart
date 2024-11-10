import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supaAuth = Supabase.instance.client.auth;

  User? get user => supaAuth.currentUser;

  //signIn function
  Future<AuthResponse> signInNewUser(
    String password,
    String email,
  ) async {
    final AuthResponse res =
        await supaAuth.signInWithPassword(password: password, email: email);
    final Session? session = res.session;
    final User? user = res.user;
    return res;
  }

  //signUp function
  Future<void> signUpNewUser(String email, String password) async {
    final AuthResponse res =
        await supaAuth.signUp(email: email, password: password);
  }
}
