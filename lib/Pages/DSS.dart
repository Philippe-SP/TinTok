import 'package:flutter/material.dart';

//DraggableScrollableSheet Class
class DSS extends StatefulWidget {
  final DraggableScrollableController dsscontroller;

  const DSS({super.key, required this.dsscontroller});

  @override
  State<DSS> createState() => _DSSState();
}

class _DSSState extends State<DSS> {
  final List<double> _snapSize = [0.1, 0.5, 0.8];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: widget.dsscontroller,
      initialChildSize: _snapSize[0],
      minChildSize: _snapSize[0],
      maxChildSize: _snapSize[2],
      snap: true,
      builder: (BuildContext context, ScrollController scrollController) {
        print("======== DSS Build ========");
        return Center(
            child: Container(
          width: double.maxFinite,
          height: 600,
          color: const Color.fromARGB(182, 61, 61, 61),
          padding: const EdgeInsets.only(top: 50),
          child: Column(children: [
            Expanded(
              child:
                  ListView(padding: EdgeInsets.zero, children: const <Widget>[
                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.comment,
                          color: Color.fromARGB(255, 191, 191, 191), size: 50),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        "Commentaire 1",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontFamily: "josefin-sans"),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.comment,
                          color: Color.fromARGB(255, 191, 191, 191), size: 50),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        "Commentaire 2",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontFamily: "josefin-sans"),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.comment,
                          color: Color.fromARGB(255, 191, 191, 191), size: 50),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        "Commentaire 3",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontFamily: "josefin-sans"),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.comment,
                        color: Color.fromARGB(255, 191, 191, 191),
                        size: 50,
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        "Commentaire 4",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontFamily: "josefin-sans",
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            )
          ]),
        ));
      },
    );
  }
}
