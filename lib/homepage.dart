
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{
  File sampleImage;

  Future getImage() async{
    var tempimage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempimage;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: sampleImage == null ? Text('select image') : enableupload(),
      ),
  
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        child:  new Icon(Icons.add),
      ),
    );
  }
  Widget enableupload(){
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(sampleImage,height: 300.0,width: 300.0,),
          RaisedButton(
            elevation: 7.0,
            child: Text('Upload'),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () async {
              final StorageReference firebaseStorageRef = 
                FirebaseStorage.instance.ref().child('myimage.jpg');
              final StorageUploadTask task = 
                firebaseStorageRef.putFile(sampleImage);
            },
          ),
     
        ],
      ),
    );
  }
}