import 'package:flutter/material.dart';
import 'package:flutter_estudos/domain/service/carro_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Home Carros"),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: _listView(),
      ),
    );
  }

  _listView() {
    /**
     * aqui agente resgata os carros que esta vindo da api
     */
    final carros = CarroService.getCarros();

      return ListView.builder(
          itemCount: carros.length,
          itemBuilder: (ctx, idx){

            /**
             * pega o carro pelo indice do array que esta vindo da api
             */
            final c = carros[idx];

          return Container(
            height: 250,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Expanded(
                    flex: 9,
                    child: Image.network(c.urlFoto),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color:  Colors.grey ,
                      child: Center(
                        child: Text(
                          c.nome,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                  ButtonTheme.bar(

                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Detalhes'),
                          onPressed: () {/* ... */},
                        ),
                        FlatButton(
                          child: const Text('Share'),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

      });
  }

}


/**

    ListTile(
    /**
 * adicionar a imagem ao card, vinda da api
    */
    leading: Image.network(c.urlFoto, width: 150,),
    title: Text(
    c.nome,
    style: TextStyle(
    color: Colors.blue,
    fontSize: 20
    ),
    ),
    subtitle: Text(
    'Subtitulo',
    style: TextStyle(
    color: Colors.black,
    fontSize: 15
    ),
    ),
    ),

 */


