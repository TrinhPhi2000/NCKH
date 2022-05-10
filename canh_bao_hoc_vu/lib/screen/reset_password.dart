// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter/widgets.dart';

class ResetPassWord extends StatefulWidget {
  const ResetPassWord({ Key? key }) : super(key: key);

  @override
  State<ResetPassWord> createState() => _ResetPassWordState();
}

class _ResetPassWordState extends State<ResetPassWord> {
  var sdtController = TextEditingController();
  var mssvController = TextEditingController();
  var tensvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LẤY LẠI MẬT KHẨU",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          
        ),
        ),
        backgroundColor: Color.fromRGBO(35, 175, 125, 0.85),
        
      ),
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Số điện thoại phụ huynh",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 20, left: 24, right: 26, bottom: 20),
                    child: TextField(
                      controller: sdtController,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          icon: Icon(Icons.phone),
                          hintText: "Ví dụ: 0399860369",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.4))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Mã số sinh viên",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 20, left: 24, right: 26, bottom: 20),
                    child: TextField(
                      controller: mssvController,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          icon: Icon(Icons.phone),
                          hintText: "Ví dụ: 1812818",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.4))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Tên sinh viên",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 20, left: 24, right: 26, bottom: 20),
                    child: TextField(
                      controller: tensvController,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          icon: Icon(Icons.phone),
                          hintText: "Ví dụ: Nguyễn Văn Nam",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.4))),
                    ),
                  ),
                 Container(
                    margin: EdgeInsets.only(
                     
                      left: 62,
                      right: 63,
                    ),
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(35, 175, 125, 0.85)
                    ),
                    child: RawMaterialButton(
                      onPressed: () {
                        resetpassword();
                      },
                      child: Text(
                        "GỬI YÊU CẦU",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
  Future<void> resetpassword() async{
    if(mssvController.text.isNotEmpty && sdtController.text.isNotEmpty&& tensvController.text.isNotEmpty){
     var response = await http.post(
      Uri.parse("http://db8e-13-72-106-213.ngrok.io/api/reset-password?sdt="
       + sdtController.text + "&mssv=" + mssvController.text+ "&tenSv=" + tensvController.text));
     var data = jsonDecode(response.body);
     
    
     
}
  }
}