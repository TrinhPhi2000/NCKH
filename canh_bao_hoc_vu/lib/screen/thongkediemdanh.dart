// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:canh_bao_hoc_vu/screen/bottomNavyBar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CardItemTKDD{
  final String monHoc;
  final String diHoc;
  final String tongBuoi;
  final String tiLe;
   final String tiLeP;
  
  

const CardItemTKDD({
   required this.monHoc,
  required this.diHoc,
  required this.tongBuoi,
  required this.tiLe,
  required this.tiLeP,
  
  
 });
}
class ThongKeDiemDanh extends StatefulWidget {
  const ThongKeDiemDanh({ Key? key }) : super(key: key);

  @override
  State<ThongKeDiemDanh> createState() => _ThongKeDiemDanhState();
}

class _ThongKeDiemDanhState extends State<ThongKeDiemDanh> {
  String? selectedValueNamHoc;
  String? selectedValueHocKi;
  String? NamHocDay;
  String? HocKy;
  var tkdd1 = [];
  var tkdd2 = [];
  var  tongDiHoc = 0;
  var  tongBuoi = 0;
  var tiLeDiHoc = '0';
  
  List<String> itemNamHoc = ['2019-2020', '2020-2021', '2021-2022'];

  List<String> itemHocKy = ['1', '2', '3'];
  @override
  Widget build(BuildContext context) {
    var tkdd = [];
    var sv = [];
    final rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    sv = rcvdData['sv'];
   
    tkdd = rcvdData['tkdd'];
    
    
    List<CardItemTKDD> itemTKDD = [];
        for (var i = 0; i < tkdd2.length; i++) {
       
      itemTKDD.add(CardItemTKDD(
        
        monHoc: tkdd2[i]["tenhp"],
        diHoc: tkdd2[i]["tyledihoc"],
        tongBuoi:tkdd2[i]["tongbuoi"],
        tiLe: tkdd2[i]["tyledd"],
        tiLeP: tkdd2[i]["tylep"],
      ));
    }
    
  
   
   
    return Scaffold(
       bottomNavigationBar: BottomNavyBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              
              //height: 100,
              margin: EdgeInsets.only(top:60,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 25,right: 44),
                  child: Image.asset(
                    "assets/images/back.png",color: Colors.black,
                  ),
                ),
                Container(
                  
                  //margin: EdgeInsets.only(bottom: 30),
                  child: Text("THỐNG KÊ ĐIỂM DANH",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                      ),
                      ),
                    )
                  ],)
                ),
                 Container(
                                margin: EdgeInsets.only(top: 20),
                                //height: 100,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "NĂM HỌC",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff1C2A4B)),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Color(0xff40B78C))),
                                            padding: EdgeInsets.only(left: 5),
                                            margin: EdgeInsets.only(left: 11),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton2(
                                                hint: Text(
                                                  '2022-2023',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff1C2A4B)),
                                                ),
                                                items: itemNamHoc
                                                    .map((item) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                                value: selectedValueNamHoc,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedValueNamHoc =
                                                        value as String;
                                                    NamHocDay =
                                                        selectedValueNamHoc;
                                                  });
                                                  tkdd1=[];
                                                  tkdd.forEach((value) {
                                                    if (value["namhoc"] ==
                                                        NamHocDay) {
                                                     tkdd1.add(value);
                                                    }
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
                                            child: Text(
                                              "HỌC KỲ",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff1C2A4B)),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Color(0xff40B78C))),
                                            padding: EdgeInsets.only(left: 5),
                                            margin: EdgeInsets.only(left: 11),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton2(
                                                hint: Text(
                                                  'HỌC KỲ 1',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff1C2A4B)),
                                                ),
                                                items: itemHocKy
                                                    .map((item) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                                value: selectedValueHocKi,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedValueHocKi =
                                                        value as String;
                                                    HocKy = selectedValueHocKi;
                                                  });
                                                  tkdd2=[];
                                                  tkdd1.forEach((value) {
                                                    if (value["hocky"] ==
                                                        HocKy) {
                                                      tkdd2.add(value);
                                                    }
                                                  });
                                                   
                                                 print(tkdd2);
                                                var sum = 0;
                                                var soBuoiHoc = 0;
                                                for(var i = 0; i < tkdd2.length; ++i) {
                                                  sum = sum + int.parse(tkdd2[i]["tongbuoi"]);
                                                  soBuoiHoc = soBuoiHoc + int.parse(tkdd2[i]["tyledihoc"]);
                                                }
                                                  tongDiHoc = soBuoiHoc;
                                                  tongBuoi = sum;
                                                
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
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: CircularPercentIndicator(
                                  radius: 180,
                                  lineWidth: 20.0,
                                  percent: tongDiHoc/tongBuoi ,
                                  animation: true,
                                  animationDuration: 1200,
                                  //==0?1:tongBuoi
                                  center:  Text("${((tongDiHoc/tongBuoi)*100).toStringAsFixed(2)}  %",  style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),),
                                  progressColor: tongDiHoc/tongBuoi<0.5?Color(0xffFF7675):Color(0xff40B78C),
                                   footer: new Text(
                                      "Đã học ${tongDiHoc.toString()} / ${tongBuoi.toString()} buổi",
                                      style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                    ),
                                ),
                             ),
                             
                          Container(
                            height: 1000,
                            
                            child: Container(
                              margin: EdgeInsets.all(20),
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  //color: Color.fromRGBO(218, 222, 234, 100),
                              ),
                               child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: itemTKDD.length,
                                        itemBuilder: (context, index) =>
                                            buildCardTKB(item: itemTKDD[index]),
                                      )
                            ),
                          ),           
            
          ],
        ),
      ),
    );
  }
}
Widget buildCardTKB({
  required CardItemTKDD item,
}) => Container(
  height: 100,
   decoration: BoxDecoration(
                                //color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color.fromRGBO(218, 222, 234, 100),
                              ),
  margin: EdgeInsets.all(15),
 
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Container(
        child: Text(item.monHoc, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),),
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                   Container(
              child: Text("Đi học: ",style: TextStyle(
                            
                            fontSize: 14,
                          ),),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: RichText(                 
                    text: TextSpan(children: [
                      TextSpan(
                          text: item.diHoc,
                          style: TextStyle(
                            fontSize: 14,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "/",
                          style: TextStyle(
                             fontSize: 14,
                              fontWeight: FontWeight.bold)),        
                      TextSpan(
                          text: item.tongBuoi+ " buổi",
                          style: TextStyle(
                            fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ]),
                  ),
                ),
                ],
              ),
            ),
           
                Container(
                    child:  new LinearPercentIndicator(
                    animation: true,
              
                    animationDuration: 1000,
                    width: 120.0,
                    lineHeight: 18.0,
                    center: Text(item.tiLe),
                    percent: double.parse(item.tiLeP),
                    progressColor: double.parse(item.tiLeP)<0.5?Color(0xffFF7675):Color(0xff40B78C),
                    
                  ),
      )
          ],
        ),
      ),
     
       
    ],
  ),
);