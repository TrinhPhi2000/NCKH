// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, dead_code
//import 'dart:js';

import 'dart:convert';

import 'package:canh_bao_hoc_vu/screen/diemthi.dart';
import 'package:canh_bao_hoc_vu/screen/gvcn.dart';
import 'package:canh_bao_hoc_vu/screen/hocphi.dart';
import 'package:canh_bao_hoc_vu/screen/lichhoc_diemdanh.dart';
import 'package:path/path.dart';
import 'student.dart';
import 'package:http/http.dart' as http;
import 'package:canh_bao_hoc_vu/screen/home_page.dart';
import 'package:canh_bao_hoc_vu/screen/student_detail.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'bottomNavyBar.dart';

// class CardItem{
//   final String urlImage;
//   final String title;

// const CardItem({
//   required this.urlImage,
//   required this.title
//  });
// }

// class CardItemSche{
//   final String title;
//   final String icon1;
//   final String icon2;
//   final String text1;
//   final String text2;
//   const CardItemSche({
//     required this.title,
//     required this.icon1,
//     required this.icon2,
//     required this.text1,
//     required this.text2,
//   });
// }

class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  // List<CardItem> items = [
  //   CardItem(
  //     urlImage: "assets/images/thongtinsinhvien.png",
  //     title: "THÔNG TIN SINH VIÊN"
  //   ),
  //    CardItem(
  //     urlImage: "assets/images/lichhocdiemdanh.png",
  //     title: "LỊCH HỌC/ ĐIỂM DANH"
  //   ),
  //    CardItem(
  //     urlImage: "assets/images/diemthi.png",
  //     title: "ĐIỂM THI"
  //   ),
  //    CardItem(
  //     urlImage: "assets/images/hocphi.png",
  //     title: "HỌC PHÍ"
  //   ),
  //   CardItem(
  //     urlImage: "assets/images/thongtinsinhvien.png",
  //     title: "GIẢNG VIÊN CHỦ NHIỆM"
  //   ),
  // ];
  // List<CardItemSche> item1 = [
  //   CardItemSche(
  //       title: "Toán cao cấp B1",
  //       icon1: "assets/images/dongho.png",
  //       icon2: "assets/images/diachi.png",
  //       text1: "7: 00",
  //       text2: "Phòng A31.105"),
  //   CardItemSche(
  //       title: "Lập trình web",
  //       icon1: "assets/images/dongho.png",
  //       icon2: "assets/images/diachi.png",
  //       text1: "13: 00",
  //       text2: "Phòng A31.101"),
  //   CardItemSche(
  //       title: "Xác xuất thống kê",
  //       icon1: "assets/images/dongho.png",
  //       icon2: "assets/images/diachi.png",
  //       text1: "17: 00",
  //       text2: "Phòng A27.4"),

  // ];

    var sv = [];
    
  @override
  Widget build(BuildContext context) {
    final  rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    sv = rcvdData['sv'];

    
    
    Future<void> sinhvien1() async{
          Navigator.pushNamed(context, '/sinhvien1', arguments: { "sv":sv,
          });
        
  }
  //  Future<void> sinhvien2() async{
  //         Navigator.pushNamed(context, '/sinhvien2', arguments: { "sv":sv,
  //         });
        
  // }
  Future<void> thoikhoabieu() async{
    
     var response = await http.post(
      Uri.parse("http://quanlyhocvu.tk/api/diemdanh?mssv=1911177&="
      ));

     var data = jsonDecode(response.body);
   
     //Navigator.push(context, MaterialPageRoute(builder: (context) => LichHocDiemDanh()));
     Navigator.pushNamed(context, '/thoikhoabieu',arguments: {"tkb":data["tkb"]});

     
  }
   Future<void> diem() async{
    
     var response = await http.post(
      Uri.parse("http://quanlyhocvu.tk/api/diem?mssv=1911177&="
      ));

     var data = jsonDecode(response.body);
   
     //Navigator.push(context, MaterialPageRoute(builder: (context) => LichHocDiemDanh()));
     Navigator.pushNamed(context, '/diem',arguments: {"diem":data["diem"],"sv":sv,});

     
  }
   Future<void> hocphi() async{
    
     var response = await http.post(
      Uri.parse("http://quanlyhocvu.tk/api/hocphi?mssv=1911177&="
      ));

     var data = jsonDecode(response.body);
   
     //Navigator.push(context, MaterialPageRoute(builder: (context) => LichHocDiemDanh()));
     Navigator.pushNamed(context, '/hocphi',arguments: {"hocphi":data["hocphi"],"sv":sv,});

     
  }
  Future<void> gvcn() async{
    
     var response = await http.post(
      Uri.parse("http://quanlyhocvu.tk/api/gvcn?mssv=1911177&="
      ));

     var data = jsonDecode(response.body);
     var gvcn = data["gvcn"];
      
 
     Navigator.pushNamed(context, '/gvcn',arguments: {"gvcn":gvcn});

     
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
                                              text: "MSSV:",
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
                              Container(
                                margin: EdgeInsets.only(
                                  top: 22,
                                  left: 30
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "3.7",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: "/4",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 10
                                      ),
                                      height: 15,
                                      width: 40,
                                      child: Text(
                                        "GPA",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 11),
                                        textAlign: TextAlign.center,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Color.fromRGBO(28, 42, 75, 100),
                                      ),
                                    )
                                  ],
                                ),
                              )
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
                                              child: Image.asset("assets/images/thongtinsinhvien.png",width: 30,height: 30,fit: BoxFit.cover,color: Colors.orange,)),
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
                                        // Container(
                                        
                                        // margin: EdgeInsets.all(15),
                                        // decoration: BoxDecoration(
                                        //   borderRadius: BorderRadius.circular(15),
                                        //   color: Color.fromRGBO(218, 222, 234, 100),
                                        // ),
                                        // child: Column(children: [
                                        //   Container(
                                        //     margin: EdgeInsets.all(20),
                                        //     child: Image.asset("assets/images/thongtinsinhvien.png",width: 30,height: 30,fit: BoxFit.cover,)),
                                        //   Container(
                                        //     child: Text("THỜI KHÓA BIỂU",
                                        //     style: TextStyle(
                                        //     color: Color(0xffb40284a),
                                        //     fontWeight: FontWeight.bold,
                                        //     fontSize: 15,
                                            
                                        //     ),
                                        //     ),
                                        //   )
                                        // ],),
                                        // ),

                                    ],
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      
                                      // mainAxisSpacing: 10,
                                      // crossAxisSpacing: 10,
                                      ),
                                  ),
                                ),
                              ),
                        ),
                        
                    
                       
                    //     Container(
                    //       margin: EdgeInsets.only(
                    //         top: 25,
                    //         left: 25,
                    //         right: 25
                    //       ),
                    //       height: 340,
                          
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                            
                    //         color: Color(0xffF9F9FB),
                            
                    //       ),
                    //       child: ListView.builder(
                    //         scrollDirection: Axis.vertical,
                    //         itemCount: 3,
                    //         itemBuilder: (context, index) => buildCardSche(item: item1[index]),
                    //         )
                    //       ),
                    //      Container(
                    //       margin: EdgeInsets.only(
                    //         top: 30,
                    //         left: 45
                    //       ),
                    //       padding: EdgeInsets.only(
                    //         left: 14,
                    //         right: 14,
                    //         top: 5,
                    //         bottom: 5
                    //       ),
                    //       child: Text("Hôm nay",
                    //       style: TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.white,
                    //                         fontSize: 11),
                    //                     textAlign: TextAlign.center,
                    //       ),
                    //       decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.all(
                    //                         Radius.circular(20)),
                    //                     color: Color(0xff1C2A4B),
                    //                   ),
                    //     ),
                    //     Container(
                    //       margin: EdgeInsets.only(
                    //         right: 200,
                    //         top: 200
                    //       ),
                    //       child: Center(
                    //         child: Text("Chức năng phổ biến",
                    //         style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 16,
                    //                     color: Color(0xff1C2A4B),
                    //                   ),
                    //         ),
                    //         ),
                    //     ),
                    //     // GestureDetector(
                    //     //   onTap: (){
                    //     //            Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetail()));
                    //     //         },
                    //      Container(
                    //         height: 100,
                    //         margin: EdgeInsets.only(
                    //           bottom: 10,
                    //           top: 460,
                    //           left: 25
                    //         ),
                    //         child: ListView.separated(
                    //           scrollDirection: Axis.horizontal,
                    //           itemCount: 5,
                    //           separatorBuilder: (context, _) => SizedBox(width: 22,),
                    //           itemBuilder: (context, index) => buildCard(item: items[index]),
                    //           )
                    //         ),
                        
                      //],
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
// Widget buildCardSche({
//   required CardItemSche item,
// }) => Container(
//   margin: EdgeInsets.only(
//     top: 1
//   ),
//   height: 100,
//   width: 325,

