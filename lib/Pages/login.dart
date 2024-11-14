import "package:flutter/material.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import "package:tintok/main.dart";
import "package:tintok/services/auth_service.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //Image de fond
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_bg.jpg"),
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
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: const FormSignIn(),
          ),
        ),
      ),
    );
  }
}

//Widget formulaire signIn
class FormSignIn extends StatefulWidget {
  const FormSignIn({super.key});

  @override
  State<FormSignIn> createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  //Clé pour le formulaire
  final _formKey = GlobalKey<FormState>();

  final user = AuthService().user;

  //Controlleurs pour récupérer les valeurs des champs de formulaire
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            const Text(
              "Login",
              style: TextStyle(fontSize: 48, fontFamily: "josefin-sans"),
            ),
            const Padding(padding: EdgeInsets.only(top: 50)),
            /* ----------------- Email field ----------------- */
            TextFormField(
              controller: emailController,
              validator: (emailController) {
                if (emailController == null || emailController.isEmpty) {
                  return "Please enter a value";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(),
                ),
                hintText: "Email",
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            /* ----------------- Password field ----------------- */
            TextFormField(
              controller: passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              validator: (passwordController) {
                if (passwordController == null || passwordController.isEmpty) {
                  return "Please enter a value";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(),
                ),
                hintText: "Password",
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            ElevatedButton(
                onPressed: () async {
                  final AuthResponse res = await AuthService().signInNewUser(
                      passwordController.text, emailController.text);
                  if (res.session != null && res.user != null) {
                    print("Logged In");
                    print(res.user);
                    print(res.session);
                    // Récupération des données de l'utilisateur
                    final userData = {
                      'userId': res.user!.id,
                      'email': res.user!.email,
                    };
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainApp(userData: userData)));
                  } else {
                    print("Echec connexion");
                  }
                },
                child: const Text("Submit")),
          ],
        ));
  }
}
