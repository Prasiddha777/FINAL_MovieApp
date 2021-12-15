// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'favsqlhelper.dart';


// class SQLHomePage extends StatefulWidget {
//   final int movieid;

//   const SQLHomePage({Key? key, required this.movieid}) : super(key: key);

//   @override
//   _SQLHomePageState createState() => _SQLHomePageState();
// }

// class _SQLHomePageState extends State<SQLHomePage> {
//   // All journals
//   List<Map<String, dynamic>> _journals = [];

//   bool _isLoading = true;
//   // This function is used to fetch all data from the database
//   void _refreshJournals() async {
//     final data = await SQLHelper.getItemById(widget.movieid);
//     setState(() {
//       _journals = data;
//       _isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _refreshJournals(); // Loading the diary when the app starts
//   }

 
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();

//   // This function will be triggered when the floating button is pressed
//   // It will also be triggered when you want to update an item
//   void _showForm(int? id) async {
//     if (id != null) {
//       // id == null -> create new item
//       // id != null -> update an existing item
//       final existingJournal =
//           _journals.firstWhere((element) => element['id'] == id);
//       _titleController.text = existingJournal['title'];
//       _descriptionController.text = existingJournal['description'];
//     }

//     showModalBottomSheet(
//         context: context,
//         elevation: 5,
//         builder: (_) => Container(
//               padding: const EdgeInsets.all(15),
//               width: double.infinity,
//               height: 300,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     TextField(
//                       controller: _titleController,
//                       decoration:
//                           const InputDecoration(hintText: 'ADD YOU REVIEW?'),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     // TextField(
//                     //   controller: _descriptionController,
//                     //   decoration:
//                     //       const InputDecoration(hintText: 'Description'),
//                     // ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     ElevatedButton(
//                       onPressed: () async {
//                         // Save new journal
//                         if (id == null) {
//                           await _addItem();
//                         }

//                         if (id != null) {
//                           await _updateItem(id);
//                         }
                      

//                         // Close the bottom sheet
//                         Navigator.of(context).pop();
//                       },
//                       child: Text(id == null ? 'ADD' : 'Update'),
//                     )
//                   ],
//                 ),
//               ),
//             ));
//   }

// // Insert a new journal to the database
//   Future<void> _addItem() async {
//     await SQLHelper.createItem(
//         _titleController.text, _descriptionController.text, widget.id);
//     _refreshJournals();
//   }

//   // Update an existing journal
//   Future<void> _updateItem(int id) async {
//     await SQLHelper.updateItem(
//         id, _titleController.text, _descriptionController.text);
//     _refreshJournals();
//   }

//   // Delete an item
//   void _deleteItem(int id) async {
//     await SQLHelper.deleteItem(id);
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//       content: Text('Successfully deleted a journal!'),
//     ));
//     _refreshJournals();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('Kindacode.com'),
//       // ),
//       body: _isLoading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: _journals.length,
//               itemBuilder: (context, index) => Card(
//                 color: Colors.grey[200],
//                 margin: const EdgeInsets.all(15),
//                 child: ListTile(
//                     leading: Container(
//                       height: 55,
//                       child: Image(
//                         image: NetworkImage(user!.photoURL!),
//                       ),
//                     ),
//                     title: Text(_journals[index]['title']),
//                     subtitle: Text(_journals[index]['description']),
//                     trailing: SizedBox(
//                       width: 100,
//                       child: Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.edit),
//                             onPressed: () => _showForm(_journals[index]['id']),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete),
//                             color: Colors.red.shade900,
//                             onPressed: () =>
//                                 _deleteItem(_journals[index]['id']),
//                           ),
//                         ],
//                       ),
//                     )),
//               ),
//             ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () => _showForm(null),
//       ),
//     );
//   }
// }
