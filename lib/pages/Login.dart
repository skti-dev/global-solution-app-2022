import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_solution_app_2022/pages/HomeAdmin.dart';
import 'package:global_solution_app_2022/pages/HomeClient.dart';
import 'package:global_solution_app_2022/pages/Register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _textoResultado = "";

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: (AppBar(
          backgroundColor: Color.fromARGB(255, 36, 142, 204),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(
                Icons.public,
                color: Colors.white,
              ),
              Text('AgroVida')
            ],
          ))),
      body: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              _inputLogin(),
              _inputPassword(),
              _forgetPasswordLink(),
              _registerLink(),
              _button(context),
            ]),
          )),
    ));
  }

  _inputLogin() {
    return TextField(
      controller: _loginController,
      decoration: InputDecoration(
        labelText: 'Login',
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

  _forgetPasswordLink() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 16),
      child: TextButton(
        child: Text(
          'Esqueci minha senha',
          style: TextStyle(
            color: Color.fromARGB(255, 59, 65, 70),
            fontSize: 16,
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  _registerLink() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 16),
      child: TextButton(
        child: Text(
          'Cadastre-se',
          style: TextStyle(
            color: Color.fromARGB(255, 59, 65, 70),
            fontSize: 16,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Register()),
          );
        },
      ),
    );
  }

  _button(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      width: double.maxFinite,
      child: RaisedButton(
        color: Color.fromARGB(255, 13, 95, 161),
        textColor: Colors.white,
        padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
        child: const Text('Entrar'),
        onPressed: () {
          _open(context);
        },
      ),
    );
  }

  _open(BuildContext context) {
    if (_loginController.text == 'agricultor' ||
        _loginController.text == 'empresa' ||
        _loginController.text == 'admin' ||
        _loginController.text == 'adm') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeAdmin();
      }));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return HomeClient(
            valueLogin: _loginController.text,
            valuePassword: _passwordController.text);
      }));
    }
  }
}
