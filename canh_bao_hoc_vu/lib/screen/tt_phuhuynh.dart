// ignore_for_file: prefer_const_constructors

import 'package:canh_bao_hoc_vu/screen/bottomNavyBar.dart';
import 'package:flutter/material.dart';

import 'bottomNavyBar.dart';
import 'home_page.dart';


class PhuHuynh extends StatefulWidget {
  const PhuHuynh({ Key? key }) : super(key: key);

  @override
  _PhuHuynhState createState() => _PhuHuynhState();
}

class _PhuHuynhState extends State<PhuHuynh> {
  
  @override
  Widget build(BuildContext context) {

    final rcvdData = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    final name = rcvdData['name'];
    final sodt = rcvdData['sodt'];
    final diachi = rcvdData['diachi'];
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(),
      body: Container(
       color: Color.fromRGBO(35, 175, 125, 0.85),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: 20,
                                top: 71,
                            ),
                            child:  ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: InkWell(
                                  child: Image.asset('assets/images/father.png',
                                fit: BoxFit.cover,
                              )
                              )
                            
                              
                            ),
                           
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 40
                            ),
                            child: Center(
                              child: Text(name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20, //17
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                          )
                        ],
                      ),
                    )
                   ),
                Expanded(
                    flex: 3,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                              border: Border.all(color: Colors.grey)),
                        ),
                        Container(
                          
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 80,
                                margin: EdgeInsets.only(top:20,left: 20,right: 20),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Color(0xffCCE4E6E5),width: 1))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text("Tên",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(name,
                                      style: TextStyle(
                                        color: Color(0xff818792),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    )
                                  ],
                                ),                               
                              ),
                              Container(
                                height: 80,
                                margin: EdgeInsets.only(left: 20,right: 20),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Color(0xffCCE4E6E5),width: 1))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text("Số điện thoại",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(sodt,
                                      style: TextStyle(
                                        color: Color(0xff818792),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    )
                                  ],
                                ),                               
                              ),
                              Container(
                                height: 80,
                                margin: EdgeInsets.only(left: 20,right: 20),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Color(0xffCCE4E6E5),width: 1))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text("Địa chỉ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(diachi,
                                      style: TextStyle(
                                        color: Color(0xff818792),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    
                                  ],
                                ),                               
                              ),
                             
                            ],
                          ),                          
                        ),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}