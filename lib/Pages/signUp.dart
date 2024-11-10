import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import 'package:tintok/Pages/login.dart';
import "package:tintok/services/auth_service.dart";

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService().user;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("TinTok",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 42,
                  fontFamily: "josefin-sans")),
          backgroundColor: const Color.fromARGB(255, 191, 191, 191),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            //En-tete du menu burger
            DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(182, 61, 61, 61)),
                child: Text("Drawer Header",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontFamily: "josefin-sans"))),
            //Page home
            ListTile(
                title: Row(children: [
              Icon(Icons.home, color: CupertinoColors.black),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("Home",
                  style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
            ])),
            //Page N°2
            ListTile(
                title: Row(children: [
              Icon(Icons.calendar_month, color: CupertinoColors.black),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("Page 2",
                  style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
            ])),
            //Page N°3
            ListTile(
                title: Row(children: [
              Icon(Icons.list, color: CupertinoColors.black),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("Page 3",
                  style: TextStyle(fontSize: 24, fontFamily: "josefin-sans"))
            ])),
          ],
        )),
        body: SafeArea(
          //Image de fond
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_second.jpg"),
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
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black, size: 35),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.comment, color: Colors.black, size: 35),
                label: 'Comments'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black, size: 35),
              label: 'Profile',
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 191, 191, 191),
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
          const Padding(padding: EdgeInsets.only(top: 10)),
          const Text(
            "Sign Up",
            style: TextStyle(fontSize: 48, fontFamily: "josefin-sans"),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
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
          const Padding(padding: EdgeInsets.only(top: 20)),
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
          const Padding(padding: EdgeInsets.only(top: 20)),
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
          const Padding(padding: EdgeInsets.only(top: 20)),
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
          const Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    } else {
                      const AlertDialog(
                          title: Text("Erreur lors de l'inscription"));
                    }
                  },
                  child: const Text("Submit")),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.grey[400]!)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: const Text("Sign In")),
            ],
          ),
        ],
      ),
    );
  }
}
