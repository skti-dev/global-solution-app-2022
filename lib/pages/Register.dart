import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomeAdmin.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _documentController = TextEditingController();

  String _textoResultado = "";

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: (AppBar(
          title: const Text('Cadastro'),
          backgroundColor: Color.fromARGB(255, 36, 142, 204))),
      body: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              _inputName(),
              _inputEmail(),
              _inputPassword(),
              _inputDocument(),
              _registerType(),
              _button(context),
            ]),
          )),
    ));
  }

  _inputName() {
    return TextField(
      controller: _nameController,
      decoration: InputDecoration(
        labelText: 'Nome',
      ),
    );
  }

  _inputEmail() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
      ),
    );
  }

  _inputPassword() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: 'Senha',
      ),
    );
  }

  _inputDocument() {
    return TextField(
      controller: _documentController,
      decoration: InputDecoration(
        labelText: 'Documento',
      ),
    );
  }

  _registerType() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
          margin: EdgeInsets.only(top: 10),
          width: double.maxFinite,
          child: Text(
            "Tipo de cadastro",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_itemFarmer(), _itemStore(), _itemClient()],
        )
      ],
    );
  }

  _itemFarmer() {
    return Flex(direction: Axis.vertical, children: <Widget>[
      Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(right: 16),
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 11, 109, 24)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.public,
                color: Color.fromARGB(255, 11, 109, 24),
              ),
              Text("Agricultor"),
            ],
          ))
    ]);
  }

  _itemStore() {
    return Flex(direction: Axis.vertical, children: <Widget>[
      Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(right: 16),
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 86, 23, 187)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.store,
                color: Color.fromARGB(255, 86, 23, 187),
              ),
              Text("Empresa"),
            ],
          ))
    ]);
  }

  _itemClient() {
    return Flex(direction: Axis.vertical, children: <Widget>[
      Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(right: 16),
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 192, 91, 9)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                color: Color.fromARGB(255, 192, 91, 9),
              ),
              Text("Cliente"),
            ],
          ))
    ]);
  }

  _button(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      width: double.maxFinite,
      child: RaisedButton(
        color: Color.fromARGB(255, 13, 95, 161),
        textColor: Colors.white,
        padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
        child: const Text('Próximo'),
        onPressed: () {
          _open(context);
        },
      ),
    );
  }

  _open(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return HomeAdmin();
    }));
  }
}
