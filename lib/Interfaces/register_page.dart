import 'dart:io';

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{

  BuildContext context;

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  bool _loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String userName = "";
  String password = "";

  String _errorMessage = "";
  File imageFile;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.cyan[300],
                    Colors.cyan[800]
                  ],
                )
            ),
            child: Image.asset(
              "assets/registerLogo.png",
              color: Colors.white,
              height: 250,
            ),
          ),
          Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                SizedBox(
                  child: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    iconTheme: IconThemeData(color: Colors.white),
                  ),
                  height: kToolbarHeight + 25,
                ),
                Center(
                  child: Transform.translate(
                    offset: Offset(0, -40),
                    child: SingleChildScrollView(
                      child: Card(
                        elevation: 2,

                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.only(left: 20, right: 20, top: 260, bottom: 20),
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(labelText: "Usuario:"),
                                onSaved: (value){
                                  userName = value;
                                },
                                validator: (value){
                                  if(value.isEmpty){
                                    return "Este campo es obligatorio";
                                  }
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: InputDecoration(labelText: "Contraseña:"),
                                obscureText: true,
                                onSaved: (value){
                                  password = value;
                                },
                                validator: (value){
                                  if(value.isEmpty){
                                    return "Este campo es obligatorio";
                                  }
                                },
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Genero",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        RadioListTile(
                                          title: Text(
                                              "Masculino",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        RadioListTile(
                                          title: Text(
                                            "Femenino",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Theme(
                                data: Theme.of(context).copyWith(accentColor: Colors.white),
                                child: RaisedButton(
                                  color: Theme.of(context).primaryColor,
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  textColor: Colors.white,
                                  onPressed: (){},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Registrar"),

                                      if(_loading)
                                        Container(
                                          height: 20,
                                          width: 20,
                                          margin: const EdgeInsets.only(left: 20),
                                          child: CircularProgressIndicator(),
                                        )
                                    ],
                                  ),

                                ),
                              ),
                              if(_errorMessage.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    _errorMessage,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                              SizedBox(height: 20,),



                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }

}