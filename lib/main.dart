import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    body: listaTransferencia(),

    appBar: AppBar(title: const Text('Transferencias'), backgroundColor: Colors.green,),
    floatingActionButton: FloatingActionButton(
      onPressed: () {  },
      child: const Icon(Icons.add),
    ),
  ),
) ,
);

class listaTransferencia extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        ItemTransferencia(transferencia(100.0, 1000))
      ],
    ) ;
  }
}

class ItemTransferencia extends StatelessWidget{

  final transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
      return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
        ),
      );
  }
}

class transferencia{

final double valor;
final int numeroConta;

transferencia(this.valor, this.numeroConta);
}
