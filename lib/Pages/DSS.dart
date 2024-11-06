import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//DraggableScrollableSheet Class
class DSS extends StatefulWidget {
  final DraggableScrollableController dsscontroller;

  const DSS({super.key, required this.dsscontroller});

  @override
  State<DSS> createState() => _DSSState();
}

class _DSSState extends State<DSS> {
  //Tableau de tailles du DSS
  final List<double> _snapSize = [0.05, 0.5, 0.8];

  //Récuération des données depuis supabase
  final _future = Supabase.instance.client.from('Comments').select();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: widget.dsscontroller,
      snap: true,
      snapSizes: _snapSize,
      initialChildSize: _snapSize[0],
      minChildSize: _snapSize[0],
      maxChildSize: _snapSize[2],
      builder: (BuildContext context, ScrollController scrollController) {
        print("======== DSS Build ========");
        return Container(
          color: const Color.fromARGB(180, 191, 191, 191),
          child: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final Comments = snapshot.data!;
              return ListView.builder(
                controller: scrollController,
                itemCount: Comments.length,
                itemBuilder: (BuildContext context, int index) {
                  final comment = Comments[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.network(
                          "https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png"),
                    ),
                    title: Text(
                      comment['content'],
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: const Divider(color: Colors.black),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
