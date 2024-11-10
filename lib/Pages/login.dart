import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import 'package:tintok/Pages/SignUp.dart';
import "package:tintok/main.dart";
import "package:tintok/services/auth_service.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: const FormSignIn(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final AuthResponse res = await AuthService().signInNewUser(
                        passwordController.text, emailController.text);
                    if (res.session != null && res.user != null) {
                      print("Logged In");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainApp()));
                    } else {
                      print("Echec connexion");
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
                            builder: (context) => const SignUpPage()));
                  },
                  child: Text("Sign Up")),
            ],
          )
        ],
      ),
    );
  }
}
