// import "package:flutter/material.dart";
// import "package:supabase_flutter/supabase_flutter.dart";
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key, required this.profiledDssController});
//
//   final DraggableScrollableController profiledDssController;
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     //Tableau de tailles du DSS
//     final List<double> _snapSize = [1.0, 0.5, 0.0];
//
//     //Récuération des données depuis supabase
//     final _future = Supabase.instance.client.from('Users').select();
//
//     return DraggableScrollableSheet(
//       controller: widget.profiledDssController,
//       snap: true,
//       snapSizes: _snapSize,
//       initialChildSize: _snapSize[0],
//       minChildSize: _snapSize[0],
//       maxChildSize: _snapSize[2],
//       builder: (BuildContext context, ScrollController scrollController) {
//         print("======== DSS Build ========");
//         return Container(
//           color: const Color.fromARGB(180, 191, 191, 191),
//           child: FutureBuilder(
//             future: _future,
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               final Users = snapshot.data!;
//               return ListView.builder(
//                 controller: scrollController,
//                 itemCount: Users.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final user = Users[index];
//                   return ListTile(
//                     title: Text(
//                       user['username'],
//                       style: const TextStyle(fontSize: 20),
//                     ),
//                     subtitle: const Divider(color: Colors.black),
//                   );
//                 },
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
