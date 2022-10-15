import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      body: FormularioTransferencia(),
    ));
  }
}

class FormularioTransferencia extends StatelessWidget {
  const FormularioTransferencia({super.key});

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transferencias'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontSize: 19.0),
                decoration: InputDecoration(
                    labelText: 'Numero Da Conta', hintText: 'e.g: 0000'),
                keyboardType: TextInputType.number,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontSize: 19.0),
                decoration: InputDecoration(
                    labelText: 'Valor Desejado', hintText: 'e.g: 100.00', icon: Icon(Icons.account_balance_wallet_sharp)),
                keyboardType: TextInputType.number,
              ),
            ),
            OutlinedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.blueAccent),
                ),
                child: const Text(
                  "Confirmar",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ))
          ],
        ));
  }
}

class listaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transferencias'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: <Widget>[ItemTransferencia(transferencia(100.0, 1000))],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}

class ItemTransferencia extends StatelessWidget {
  final transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class transferencia {
  final double valor;
  final int numeroConta;

  transferencia(this.valor, this.numeroConta);
}
