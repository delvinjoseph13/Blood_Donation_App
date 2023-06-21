import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donation App'),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: donor.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot donorshap = snapshot.data.docs[index];
                return Container(
                  height: 80,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 31,
                          backgroundColor: Colors.red,
                          child: Text(donorshap['group'],style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      ),
                       Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Text(donorshap['name'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold ),), 
                           Text(donorshap['phone'].toString(),style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold ),), 
                          ],
                        ),
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon:Icon(Icons.edit),iconSize: 30,),
                          IconButton(onPressed: (){}, icon:Icon(Icons.delete),iconSize: 30,),
                        ],
                      )
                        
                    
                   
                      
                    
                     
                    ],
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
