// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'package:canh_bao_hoc_vu/screen/bottomNavyBar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class HocPhi extends StatefulWidget {
  const HocPhi({ Key? key }) : super(key: key);

  @override
  State<HocPhi> createState() => _HocPhiState();
}

class _HocPhiState extends State<HocPhi> {
  String? selectedValue ;
  List<String> items = ['2019-2020','2020-2021','2021-2022'];
  @override
  Widget build(BuildContext context) {
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
                            margin: const EdgeInsets.only(bottom: 55, left: 30),
                            child: Image.asset(
                              "assets/images/back.png",
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 89, right: 30),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  width: 70,
                                  height: 70,
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/images/student.png",
                                      fit: BoxFit.cover,
                                      width: 70,
                                      height: 70,
                                    ),
                                  )),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 20, left: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: const Text(
                                        "Trinh Van An",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, right: 75),
                                      child: RichText(
                                        text: const TextSpan(children: [
                                          const TextSpan(
                                              text: "MSSV: ",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                          const TextSpan(
                                              text: "1812818",
                                              style: const TextStyle(
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
                                margin:
                                    const EdgeInsets.only(top: 22, left: 30),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: RichText(
                                        text: const TextSpan(children: [
                                          TextSpan(
                                              text: "3.7",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                          const TextSpan(
                                              text: "/4",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      height: 15,
                                      width: 40,
                                      child: const Text(
                                        "GPA",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 11),
                                        textAlign: TextAlign.center,
                                      ),
                                      decoration: const BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(20)),
                                        color: const Color.fromRGBO(
                                            28, 42, 75, 100),
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
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                              border: Border.all(color: Colors.grey)
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                      height: 100,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(left: 10),
                                                  child: Text("NĂM HỌC",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff1C2A4B)
                                                  ),
                                                  ),
                                                ),
                                                Container(
                                                  
                                                  decoration: BoxDecoration(
                                                    
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                     border: Border.all(
                                                    color: Color(0xff40B78C)) 
                                                  ),
                                                  padding: EdgeInsets.only(left: 5),
                                                  margin: EdgeInsets.only(left: 11),
                                                  child: DropdownButtonHideUnderline(
                                                     child: DropdownButton2(
                                                          hint: Text(
                                                            '2022-2023',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.bold,
                                                              color: Color(0xff1C2A4B)
                                                            ),
                                                          ),
                                                          items: items
                                                                  .map((item) =>
                                                                  DropdownMenuItem<String>(
                                                                    value: item,
                                                                    child: Text(
                                                                      item,
                                                                      style: const TextStyle(
                                                                        fontSize: 12,
                                                                      ),
                                                                    ),
                                                                  ))
                                                                  .toList(),
                                                          value: selectedValue,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              selectedValue = value as String;
                                                            });
                                                          },
                                                          buttonHeight: 30,
                                                          buttonWidth: 110,
                                                          itemHeight: 40,
                                                        ),
                                                  ),
                                                  
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(left: 10),
                                                  child: Text("HỌC KỲ",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff1C2A4B)
                                                  ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                     border: Border.all(
                                                    color: Color(0xff40B78C)) 
                                                  ),
                                                  padding: EdgeInsets.only(left: 5),
                                                  margin: EdgeInsets.only(left: 11),
                                                  child: DropdownButtonHideUnderline(
                                                     child: DropdownButton2(
                                                          hint: Text(
                                                            'HỌC KỲ 1',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.bold,
                                                              color: Color(0xff1C2A4B)
                                                            ),
                                                          ),
                                                          items: items
                                                                  .map((item) =>
                                                                  DropdownMenuItem<String>(
                                                                    value: item,
                                                                    child: Text(
                                                                      item,
                                                                      style: const TextStyle(
                                                                        fontSize: 12,
                                                                      ),
                                                                    ),
                                                                  ))
                                                                  .toList(),
                                                          value: selectedValue,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              selectedValue = value as String;
                                                            });
                                                          },
                                                          buttonHeight: 30,
                                                          buttonWidth: 110,
                                                          itemHeight: 40,
                                                        ),
                                                  ),   
                                                ),
                                               
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Center(child: Text("Đồng",
                                      style: TextStyle(
                                        color: Color(0xffFF7675),
                                        fontSize: 18,

                                      ),
                                      ),),
                                    ),
                                      Container(
                                      child: Center(child: Text("7,800,000",
                                      style: TextStyle(
                                        color: Color(0xffFF7675),
                                        fontSize: 50,
                                      ),
                                      ),),
                                    ),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 41,top: 36),
                                            child: Image.asset("assets/images/vanghoc.png"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 22,top: 36),
                                            child: Text("CHƯA ĐÓNG",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xffFF7675)
                                            ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                     Container(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 41,top: 36),
                                            child: Image.asset("assets/images/lich.png"),
                                          ),
                                          Container(
                                             margin: EdgeInsets.only(left: 22,top: 36),
                                            child: Text("10/01/2022",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xffE4A951)
                                            ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                   
                            ],
                          ),
                        )  
                      ],
                    )
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}