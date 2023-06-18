import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pbma7/navbar.dart';
import 'package:pbma7/style/style.dart';
import 'package:pbma7/halaman_daftar.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  bool isHiddenPassword = true;

  void _tooglePasswordView(){
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LOGIN',
                  style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
              Text(
                'Silahkan login terlebih dahulu',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 60),
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.067),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26))
                ]),
                child: TextFormField(
                  controller: ctrlEmail,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'enter valid email'
                          : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius1,
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'example@gmail.com',
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.mail,
                      color: color1,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26))
                ]),
                child: TextFormField(
                  obscureText: isHiddenPassword,
                  controller: ctrlPassword,
                  validator: (value) {
                    if (value != null && value.length < 6) {
                      return 'enter min 6 char';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius1,
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'password123',
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: color1,
                    ),
                    suffixIcon: InkWell(
                      onTap: _tooglePasswordView,
                      child: Icon(
                        Icons.remove_red_eye,
                        color: color1,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: borderRadius1,
                    color: Colors.grey,
                    boxShadow: [boxshadow1]),
                child: TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      final isValidFrom = _formKey.currentState!.validate();
                      if (isValidFrom) {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: ctrlEmail.text,
                                password: ctrlPassword.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Navbar()));
                        }).onError((error, stackTrace) {
                          print("Error");
                          Fluttertoast.showToast(
                                  msg: 'Akun Tidak Ditemukan');
                        });
                      }
                    }),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return register();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Belum punya akun',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
