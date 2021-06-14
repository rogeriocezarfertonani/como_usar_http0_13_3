import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class exeHttpResponse extends StatefulWidget {
  const exeHttpResponse({Key? key}) : super(key: key);

  @override
  _exeHttpResponseState createState() => _exeHttpResponseState();
}

class _exeHttpResponseState extends State<exeHttpResponse> {
  // link da api :
  //https://api.giphy.com/v1/gifs/trending?api_key=FL5Op3l9jsLkQ94aguwHQjjBzMCKIcDi&limit=25&rating=g
  // Vou Usar o PIPE para separa quem é quem na url
  //https://|api.giphy.com |/v1/gifs/trending| ?{api_key=FL5Op3l9jsLkQ94aguwHQjjBzMCKIcDi&|limit=25|&|rating=g}
  //           authority      unencodedPath                          keys
  //authority = 'api.giphy.com'
  //unencodedPath = '/v1/gifs/trending'
  // keys: {'api_key' : FL5Op3l9jsLkQ94aguwHQjjBzMCKIcDi&}
  //        'limit' : '25'
  //         'rating'='g'
  // as informções do link ficam assim  url 'dominio(autoridade)','caminho',{chave:valor}

  var urlDaApi = Uri.https('api.giphy.com', '/v1/gifs/trending', {
    'api_key': 'FL5Op3l9jsLkQ94aguwHQjjBzMCKIcDi',
    'limit': '25',
    'rating': 'g'
  });

  Future _respostaApi() async {
    var resposta = await http.get(urlDaApi);
    return json.decode(resposta.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _respostaApi().then((map) => print(map));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
