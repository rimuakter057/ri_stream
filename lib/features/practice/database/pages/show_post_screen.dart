import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:ri_stream/features/common/common_widget/custom_text_field.dart';

class ShowPostPage extends StatefulWidget {
  const ShowPostPage({super.key});

  @override
  State<ShowPostPage> createState() => _ShowPostPageState();
}

class _ShowPostPageState extends State<ShowPostPage> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post');
  final searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("show post")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              controller: searchController,
              hintText: "Search",
              onChanged: (String value) {
                setState(() {
                });
              },
            ),

           SizedBox(height: 8,),
            Expanded(
              child: FirebaseAnimatedList(
                defaultChild: Text("loading"),
                query: ref,
                itemBuilder: (context, snapshot,animation,index) {
                  final title=snapshot.child('post').value.toString();
                 if(searchController.text.isEmpty){
                   return   ListTile(
                       title: Text(snapshot.child('post').value.toString()),
                       subtitle:Text(snapshot.child('id').value.toString()));
                 }else if(title.toLowerCase().contains(searchController.text.toLowerCase())){
                   return   ListTile(
                       title: Text(snapshot.child('post').value.toString()),
                       subtitle:Text(snapshot.child('id').value.toString()));
                 }else{
                   return Container();
                 }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}







//
//
//
//
// Expanded(
// child: StreamBuilder(stream: ref.onValue,
// builder: (context,AsyncSnapshot<DatabaseEvent> snapshot){
// if(!snapshot.hasData){
// return Center(child: CircularProgressIndicator(),);
// }else{
// Map <dynamic,dynamic>map=snapshot.data!.snapshot.value as dynamic;
// List <dynamic>list=[];
// list.clear();
// list=map.values.toList();
//
// return  ListView.builder(
// itemCount: snapshot.data!.snapshot.children.length,
// itemBuilder: (context,index){
// return ListTile(
// title: Text(list[index]['post']),
// subtitle: Text(list[index]['id']),
//
// );
//
// });
// }
//
//
//
// }
// )
// ),