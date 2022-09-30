
import 'package:flutter/material.dart';

class meuDrawer extends StatefulWidget {
  const meuDrawer({ Key? key, }) : super(key: key);

  @override
  State<meuDrawer> createState() => _meuDrawerState();
}

class _meuDrawerState extends State<meuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person,size: 60)),
            accountName: Text("italo"), 
            accountEmail: Text("italo.venancio@gmail.com")),
          ListTile(
              leading: Icon(Icons.person_add_alt),
              title: Text("Arquivos"),
              trailing: Icon(Icons.backup_rounded),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text("Title do Alerta"),
                      content: Text("Conteudo do Alerta"),
                      actions: [
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {},
                        ),
                        OutlinedButton.icon(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                          label: Text("adicionar")
                        )
                      ],
                    );
                  }
                );
              },
              ),
          ],
      
      ) );
    }
}