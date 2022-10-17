import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: FormularioTransferencia(),
    ));
  }
}

class editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  editor(
      {required this.controlador,
      required this.rotulo,
      required this.dica,
      this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        style: const TextStyle(fontSize: 19.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transferencias'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: <Widget>[
            editor(
              controlador: _controladorNumeroConta,
              rotulo: 'Numero Da conta desejada',
              dica: '0000',
            ),
            editor(
              controlador: _controladorValor,
              rotulo: 'Valor Desejado',
              dica: '000.00',
              icone: Icons.account_balance_wallet,
            ),
            OutlinedButton(
                onPressed: () {
                  debugPrint('confirmou a transção.');
                  final int? numeroConta =
                      int.tryParse(_controladorNumeroConta.text);
                  final double? valor = double.tryParse(_controladorValor.text);

                  if (numeroConta != null && valor != null) {
                    final transferenciaCriada =
                        transferencia(valor, numeroConta);
                    debugPrint('$transferenciaCriada');
                  }
                },
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
  final double? valor;
  final int? numeroConta;

  transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
