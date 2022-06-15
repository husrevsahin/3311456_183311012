import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobil_uygulama/screen/ilan_bilgileri.dart';

class kisiilanlari extends StatelessWidget {
  //const ilanlar_bireysel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İLANLARIM"),
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
  FirebaseAuth auth = FirebaseAuth.instance;
  String? event = "kullaniciid";

  sil(String baslik) async {
    FirebaseFirestore.instance
        .collection("Bireysel_ilanlar")
        .doc(baslik)
        .delete();
  }

//"kullaniciid", isEqualTo : auth.currentUser.email

  @override
  Widget build(BuildContext context) {
    Query model = FirebaseFirestore.instance
        .collection("Bireysel_ilanlar")
        .where("kullaniciid", isEqualTo: auth.currentUser!.email);
    return StreamBuilder<QuerySnapshot>(
      stream: model.snapshots(),
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
            return GestureDetector(
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          content: Text("Silmek istediğinizden emin misiniz?"),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("iptal")),
                            ElevatedButton(
                                onPressed: () {
                                  sil(data["başlık"]);
                                  Navigator.pop(context);
                                },
                                child: Text("Sil")),
                          ],
                        ));
              },
              child: ListTile(
                title: Text(data['başlık']),
                subtitle: Text(data['açıklama']),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
