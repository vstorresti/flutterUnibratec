import 'package:flutter/material.dart';
import '../model/person.dart';
import '../model/personDAO.dart';

class DetailPage extends StatefulWidget {
  Person person;

  DetailPage({this.person});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final _controllerName = TextEditingController(text: widget.person?.name);
    final _controllerCity = TextEditingController(text: widget.person?.city);
    final _controllerAddress = TextEditingController(text: widget.person?.address);
    bool isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text("Person Details"),


      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(4.0),
            child: TextField(
                controller: _controllerName,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
              ),
          ),

          Padding(
            padding: EdgeInsets.all(4.0),
            child: TextField(
              controller: _controllerCity,
              decoration: InputDecoration(
                labelText: "City",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(4.0),
            child: TextField(
              controller: _controllerAddress,
              decoration: InputDecoration(
                labelText: "Address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ),
            ),
          ),

          new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              RaisedButton(
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {

                  if(_controllerName.text.isEmpty || _controllerCity.text.isEmpty || _controllerAddress.text.isEmpty){
                    isEmpty = true;
                  }else{
                    isEmpty = false;
                  }

                  if(widget.person == null){
                    widget.person = Person(name: _controllerName.text, city: _controllerCity.text, address: _controllerAddress.text);

                  }else{
                    widget.person.name = _controllerName.text;
                    widget.person.city = _controllerCity.text;
                    widget.person.address = _controllerAddress.text;

                  }

                  if(isEmpty == true) {
                    showAlertDialog(context);
                  }else{
                  PersonDAO().insert(person: widget.person);
                     Navigator.pop(context);
                  }

                },
                child: Text("Save"),
              ),

              RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  if(widget.person != null){
                    PersonDAO().delete(widget.person.id);
                    Navigator.pop(context);
                  }else{
                    showAlertDialog2(context);
                  }
                },
                child: Text("Remove"),
              ),
            ]
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context)
{

  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("ERRO"),
    content: Text("Todos os campos devem ser preenchidos!"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog2(BuildContext context)
{

  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("ERRO"),
    content: Text("Este registro não pode ser removido pois não possui dados no banco."),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
