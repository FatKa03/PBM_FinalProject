import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pbma7/order.dart';

class PesanCam extends StatefulWidget {
  const PesanCam({Key? key}) : super(key: key);

  @override
  State<PesanCam> createState() => _PesanCamState();
}

class _PesanCamState extends State<PesanCam> {
  String? Alamat = '';
  String? Deskripsi = '';
  String? FotoMobil = '';
  String? Harga = '';
  String? TipeMobil ='';
  String? NamaToko = '';
  String? ProfilPict = '';

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection('mobil')
        .doc()
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
                builder: (context) => Order(
                      Alamat,
                      Deskripsi,
                      FotoMobil,
                      Harga,
                      TipeMobil,
                      NamaToko,
                      ProfilPict,
                    )),
          );
        },
        child: Container(
          width: double.infinity,
          height: 255,
          decoration: BoxDecoration(
            color: Color.fromARGB(245, 252, 204, 30),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.black,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Icon(
                      Icons.star_sharp,
                      color: Colors.black,
                      size: 24,
                    ),
                    Icon(
                      Icons.star_sharp,
                      color: Colors.black,
                      size: 24,
                    ),
                    Icon(
                      Icons.star_sharp,
                      color: Colors.black,
                      size: 24,
                    ),
                    Icon(
                      Icons.star_half,
                      color: Colors.black,
                      size: 24,
                    ),
                    Icon(
                      Icons.star_outline,
                      color: Colors.black,
                      size: 24,
                    ),
                  ],
                ),
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
        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop('Back');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                        size: 24,
                      ),
                      Text(
                        ' kembali',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Cari Mobil',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF757575),
                    size: 22,
                  ),
                ),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.start,
              ),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list,
                        size: 15,
                      ),
                      label: Text("Filter"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF9E9E9E))))),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('mobil')
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
