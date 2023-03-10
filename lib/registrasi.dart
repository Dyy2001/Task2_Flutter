import 'package:flutter/material.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

  @override
  State<RegistrasiPage> createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  String gender = 'male';
  List<String> _item = [
    'Islam',
    'Kristen',
    'Budha',
    'Hindu',
    'Katholik',
    'Konghucu'
  ];
  String _selectItem = 'Islam';

  GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _motto = TextEditingController();

  void validasiText() {
    if (_key.currentState!.validate()) {
      if (_email.text.isEmpty &&
          _password.text.isEmpty &&
          _motto.text.isEmpty) {
        print("Data tidak boleh kosong");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Register Page"),
          backgroundColor: Colors.lightGreen,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Email Tidak Boleh Kosong!";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Password Tidak Boleh Kosong!";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLines: 5,
                      controller: _motto,
                      decoration: InputDecoration(
                          hintText: 'Masukkan Motto Hidup',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Tidak Boleh Kosong!";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            value: 'male',
                            title: const Text("Male"),
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                        ),
                        Expanded(
                            child: RadioListTile(
                          value: 'female',
                          title: const Text("Female"),
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ))
                      ],
                    ),
                    const Center(
                      child: Text("Agama :"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButton(
                      value: _selectItem,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      onChanged: (value) {
                        setState(() {
                          _selectItem = value!;
                        });
                      },
                      items:
                          _item.map<DropdownMenuItem<String>>((String Agama) {
                        return DropdownMenuItem(
                          value: Agama,
                          child: Text(Agama),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(350, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lightGreen)),
                      //TextStyle: Te
                      onPressed: () {
                        validasiText();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Center(
                                    child: Text(
                                  "Info Akun",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                                content: Container(
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("email : ${_email.text}"),
                                      Text("Password : ${_password.text}"),
                                      Text("Motto : ${_motto.text}"),
                                      Text("Jenis Kelamin : ${gender}"),
                                      Text("Agama : ${_selectItem}"),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: const Text('SignUp'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(350, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      //TextStyle: Te
                      onPressed: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.lightGreen),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
