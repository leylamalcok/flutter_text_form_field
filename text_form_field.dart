import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  TextFormFieldKullanimi({Key? key}) : super(key: key);

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  String _email = '', _password = '', _userName = ' ';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Textform field kullanımı')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  initialValue: 'leylamalcok',
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "surname",
                    hintText: "username",
                  ),
                  onSaved: (deger) {
                    _userName = deger!;
                  },
                  validator: (deger) {
                    if (deger!.length < 4) {
                      return 'USER NAME EN AZ 4 KARAKTER OLMALIDIR';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //initialValue: 'leylamalcok@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "E-mail",
                    hintText: "e_mail adresini giriniz",
                  ),
                  onSaved: (deger) {
                    _email = deger!;
                  },
                  validator: (deger) {
                    {
                      if (deger!.isEmpty) {
                        return "Email boş bırakılamaz.";
                      }
                    }
                    if (!EmailValidator.validate(deger)) {
                      return 'geçerli bir mail adresi giriniz';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //initialValue: 'leylamalcok@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Şifrenizi giriniz",
                  ),
                  onSaved: (deger) {
                    _password = deger!;
                  },
                  validator: (deger) {
                    if (deger!.isEmpty) {
                      return "PASSWORD boş bırakılamaz.";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      bool _validate = _formkey.currentState!.validate();
                      if (_validate) {
                        _formkey.currentState!.save();
                      }
                      String result =
                          'KULLANICI ADI : $_userName\nE-MAİL ADRESİ: $_email\nPassword: $_password';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.purple,
                          content: Text(
                            result,
                            style:
                                TextStyle(color: Colors.orange, fontSize: 25),
                          ),
                        ),
                      );
                    },
                    child: Text("KAYDET")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
