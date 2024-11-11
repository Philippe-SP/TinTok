import "package:flutter/material.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import 'package:tintok/Pages/login.dart';
import "package:tintok/services/auth_service.dart";
import "package:tintok/services/customPageRoute.dart";

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService().user;

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
            child: const FormSignUp(),
          ),
        ),
      ),
    );
  }
}

//Widget formulaire signUp
class FormSignUp extends StatefulWidget {
  const FormSignUp({super.key});

  @override
  State<FormSignUp> createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  //Controlleurs pour récupérer les valeurs des champs de formulaire
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController profilePictureController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Text(
            "Sign Up",
            style: TextStyle(fontSize: 48, fontFamily: "josefin-sans"),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
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
          const Padding(padding: EdgeInsets.only(top: 10)),
          /* ----------------- Username field ----------------- */
          TextFormField(
            controller: usernameController,
            validator: (usernameController) {
              if (usernameController == null || usernameController.isEmpty) {
                return "Please enter a value";
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(),
              ),
              hintText: "Username",
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          /* ----------------- Password field ----------------- */
          TextFormField(
            controller: passwordController,
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
          const Padding(padding: EdgeInsets.only(top: 10)),
          /* ----------------- Profile picture field ----------------- */
          TextFormField(
            controller: profilePictureController,
            validator: (profilePictureController) {
              if (profilePictureController == null ||
                  profilePictureController.isEmpty) {
                return "Please enter a value";
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(),
              ),
              hintText: "Profile picture link",
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          ElevatedButton(
              onPressed: () {
                //Ajout des données dans la Auth
                AuthService().signUpNewUser(
                    emailController.text, passwordController.text);
                //Ajout des données dans la bdd
                Supabase.instance.client.from('Users').insert({
                  'username': usernameController,
                  'profil_picture': profilePictureController,
                  'email': emailController,
                  'created_at': DateTime.now(),
                });
                if (AuthResponse == true) {
                  Navigator.push(
                      context, CustomPageRoute(child: const LoginPage()));
                } else {
                  const AlertDialog(
                      title: Text("Erreur lors de l'inscription"));
                }
              },
              child: const Text("Submit")),
        ],
      ),
    );
  }
}
