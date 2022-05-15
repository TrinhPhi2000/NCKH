// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:canh_bao_hoc_vu/screen/bottomNavyBar.dart';
import 'package:flutter/material.dart';
class GVCN extends StatefulWidget {
  const GVCN({ Key? key }) : super(key: key);

  @override
  State<GVCN> createState() => _GVCNState();
}

class _GVCNState extends State<GVCN> {
  @override
  Widget build(BuildContext context) {
    var gvcn = [];
    final rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    gvcn = rcvdData['gvcn'];
    
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
                    child: Row(
                      
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 55, left: 30),
                            child: Image.asset(
                              "assets/images/back.png",
                            )
                            ),  
                        Container(
                          margin: EdgeInsets.only(
                            top: 89,
                            right: 30
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 20
                                ),
                                width: 70,
                                height: 70,
                                
                                    child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/student.png",
                                    fit: BoxFit.cover,
                                    width: 70,
                                    height: 70,
                                  ),
                                )
                              ),
                               Container(
                            margin: EdgeInsets.only(left: 15, bottom: 15),
                            child: Center(
                              child: Text(gvcn[0]["tengv"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20, //17
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                          ),
                              
                            ],
                          ),
                        ),
                      ],
                    )),
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
                                      child: Text("Tên giảng viên",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(gvcn[0]["tengv"],
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
                                      child: Text(gvcn[0]["sodt"],
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
                                      child: Text("Email",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(gvcn[0]["email"],
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