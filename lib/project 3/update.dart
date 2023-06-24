import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class updatebutton extends StatelessWidget {
  const updatebutton({super.key});

  @override
  Widget build(BuildContext context) {
    final bloodgroup = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
    String? selectedgroups;

    final CollectionReference donor =
        FirebaseFirestore.instance.collection('donor');

    TextEditingController donorphone = TextEditingController();
    TextEditingController donorName = TextEditingController();

    final argc = ModalRoute.of(context)!.settings.arguments as Map;

    donorName.text = argc['name'];
    donorphone.text = argc['phone'];
    selectedgroups = argc['group'];
    final docid = argc['id'];
    return Scaffold(
        appBar: AppBar(
          title: const Text('update Donors'),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: donorName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('user')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: donorphone,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('phone number')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                  decoration:
                      InputDecoration(label: Text('select blood group')),
                  items: bloodgroup
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (vaL) {
                    selectedgroups = vaL;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: const ButtonStyle(
                      minimumSize:
                          MaterialStatePropertyAll(Size(double.infinity, 50)),
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {},
                  child: const Text(
                    'update',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ));
  }
}
