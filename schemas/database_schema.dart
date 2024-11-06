class Users {
  //Constructeur
  Users({
    required this.id,
    required this.username,
    required this.password,
    required this.profil_picture,
    required this.created_at,
  });

  //Affectation des types
  int id;

  String username;

  String password;

  String profil_picture;

  DateTime created_at = DateTime.now();
}
