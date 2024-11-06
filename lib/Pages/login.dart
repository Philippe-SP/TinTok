import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Login",
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
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                width: 350,
                height: 600,
                child: const FormWidget(),
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

//Widget formulaire
class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Username",
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Username",
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Submit")),
        ],
      ),
    );
  }
}
