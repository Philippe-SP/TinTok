import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:tintok/Pages/BottomBar.dart";
import "package:tintok/main.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Enlever la baniere debug en haut a droite
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //AppBar
        appBar: AppBar(
          centerTitle: true,
          title: const Text("TinTok",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 42,
                  fontFamily: "josefin-sans")),
          backgroundColor: const Color.fromARGB(255, 191, 191, 191),
        ),
        //Menu burger
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
        //Contenu principal de l'application
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/profile_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainApp()));
                },
                child: const Text("Retour aux vidéos"),
              ),
            ),
          ),
        ),
        //Footer de l'application
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
