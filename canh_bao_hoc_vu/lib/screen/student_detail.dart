// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'bottomNavyBar.dart';

class StudentDetail extends StatefulWidget {
  const StudentDetail({ Key? key }) : super(key: key);
  

  @override
  _StudentDetailState createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  var sv = [];
  @override
  Widget build(BuildContext context) {
    final  rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    sv = rcvdData['sv'];
    
    
    
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
                              bottom: 20,
                              right: 10
                                // left: 35,
                                // top: 35,
                                // right: 20
                            ),

                            child:  ClipRRect(
                              
                              // borderRadius: BorderRadius.circular(20),
                              child: InkWell(                                
                                  child: Image.asset('assets/images/thongtinsinhvien.png', height: 40, width: 40,
                                  
                                fit: BoxFit.cover,
                                color: Colors.white,
                              ),
                              
                              )
                            ),
                           
                          ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 20,
                                  left: 18
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        sv[0]["tensv"],
                                        style: TextStyle(
                                            color:
                                                Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 10,
                                        right: 75
                                      ),
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "MSSV: ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                          TextSpan(
                                              text: sv[0]["masv"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                        ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                        //       Container(
                        //         margin: EdgeInsets.only(
                        //           top: 22,
                        //           left: 30
                        //         ),
                        //         child: Column(
                        //           children: <Widget>[
                        //             Container(
                        //               child: RichText(
                        //                 text: TextSpan(children: [
                        //                   TextSpan(
                        //                       text: "3.7",
                        //                       style: TextStyle(
                        //                           color: Colors.white,
                        //                           fontWeight: FontWeight.bold)),
                        //                   TextSpan(
                        //                       text: "/4",
                        //                       style: TextStyle(
                        //                           color: Colors.white,
                        //                           fontWeight: FontWeight.bold)),
                        //                 ]),
                        //               ),
                        //             ),
                        //             Container(
                        //               margin: EdgeInsets.only(
                        //                 top: 10
                        //               ),
                        //               height: 15,
                        //               width: 40,
                        //               child: Text(
                        //                 "GPA",
                        //                 style: TextStyle(
                        //                     fontWeight: FontWeight.bold,
                        //                     color: Colors.white,
                        //                     fontSize: 11),
                        //                 textAlign: TextAlign.center,
                        //               ),
                        //               decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.all(
                        //                     Radius.circular(20)),
                        //                 color: Color.fromRGBO(28, 42, 75, 100),
                        //               ),
                        //             )
                        //           ],
                        //         ),
                        //       )
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
                                      child: Text("Tên",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(sv[0]["tensv"],
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
                                      child: Text("MSSV",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(sv[0]["masv"],
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
                                      child: Text("Lớp",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    Container(
                                      child: Text("CTK42",
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
                                      child: Text("Ngày Sinh",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    Container(
                                      child: Text("06-06-2000",//sv[0]["ngaysinh"],
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