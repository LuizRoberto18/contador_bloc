import 'dart:html';

import 'package:contador_bloc/bloc/bloc_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BlocController _bloc = BlocController();

  //INICIANDO O BLOC
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = BlocController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Você apertou no botão"),
            //CRIANDO UM STREAMBUILDER PARA MOSTRAR A QUANTIDADE DE VEZES QUE CLICAMOS
            StreamBuilder<int>(
              //ouvindo a stream de saida
              stream: _bloc.saida,
              initialData: 0,
              builder: (context, AsyncSnapshot<int> snapshot) {
                print(snapshot.data);
                if (snapshot.hasError) {
                  return Text("Erro com a Stream");
                } else {
                  return Text(
                    //USANDO SNAPSHOT PARA CAPTURAR OS DADOS ATUAIS DA SAIDA
                    "${snapshot.data} vezes",
                    style: Theme.of(context).textTheme.headline1,
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bloc.aumentar,
        tooltip: "Aumente",
        child: Icon(Icons.add),
      ),
    );
  }

  //REESCREVENDO DISPOSE PARA FECHAR O BLOC
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }
}
