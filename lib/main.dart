import 'package:flutter/material.dart';
import 'package:flutter_coldelabs_01/bd.dart';
import 'banco_de_dados/tiposdados.dart';
//import 'home.dart';
import 'page_view.dart/arquivo_page.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'banco_de_dados/homeBD.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'uSQi1tibqbYPbtsD26DsAdbu2GEyXGWSlh4s2Z5T';
  final keyClientKey = 'voXKXbRz4OjRr2wFXwL6VH1IjA4BmC2Aj1wa9UsU';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl, clientKey: keyClientKey, autoSendSessionId: true);

  var firstObject = ParseObject('FirstClass');
  firstObject.set(
    'message', 'Hey! O parse esta conectado'
  );
  firstObject.set('disciplinas', 'matematica');
  await firstObject.save();
  print('done');
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: Page_View(),
    //home: HomeBD(),
    home: TiposDados(),
    theme: ThemeData(hintColor: Colors.white),
  ));
}


