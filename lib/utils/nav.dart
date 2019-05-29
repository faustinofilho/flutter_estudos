

import 'package:flutter/material.dart';

/**
 * para abrir outra pagina
 * usamos o navigator
 *
 * pushReplacement = substitue a pagina
 * push            = cria uma tela com a seta para voltar
 *
 */

push(BuildContext context, Widget page){

  Navigator.push(context, MaterialPageRoute(builder: (context){
    return page;
  }));
}

pushReplacement(BuildContext context, Widget page){

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return page;
  }));
}