//   color: Color(0xffF9F9FB),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.only(
//               top: 25,
            
//               left: 20
//               ),
//             child: Text(
//               item.title,
//               style: TextStyle(
//                   color: Color(0xff1C2A4B),
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 5,left: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         child: Image.asset(item.icon1),
//                       ),
//                       Container(
//                           margin: EdgeInsets.only(left: 5),
//                           child: Text(
//                            item.text1,
//                             style: TextStyle(
//                                 fontSize: 13, color: Color(0xff818792)),
//                           )),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 60),
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         child: Image.asset(item.icon2),
//                       ),
//                       Container(
//                           margin: EdgeInsets.only(left: 5),
//                           child: Text(
//                             item.text2,
//                             style: TextStyle(
//                                 fontSize: 13, color: Color(0xff818792)),
//                           )),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
// );

// Widget buildCard({
//   required CardItem item,
// }) => Container(
//   width: 220,
//   height: 100,
//   decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         color: Color(0xffF9F9FB),
//       ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       Container(
//         height: 45,
//         width: 45,
//         margin: EdgeInsets.only(
//           left: 31,
//           top: 5
//         ),
//             child: Material(
//               child: Ink.image(
//                 image: NetworkImage(item.urlImage),
//                 fit: BoxFit.cover,
//                 child: InkWell(
//                   onTap: (){}, //=> Navigator.push(context, MaterialPageRoute(builder: (_) => StudentDetails()
//                   ),
//               )
//             )
//       ),
//       Container(
//         margin: EdgeInsets.only(
//           right: 30,
//           left: 10,
//           top: 35,
//           bottom: 28
//         ),
//         child: SizedBox(
//           height: 37,
//           width: 90,
//           child: Text(item.title,
//               style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.bold
//               ),
//             ),
//         ),
//       )
//     ],
//   ),

// );


