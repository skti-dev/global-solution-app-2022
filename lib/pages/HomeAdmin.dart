import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  List<dynamic> _supplies = [];
  TextEditingController _storeName = TextEditingController();

  _getSupplies() async {
    http.Response response =
        await http.get(Uri.parse("http://localhost:8080/list"));
    Map<String, dynamic> responseJson = json.decode(response.body);

    setState(() {
      _supplies = responseJson["supplies"];
    });
  }

  _add() async {
    http.Response response = await http.post(
        Uri.parse("http://localhost:8080/register"),
        body: {"name": _storeName.text, "data": "01/01/2020"});
  }

  @override
  void initState() {
    super.initState();
    _getSupplies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle_rounded),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Login(),
                //   ),
                // );
              },
            ),
          ]),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Próximas entregas',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _addButton(),
                  ],
                ),
                _table(),
                _title("Produtos"),
                _suppliesTable(),
                _title('Análises'),
                _chart(),
              ],
            )));
  }

  _title(textValue) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
      width: double.maxFinite,
      child: Text(
        textValue,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _addButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: RaisedButton(
        color: Color.fromARGB(139, 155, 197, 221),
        child: Text(
          'Adicionar',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          _showAddScreen();
        },
      ),
    );
  }

  _showAddScreen() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar entrega'),
          content: TextField(
            controller: _storeName,
            decoration: InputDecoration(
              labelText: 'Nome loja entrega',
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Adicionar'),
              onPressed: () {
                _add();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _suppliesTable() {
    if (_supplies.length > 0) {
      return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
        child: DataTable(
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 46, 46, 46)),
            borderRadius: BorderRadius.circular(10),
          ),
          columns: [
            DataColumn(
              label: Text(
                'Produto',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Quantidade',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Data',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          rows: _supplies
              .map((supply) => DataRow(cells: [
                    DataCell(
                      Text(
                        supply["product"],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        supply["quantity"].toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        supply["date"],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]))
              .toList(),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
        child: Text(
          'Nenhum produto cadastrado',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  _table() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
        Widget>[
      DataTable(
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 46, 46, 46)),
          borderRadius: BorderRadius.circular(10),
        ),
        columns: [
          DataColumn(
              label: Text('Loja',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Data',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Ações',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Loja 01')),
            DataCell(Text('01/01/2020')),
            DataCell(
              _actionButtons(),
            ),
          ]),
          DataRow(cells: [
            DataCell(Text('Loja 02')),
            DataCell(Text('01/01/2020')),
            DataCell(
              _actionButtons(),
            ),
          ]),
          DataRow(cells: [
            DataCell(Text('Loja 03')),
            DataCell(Text('01/01/2020')),
            DataCell(
              _actionButtons(),
            ),
          ]),
          DataRow(cells: [
            DataCell(Text('Loja 04')),
            DataCell(Text('01/01/2020')),
            DataCell(
              _actionButtons(),
            ),
          ]),
        ],
      )
    ]);
  }

  _actionButtons() {
    return Row(
      children: <Widget>[_editButton(), _deleteButton()],
    );
  }

  _editButton() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: TextButton(
        child: Icon(
          Icons.edit,
          color: Colors.blue,
        ),
        onPressed: () {},
      ),
    );
  }

  _deleteButton() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: TextButton(
        child: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {},
      ),
    );
  }

  _chart() {
    return Container(
        width: double.maxFinite,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 46, 46, 46)),
          borderRadius: BorderRadius.circular(10),
        ),
        // child:
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bar_chart_outlined, size: 100),
          ],
        ));
  }
}
