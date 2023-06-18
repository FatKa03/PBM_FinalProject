import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pbma7/navbar.dart';
import 'package:image_picker/image_picker.dart';

class EditMobil extends StatefulWidget {
  const EditMobil({Key? key}) : super(key: key);

  @override
  State<EditMobil> createState() => _EditMobilState();
}

class _EditMobilState extends State<EditMobil> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController ctrlNamaMob = TextEditingController();
  TextEditingController ctrlHarga = TextEditingController();
  TextEditingController ctrlDesk = TextEditingController();

  File? imageFile;
  String? imageUrl;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => this.imageFile = imageTemp);
  }

  String? image;
  String? nama;
  String? alamat;

  updateNamaDataMobil() async {
    await FirebaseFirestore.instance
        .collection('mobil')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) {
      for (int index = 0; index < snapshot.docs.length; index++) {
        String ProfilPictInMobil = snapshot.docs[index]['FotoMobil'];
        if (ProfilPictInMobil != imageUrl) {
          FirebaseFirestore.instance
              .collection('mobil')
              .doc(snapshot.docs[index].id)
              .update({'FotoMobil': imageUrl});
        }
      }
    });
  }

  updateNameInDataMobil() async {
    await FirebaseFirestore.instance
        .collection('mobil')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) {
      for (int index = 0; index < snapshot.docs.length; index++) {
        String NameInMobil = snapshot.docs[index]['ModelMobil'];
        if (NameInMobil != ctrlNamaMob.text) {
          FirebaseFirestore.instance
              .collection('mobil')
              .doc(snapshot.docs[index].id)
              .update({'ModelMobil': ctrlNamaMob.text});
        }
      }
    });
  }

  updateHargaInDataMobil() async {
    await FirebaseFirestore.instance
        .collection('mobil')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) {
      for (int index = 0; index < snapshot.docs.length; index++) {
        String HargaInMobil = snapshot.docs[index]['Harga'];
        if (HargaInMobil != ctrlHarga.text) {
          FirebaseFirestore.instance
              .collection('mobil')
              .doc(snapshot.docs[index].id)
              .update({'Harga': ctrlHarga.text});
        }
      }
    });
  }

  updateDeksInDataMobil() async {
    await FirebaseFirestore.instance
        .collection('Mobil')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) {
      for (int index = 0; index < snapshot.docs.length; index++) {
        String DeksInMobil = snapshot.docs[index]['Deskirpsi'];
        if (DeksInMobil != ctrlDesk.text) {
          FirebaseFirestore.instance
              .collection('Mobil')
              .doc(snapshot.docs[index].id)
              .update({'Deskirpsi': ctrlDesk.text});
        }
      }
    });
  }

  updateAlamatInDataMobil() async {
    await FirebaseFirestore.instance
        .collection('Mobil')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) {
      for (int index = 0; index < snapshot.docs.length; index++) {
        String AlamatInMobil = snapshot.docs[index]['Alamat'];
        if (AlamatInMobil != alamat) {
          FirebaseFirestore.instance
              .collection('Mobil')
              .doc(snapshot.docs[index].id)
              .update({'Alamat': alamat});
        }
      }
    });
  }

  void _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          image = snapshot.data()!['userImage'];
          nama = snapshot.data()!['NamaLengkap'];
          alamat = snapshot.data()!['Alamat'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromDatabase();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                          'Kembali',
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
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: Text(
                  'Ubah Data Mobil',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                )
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((Builder) => bottomSheet()));
                            },
                            child: CircleAvatar(
                                radius: 35,
                                backgroundImage: imageFile == null
                                    ? const AssetImage(
                                        "assets/images/addimg.png")
                                    : Image.file(imageFile!).image),
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text('Foto Mobil',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text('Model Mobil',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Data tidak boleh kosong';
                          }
                          return null;
                        },
                        controller: ctrlNamaMob,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(245, 252, 204, 30),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text('Harga Mobil/Hari',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      TextFormField(
                        controller: ctrlHarga,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Data tidak boleh kosong';
                          }
                          return null;
                        },
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(245, 252, 204, 30),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text('Deskripsi',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Data tidak boleh kosong';
                          }
                          return null;
                        },
                        controller: ctrlDesk,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(245, 252, 204, 30),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1, 0),
                  child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: ElevatedButton(
                          onPressed: () async {
                            final isValidFrom =
                                _formKey.currentState!.validate();
                            if (isValidFrom) {
                              final ref = FirebaseStorage.instance
                                  .ref()
                                  .child('MobilImages')
                                  .child(DateTime.now().toString() + '.jpg');
                              await ref.putFile(imageFile!);
                              imageUrl = await ref.getDownloadURL();
                              final User? user = _auth.currentUser;
                              final _uid = user!.uid;
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(_uid)
                                  .update({
                                'FotoMobil': imageUrl,
                                'ModelMobil': ctrlNamaMob.text,
                                'Harga': ctrlHarga.text,
                                'Deskripsi': ctrlDesk.text,
                                'Alamat': alamat,
                              });
                              updateHargaInDataMobil();
                              updateDeksInDataMobil();
                              updateNameInDataMobil();
                              updateNamaDataMobil();
                              updateAlamatInDataMobil;
                              print("Created New Data Mobil");
                              Fluttertoast.showToast(
                                  msg: 'Mobil Berhasil Diubah');
                            }
                          },
                          child: Text(
                            'Konfirmasi',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromARGB(245, 252, 204, 30)),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ))),
                ),
              ],
            ),
          ),
        );
  }

  Widget bottomSheet() {
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: <Widget>[
            const Text(
              "Upload Gambar :",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.camera_alt_sharp),
                  onPressed: () => pickImage(ImageSource.camera),
                  style: TextButton.styleFrom(primary: Colors.black),
                  label: Text("Kamera"),
                ),
                TextButton.icon(
                  icon: Icon(Icons.broken_image_outlined),
                  onPressed: () => pickImage(ImageSource.gallery),
                  style: TextButton.styleFrom(primary: Colors.black),
                  label: Text("Galeri"),
                )
              ],
            )
          ],
        ));
  }
}
