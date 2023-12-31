import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pbma7/Akun.dart';
import 'package:pbma7/halaman_utama.dart';
import 'package:pbma7/navbar.dart';
import 'package:pbma7/gantiakun.dart';
import 'package:pbma7/gantipassword.dart';

class Pengaturan extends StatelessWidget {
  const Pengaturan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                          'Pengaturan',
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
              padding: EdgeInsetsDirectional.fromSTEB(50, 60, 50, 0),
              child: ListTile(
                title: const Text(
                  'Ganti Akun',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                tileColor: Color.fromARGB(245, 252, 204, 30),
                trailing: IconButton(
                    highlightColor: Colors.grey,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return gantiakun();
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                      size: 20,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(50, 10, 50, 0),
              child: ListTile(
                title: const Text(
                  'Ganti Password',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                tileColor: Color.fromARGB(245, 252, 204, 30),
                trailing: IconButton(
                    highlightColor: Colors.grey,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return gantipassword();
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                      size: 20,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(50, 10, 50, 0),
              child: ListTile(
                title: const Text(
                  'logout',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                tileColor: Color.fromARGB(245, 252, 204, 30),
                trailing: IconButton(
                    highlightColor: Colors.grey,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Batal')),
                                  TextButton(
                                      child: Text('Iya'),
                                      onPressed: () {
                                        FirebaseAuth.instance.signOut().then(
                                          (value) {
                                            print("Signed Out");
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        halamanutama()));
                                          },
                                        );
                                      }),
                                ],
                                title: Text('KONFIRMASI'),
                                content: Text('Yakin Ingin Logout?'),
                              ));
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                      size: 20,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
