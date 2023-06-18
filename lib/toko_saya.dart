import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pbma7/order.dart';
import 'package:pbma7/editdatamobil.dart';

class TokoSaya extends StatefulWidget {
  const TokoSaya({Key? key}) : super(key: key);

  @override
  State<TokoSaya> createState() => _TokoSayaState();
}

class _TokoSayaState extends State<TokoSaya> {
  String? Alamat = '';
  String? Deskripsi = '';
  String? FotoMobil = '';
  String? Harga = '';
  String? TipeMobil = '';
  String? NamaToko = '';
  String? ProfilPict = '';

  final uid = FirebaseAuth.instance.currentUser!.uid;

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection('mobil')
        .doc(uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          Alamat = snapshot.data()!['Alamat'];
          FotoMobil = snapshot.data()!['FotoMobil'];
          Deskripsi = snapshot.data()!['Deskripsi'];
          Harga = snapshot.data()!['Harga'];
          TipeMobil = snapshot.data()!['TipeMobil'];
          NamaToko = snapshot.data()!['NamaToko'];
          ProfilPict = snapshot.data()!['ProfilPict'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromDatabase();
  }

  Widget listViewWidget(String Alamat, String Deskripsi, String FotoMobil,
      String Harga, String TipeMobil, String NamaToko, String ProfilPict) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return EditMobil();
              },
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 270,
          decoration: BoxDecoration(
            color: Color.fromARGB(245, 252, 204, 30),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Color.fromARGB(245, 252, 204, 30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image(
                    image: NetworkImage(FotoMobil),
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 3, 0, 0),
                child: Text(
                  NamaToko,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TipeMobil,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      Harga + ' / Hari',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: Text(
                  Alamat,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(250, 0, 0, 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // background/ foreground
                        ),
                        onPressed: () {},
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Color.fromARGB(245, 252, 204, 30),
                              fontWeight: FontWeight.bold),
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(245, 252, 204, 30),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop('Back');
                        },
                        child: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop('Back');
                          },
                          child: const Text(
                            'Toko Saya',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                child: Text('Produkmu',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('mobil')
                      .where("id",
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.active) {
                      if (snapshot.data!.docs.isNotEmpty) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              return listViewWidget(
                                snapshot.data!.docs[index]['Alamat'],
                                snapshot.data!.docs[index]['Deskripsi'],
                                snapshot.data!.docs[index]['FotoMobil'],
                                snapshot.data!.docs[index]['Harga'],
                                snapshot.data!.docs[index]['TipeMobil'],
                                snapshot.data!.docs[index]['NamaToko'],
                                snapshot.data!.docs[index]['ProfilPict'],
                              );
                            });
                      } else {
                        return Center(
                          child: Text('There is no task'),
                        );
                      }
                    }
                    return Center(
                      child: Text('Something went wrong'),
                    );
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
