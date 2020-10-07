import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mainpage extends StatefulWidget {
  Mainpage({Key key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  final _formKey = GlobalKey<FormState>();

  String one, two;

  Future _result() async {
    if (one.toString().trim().contains(two.toString().trim())) {
      return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Result",
                style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
              ),
              content: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  one + ' = ' + two,
                  style: GoogleFonts.quicksand(),
                ),
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'OK',
                      style: GoogleFonts.quicksand(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    one = value;
                  },
                  decoration: InputDecoration(labelText: 'Enter string'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter string';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    two = value;
                  },
                  decoration: InputDecoration(labelText: 'Enter String'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter second string';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.only(left: 30, right: 30),
                child: ButtonTheme(
                  height: 40,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'RESULT',
                        style: GoogleFonts.quicksand(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.orange,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _result();
                        } else {}
                      }),
                ),
              ),
            ],
          )),
    );
  }
}
