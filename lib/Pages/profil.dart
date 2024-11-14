import "package:flutter/material.dart";
import "package:tintok/main.dart";
import "package:tintok/services/auth_service.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.userData});

  final Map<String, dynamic> userData;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Déclaration de variables sans initialisation directe pour pouvoir utiliser widget.userData
  late String email;
  final user = AuthService().user;
  late Future<Map<String, dynamic>> _futureUserData;

  @override
  //Fonction permettant d'initialiser mes variables crée juste avant
  void initState() {
    super.initState();
    email = widget.userData['email'] ?? 'Adresse email non disponible';
    _futureUserData = AuthService()
        .GetUserFromDatabase(email); // Initialise `_future` après `email`
  }

  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: _futureUserData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final _userData = snapshot.data!;
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/profile_bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(180, 191, 191, 191),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  width: 350,
                  height: 600,
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(bottom: 40)),
                      CircleAvatar(
                        radius: 50,
                        child: Image.network(_userData['profile_picture']),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 40)),
                      Text(
                        "Nom: ${_userData['username']}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 20)),
                      Text(
                        "Email: ${_userData['email']}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 100)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainApp(
                                        userData: widget.userData,
                                      )));
                        },
                        child: const Text("Retour aux vidéos"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text("Pas de données disponibles"));
          }
        });
  }
}
