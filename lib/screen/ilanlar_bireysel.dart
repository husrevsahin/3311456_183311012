import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobil_uygulama/screen/ilan_bilgileri.dart';

class ilanlar_bireysel extends StatelessWidget {
  const ilanlar_bireysel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BİREYSEL İLANLAR"),
        backgroundColor: Color.fromARGB(255, 0, 209, 146),
        centerTitle: true,
      ),
      body: UserInformation(),
    );
  }
}

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Bireysel_ilanlar').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ilan_biilgileri(
                              aciklama: data['açıklama'],
                              baslik: data['başlık'],
                              email: data["kullaniciid"],
                            )));
              },
              title: Text(data['başlık']),
              subtitle: Text(data['açıklama']),
              leading: Icon(
                IconData(0xe040, fontFamily: 'MaterialIcons'),
                color: Color.fromARGB(255, 17, 146, 0),
                size: 40,
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
            );
          }).toList(),
        );
      },
    );
  }
}
