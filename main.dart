import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Aula IFCE - PDM',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Aula demo IFCE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String meuTexto = "vazio";
  String meuPeso = "peso";
  String textoImc = "Ainda não calculei o IMC";

  TextEditingController controladorAltura = TextEditingController();
  TextEditingController controladorPeso = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;

//  Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         centerTitle: true,
//         title: Text("Estudantes presentes"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Ítalo Venêncio'),
//             Text('Bruna Rodrigues'),
//             Text('Marianny'),
//             Text('$_counter', style: Theme.of(context).textTheme.headline4),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );

  void calculaIMC(double peso, double altura) {
    double imc = peso / (altura * altura);

    setState(() {
      if (imc < 18.5) {
        textoImc = "Vc está abaixo do peso !";
      } else if ((imc >= 18.5) && (imc <= 24.9)) {
        textoImc = "Vc está com peso normal !";
      } else if ((imc >= 25) && (imc <= 29.9)) {
        textoImc = "Vc está com sobrepeso !";
      } else if ((imc >= 30) && (imc <= 39.9)) {
        textoImc = "Vc está obeso !";
      } else {
        textoImc = "Obesidade grave !";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("entrei no build");
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     debugPrint("cliquei");
      //   },
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.black,
      //   ),
      //   backgroundColor: Color.fromARGB(1, 60, 60, 60),
      // ),
      appBar: AppBar(
        title: Text("Meu aplicativo - IMC"),
        elevation: 10.0,
        centerTitle: true,
        backgroundColor: Colors.deepPurple, //Color.fromARGB(1, 60, 60, 60),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.person_outline,
                  size: 100.0, color: Color.fromARGB(200, 200, 100, 150)),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Calcula IMC",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              //Image.asset("images/person.png"),
              /*Container(
                height: 200,
                child: const Image(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 38.0, left: 50.0, right: 50.0),
                child: TextFormField(
                  key: _formKey,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "informe um valor";
                    }
                    if (value.length < 3) {
                      return "informe um valor maior";
                    }
                  },
                  cursorColor: Theme.of(context).cursorColor,
                  initialValue: "Altura",
                  maxLength: 10,
                  decoration: InputDecoration(
                      icon: Icon(Icons.favorite),
                      labelText: "labelText",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(Icons.check_circle)),
                  //controller: controladorAltura,
                  keyboardType: TextInputType.number,
                  readOnly: false,
                  onChanged: (texto) {
                    print(texto);
                    setState(() {
                      meuTexto = texto;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 38.0, left: 50.0, right: 50.0),
                child: TextFormField(
                  key: _formKey,
                  cursorColor: Theme.of(context).cursorColor,
                  initialValue: "Altura",
                  maxLength: 10,
                  decoration: InputDecoration(
                      icon: Icon(Icons.favorite),
                      labelText: "labelText",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(Icons.check_circle)),
                  //controller: controladorAltura,
                  keyboardType: TextInputType.number,
                  readOnly: false,
                  onSaved: (String? texto) {
                    print(texto);
                    setState(() {
                      meuTexto = texto!;
                    });
                  },
                  onChanged: (texto) {
                    print(texto);
                    setState(() {
                      meuTexto = texto;
                    });
                  },
                ),
              ),
              TextField(
                controller: controladorPeso,
                onChanged: (String peso) {
                  setState(() {
                    meuPeso = peso;
                  });
                },
              ),

              OutlinedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()){
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Dados processados com sucesso")));
                    }
                  },
                  icon: Icon(Icons.person_outline,
                      size: 12.0, color: Color.fromARGB(200, 200, 100, 150)),
                  label: Text("Calcular")),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: OutlinedButton(
                  onPressed: () {
                    print("cliquei no botao");
                    calculaIMC(double.parse(controladorPeso.text),
                        double.parse(controladorAltura.text));
                  },
                  child: Text(
                    "Calcular IMC",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Text(meuTexto),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Text(meuPeso),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Text(textoImc),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
