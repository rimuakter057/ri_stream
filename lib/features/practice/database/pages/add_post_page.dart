

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ri_stream/features/common/common_widget/custom_text_field.dart';
import 'package:ri_stream/utils/toast_message.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {


  final TextEditingController postController=TextEditingController();
  bool loading=false;
  final databaseRef=FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: "whats your mind",
                maxLine: 4,
                controller: postController,
              ),
              SizedBox(height: 8,),
              ElevatedButton(onPressed: (){
                  databaseRef.child(DateTime.now().microsecondsSinceEpoch.toString()).set({
                    "post":postController.text.toString(),
                    "id":DateTime.now().microsecondsSinceEpoch.toString(),

                  });

                   
                  postController.clear();
                  ToastUtils.showSuccessToast("add success1");


              }, child: Text("add"))
            ],
          ),
        ),
      ),
    );
  }
}
