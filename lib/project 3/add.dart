import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Addbutton extends StatelessWidget {
  const Addbutton({super.key});

  @override
  Widget build(BuildContext context) {
    final bloodgroup = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
    String? selectedgroups;

    final CollectionReference donor =
        FirebaseFirestore.instance.collection('donor');

    TextEditingController donorphone = TextEditingController();
    TextEditingController donorName = TextEditingController();

    void adddonor() {
      final data = {
        'name': donorName.text,
        'phone': donorphone.text,
        'group': selectedgroups
      };
      donor.add(data);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Donors'),
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
                  onPressed: () {
                    adddonor();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ));
  }
}
