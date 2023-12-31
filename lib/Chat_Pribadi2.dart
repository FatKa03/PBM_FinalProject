import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pbma7/navbar.dart';
import 'package:image_picker/image_picker.dart';

class ChatPribadi2 extends StatefulWidget {
  const ChatPribadi2({Key? key}) : super(key: key);

  @override
  State<ChatPribadi2> createState() => _ChatPribadi2State();
}

class _ChatPribadi2State extends State<ChatPribadi2> {
  File? _image;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => this._image = imageTemp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: 70,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop('Back');
                    },
                    child: const Icon(
                      Icons.chevron_left_sharp,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Container(
                      width: 50,
                      height: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Image(
                        image: AssetImage("assets/images/Group.png"),
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                  const Text(
                    'Bulan',
                    style: TextStyle(
                      color: Color.fromARGB(245, 252, 204, 30),
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
              child: Stack(
                children: [
                  Container(
                    width: 330,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(245, 252, 204, 30),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1, 0),
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: Color.fromARGB(255, 244, 244, 244),
                          size: 25,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.65, 0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: ((Builder) => bottomSheet()));
                      },
                    ),
                  ),
                ],
              ),
            )
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
              "Kirim Foto Menggunakan :",
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
