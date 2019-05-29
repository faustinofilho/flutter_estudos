import 'package:flutter/material.dart';
import 'package:flutter_estudos/domain/service/login_service.dart';
import 'package:flutter_estudos/pages/home_page.dart';
import 'package:flutter_estudos/utils/alert.dart';
import 'package:flutter_estudos/utils/nav.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final ct_login = TextEditingController(text: 'ricardo');
  final ct_senha = TextEditingController(text: '123');

  var _progress = false;

//  Variavel que é colocada no form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faustino Estudos app'),
      ),
      body:  Padding(
        padding: EdgeInsets.all(16),
        child: _body(context),
      )
    );
  }

  String _validateLogin( String text)
  {
    if(text.isEmpty){
      return 'Informe o login';
    }

    return null;
  }

  String _validateSenha( String text)
  {
    if(text.isEmpty){
      return 'Informe a Senha';
    }

    if(text.length <= 2){
      return 'Senha precisa ser maior que 2';
    }

    return null;
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: ct_login,
            validator: _validateLogin,
            style: TextStyle(color: Colors.blue, fontSize: 25),
            decoration: InputDecoration(
                labelText: "Login",
                labelStyle: TextStyle(color: Colors.black, fontSize: 25),
                hintText: "Digite sua login",
                hintStyle: TextStyle(color: Colors.black, fontSize: 18)
            ),
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            controller: ct_senha,
            validator: _validateSenha,
            obscureText: true,
            style: TextStyle(color: Colors.black, fontSize: 25),
            decoration: InputDecoration(
                labelText: "Senha",
              labelStyle: TextStyle(color: Colors.black, fontSize: 25),
              hintText: "Digite sua senha",
              hintStyle: TextStyle(color: Colors.black, fontSize: 18)
            ),
            keyboardType: TextInputType.number,
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 20),
            child: RaisedButton(
                color: Colors.blue,
                child:
                    _progress ?

                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        :

                          Text('Login', style: TextStyle(color: Colors.white, fontSize: 20),)
                ,
                onPressed: () { _onclickLogin(context); }
            ),
          )
        ],
      ),
    );
  }



  _onclickLogin( BuildContext context)  async{
    final login = ct_login.text;
    final senha = ct_senha.text;
      /**
       * para chamar a validação
       */
      if(! _formKey.currentState.validate()){
//        showDialog(
//            context: context,
//            builder: (context){
//              return AlertDialog(
//                title: Text('Erro'),
//                content: Text('Informe corretamente o login e senha'),
//                actions: <Widget>[
//                  FlatButton(
//                    child:  Text('OK'),
//                    onPressed: (){
//                      Navigator.pop(context);
//                    },
//                  )
//                ],
//              );
//            });

      return;
      }
      print('login: $login   senha: $senha ');

      setState(() {
        _progress = true;
      });

      final response = await LoginService.login(login, senha);

      if(response.isOK()){
        /**
         * Metodo que criei para abrir outra pagina
         */
        pushReplacement(context, HomePage());

      } else {
        alert(context, 'Error', response.msg);
      }

      setState(() {
        _progress = false;
      });

//      if(login.isEmpty || senha.isEmpty){
//        showDialog(
//            context: context,
//            builder: (context){
//              return AlertDialog(
//                title: Text('Erro'),
//                content: Text('Informe corretamente o login e senha'),
//                actions: <Widget>[
//                  FlatButton(
//                    child:  Text('OK'),
//                    onPressed: (){
//                      Navigator.pop(context);
//                    },
//                  )
//                ],
//              );
//            });
//      }
  }
}
