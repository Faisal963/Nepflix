import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/material.dart';


class JsonTestEasy extends StatefulWidget {
  // This class makes a stateful widget from stateless widget
  @override
  _JsonTestEasyState createState() => _JsonTestEasyState();

}

class _JsonTestEasyState extends State<JsonTestEasy> {

  Future date;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class Network{
  // Defining a variable
  final String url;
  Network(this.url);

  Future fetchData() async {
    print("$url");

    Response response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}


