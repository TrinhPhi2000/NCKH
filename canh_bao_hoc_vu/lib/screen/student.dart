// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, dead_code
//import 'dart:js';

import 'dart:convert';

import 'package:canh_bao_hoc_vu/screen/diemthi.dart';
import 'package:canh_bao_hoc_vu/screen/gvcn.dart';
import 'package:canh_bao_hoc_vu/screen/hocphi.dart';
import 'package:canh_bao_hoc_vu/screen/lichhoc_diemdanh.dart';
import 'package:canh_bao_hoc_vu/screen/thongkediemdanh.dart';
import 'package:path/path.dart';
import 'student.dart';
import 'package:http/http.dart' as http;
import 'package:canh_bao_hoc_vu/screen/home_page.dart';
import 'package:canh_bao_hoc_vu/screen/student_detail.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'bottomNavyBar.dart';


class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
 

    var sv = [];
    
  @override
  Widget build(BuildContext context) {
    final  rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    sv = rcvdData['sv'];

    
    
    Future<void> sinhvien1() async{
          Navigator.pushNamed(context, '/sinhvien1', arguments: { "sv":sv,
          });
        
  }
  
  Future<void> thoikhoabieu() async{
    var mssv = sv[0]["masv"];
     var response = await http.post(
       
      Uri.parse("http://quanlyhocvu.tk/api/diemdanh?mssv=$mssv&="
      ));

     var data = jsonDecode(response.body);
  
   
     Navigator.pushNamed(context, '/thoikhoabieu',arguments: {"tkb":data["tkb"]});

     
  }
   Future<void> diem() async{
    var mssv = sv[0]["masv"];
     var response = await http.post(
       
      Uri.parse("http://quanlyhocvu.tk/api/diem?mssv=$mssv&="
      ));
      
     var response1 = await http.post(
       
      Uri.parse("http://quanlyhocvu.tk/api/diemrenluyen?mssv=$mssv&="
      ));

     var data = jsonDecode(response.body);
     var data1 = jsonDecode(response1.body);
   
     
     Navigator.pushNamed(context, '/diem',arguments: {"diem":data["diem"],"sv":sv,"diemrenluyen": data1["diemrenluyen"] });

     
  }
 
   Future<void> hocphi() async{
    var mssv = sv[0]["masv"];
    print(mssv);
     var response = await http.post(
      Uri.parse("http://quanlyhocvu.tk/api/hocphi?mssv=$mssv&="
      ));
    
     var data = jsonDecode(response.body);
      
     
     Navigator.pushNamed(context, '/hocphi',arguments: {"hocphi":data["hocphi"],"sv":sv,});

     
  }
  Future<void> gvcn() async{
    var mssv = sv[0]["masv"];
     var response = await http.post(
      Uri.parse("http://quanlyhocvu.tk/api/gvcn?mssv=$mssv&="
      ));

     var data = jsonDecode(response.body);
     var gvcn = data["gvcn"];
      
 
     Navigator.pushNamed(context, '/gvcn',arguments: {"gvcn":gvcn});

     
  }
  Future<void> tkdd() async{
    var mssv = sv[0]["masv"];
     var response = await http.post(
      Uri.parse("http://quanlyhocvu.tk/api/tkdd?mssv=$mssv&="
      ));
    
     var data = jsonDecode(response.body);
      
     
     Navigator.pushNamed(context, '/tkdd',arguments: {"tkdd":data["tkdd"],"sv":sv,});

     
  }
    
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
                            ),
                            
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
                              // Container(
                              //   margin: EdgeInsets.only(
                              //     top: 22,
                              //     left: 30
                              //   ),
                              //   child: Column(
                              //     children: <Widget>[
                              //       Container(
                              //         child: RichText(
                              //           text: TextSpan(children: [
                              //             TextSpan(
                              //                 text: "3.7",
                              //                 style: TextStyle(
                              //                     color: Colors.white,
                              //                     fontWeight: FontWeight.bold)),
                              //             TextSpan(
                              //                 text: "/4",
                              //                 style: TextStyle(
                              //                     color: Colors.white,
                              //                     fontWeight: FontWeight.bold)),
                              //           ]),
                              //         ),
                              //       ),
                              //       Container(
                              //         margin: EdgeInsets.only(
                              //           top: 10
                              //         ),
                              //         height: 15,
                              //         width: 40,
                              //         child: Text(
                              //           "GPA",
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.white,
                              //               fontSize: 11),
                              //           textAlign: TextAlign.center,
                              //         ),
                              //         decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.all(
                              //               Radius.circular(20)),
                              //           color: Color.fromRGBO(28, 42, 75, 100),
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 3,
                    child: Container(
                      // children: <Widget>[
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                              border: Border.all(color: Colors.grey)),
                              //child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: GridView(
                                    
                                    children: [
                                      
                                      GestureDetector(
                                        onTap: (){
                                          
                                          sinhvien1();
                                        },
                                        child: Container(
                                         
                                          margin: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Color.fromRGBO(218, 222, 234, 100),
                                          ),
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.all(20),
                                              child: Image.asset("assets/images/thongtinsinhvien.png",width: 30,height: 30,fit: BoxFit.cover,)),
                                            Container(
                                              margin: EdgeInsets.only(left: 30,right: 10),
                                              child: Text("THÔNG TIN SINH VIÊN",
                                              style: TextStyle(
                                              color: Color(0xffb40284a),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              
                                              ),
                                              ),
                                            )
                                          ],),
                                          ),
                                      ),
                                        GestureDetector(
                                          onTap: (){
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => LichHocDiemDanh()));
                                            thoikhoabieu();
                                          },
                                          child: Container(
                                          
                                          margin: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Color.fromRGBO(218, 222, 234, 100),
                                          ),
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.all(20),
                                              child: Image.asset("assets/images/lichhocdiemdanh.png",width: 30,height: 30,fit: BoxFit.cover,)),
                                            Container(
                                              margin: EdgeInsets.only(left: 30,right: 10),
                                              child: Text("LỊCH HỌC / ĐIỂM DANH",
                                              style: TextStyle(
                                              color: Color(0xffb40284a),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              
                                              ),
                                              ),
                                            )
                                          ],),
                                          ),
                                        ),
                                        GestureDetector(
                                        onTap: (){
                                          
                                          tkdd();
                                        },
                                        child: Container(
                                         
                                          margin: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Color.fromRGBO(218, 222, 234, 100),
                                          ),
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.all(20),
                                              child: Image.asset("assets/images/lich.png",width: 30,height: 30,fit: BoxFit.cover,)),
                                            Container(
                                              margin: EdgeInsets.only(left: 30,right: 10),
                                              child: Text("THÔNG KÊ ĐIỂM DANH",
                                              style: TextStyle(
                                              color: Color(0xffb40284a),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              
                                              ),
                                              ),
                                            )
                                          ],),
                                          ),
                                      ),
                                        GestureDetector(
                                          onTap: (){
                                            //sinhvien2();
                                            diem();
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => DiemThi()));
                                          },
                                          child: Container(
                                          
                                          margin: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Color.fromRGBO(218, 222, 234, 100),
                                          ),
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.all(20),
                                              child: Image.asset("assets/images/diemthi.png",width: 30,height: 30,fit: BoxFit.cover,)),
                                            Container(
                                              child: Text("ĐIỂM THI",
                                              style: TextStyle(
                                              color: Color(0xffb40284a),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              
                                              ),
                                              ),
                                            )
                                          ],),
                                          ),
                                        ),
                                        GestureDetector(
                                           onTap: (){
                                          hocphi();
                                          },
                                          child: Container(
                                          
                                          margin: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Color.fromRGBO(218, 222, 234, 100),
                                          ),
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.all(20),
                                              child: Image.asset("assets/images/hocphi.png",width: 30,height: 30,fit: BoxFit.cover,)),
                                            Container(
                                              child: Text("HỌC PHÍ",
                                              style: TextStyle(
                                              color: Color(0xffb40284a),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              
                                              ),
                                              ),
                                            )
                                          ],),
                                          ),
                                        ),
                                        GestureDetector(
                                           onTap: (){
                                             gvcn();
                                          },
                                          child: Container(
                                          
                                          margin: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Color.fromRGBO(218, 222, 234, 100),
                                          ),
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.all(20),
                                              child: Image.asset("assets/images/thongtinsinhvien.png",width: 30,height: 30,fit: BoxFit.cover,color: Color(0XFF74A2FC),)),
                                            Container(
                                              child: Text("THÔNG TIN GVCN",
                                              style: TextStyle(
                                              color: Color(0xffb40284a),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              
                                              ),
                                              ),
                                            )
                                          ],),
                                          ),
                                        ),
                                       

                                    ],
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      
                                    
                                      ),
                                  ),
                                ),
                              ),
                        ),
                        
                    
          
                )
                //),
              ],
            )
          ],
        ),
      ),
    );
     
    
  }
   
}
