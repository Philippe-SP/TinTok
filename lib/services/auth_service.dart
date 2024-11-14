import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supaAuth = Supabase.instance.client.auth;

  User? get user => supaAuth.currentUser;

  //Récupération des données de l'utilisateur depuis la bdd
  Future<Map<String, dynamic>> GetUserFromDatabase(String userEmail) async {
    // Appel aux trois fonctions de récupération
    final _userEmail = await Supabase.instance.client
        .from('Users')
        .select('email, username, profil_picture')
        .eq('email', userEmail)
        .single();
    print(_userEmail['email']);
    print(_userEmail['username']);
    print(_userEmail['profil_picture']);

    // Retourner les données sous forme de Map
    return {
      'email': _userEmail['email'],
      'username': _userEmail['username'],
      'profil_picture': _userEmail['profil_picture'],
    };
  }

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
