import 'package:flutter/material.dart';

class HomeClient extends StatelessWidget {
  String valueLogin;
  String valuePassword;

  HomeClient({required this.valueLogin, required this.valuePassword});

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
                _title('Produtos'),
                _productsCarrosel(),
                _title('Estabelecimentos'),
                _storesCarrosel(),
                _title('Últimas compras'),
                _table()
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

  _productsCarrosel() {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _item("Item 01"),
          _item("Item 02"),
          _item("Item 03"),
          _item("Item 04"),
          _item("Item 05"),
          _item("Item 06"),
          _item("Item 07"),
          _item("Item 08"),
        ],
      ),
    );
  }

  _storesCarrosel() {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _item("Loja 01"),
          _item("Loja 02"),
          _item("Loja 03"),
          _item("Loja 04"),
          _item("Loja 05"),
          _item("Loja 06"),
          _item("Loja 07"),
          _item("Loja 08"),
        ],
      ),
    );
  }

  _item(textValue) {
    return Flex(direction: Axis.vertical, children: <Widget>[
      Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(right: 16),
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 46, 46, 46)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                color: Color.fromARGB(255, 46, 46, 46),
              ),
              Text(textValue),
            ],
          ))
    ]);
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
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Loja 01')),
            DataCell(Text('01/01/2020')),
          ]),
          DataRow(cells: [
            DataCell(Text('Loja 02')),
            DataCell(Text('01/01/2020')),
          ]),
          DataRow(cells: [
            DataCell(Text('Loja 03')),
            DataCell(Text('01/01/2020')),
          ]),
          DataRow(cells: [
            DataCell(Text('Loja 04')),
            DataCell(Text('01/01/2020')),
          ]),
        ],
      )
    ]);
  }
}
