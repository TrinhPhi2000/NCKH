// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:html';

import 'package:canh_bao_hoc_vu/screen/bottomNavyBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class CardItemTKB{
  final String gio;
  final String monHoc;
  final String tenGV;
  final String phongHoc;
  final String tiet;
  final String diemDanh;
  

const CardItemTKB({
  required this.gio,
  required this.monHoc,
  required this.tenGV,
  required this.phongHoc,
  required this.tiet,
  required this.diemDanh,
  
 });
}

class LichHocDiemDanh extends StatefulWidget {
  const LichHocDiemDanh({ Key? key }) : super(key: key);

  @override
  State<LichHocDiemDanh> createState() => _LichHocDiemDanhState();
}

class _LichHocDiemDanhState extends State<LichHocDiemDanh> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  final availableLocalesForDateFormatting = const ['vi_VN'];
    var tkb = [];
    var tkbnew = [];
    var ngay = [];
    
    
  @override
  Widget build(BuildContext context) {
      
      
        List<CardItemTKB> item2 = [];
        for (var i = 0; i < tkbnew.length; i++) {
       
      item2.add(CardItemTKB(
        gio: tkbnew[i]["tiet"],
        monHoc: tkbnew[i]["tenhp"],
        tenGV: tkbnew[i]["giaovien"],
        phongHoc:tkbnew[i]["phong"],
        tiet: tkbnew[i]["dahoc"],
        diemDanh:tkbnew[i]["trangthai"],
      ));
    }
   

    final  rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    
    tkb = rcvdData['tkb'];
   for (var i = 0; i < tkb.length; i++) {
     ngay.add(tkb[i]["ngay"]);
     
   }
    print(ngay);
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
                  child: Text("LỊCH HỌC / ĐIỂM DANH",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                  ),
                )
              ],)
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15),
                   border: Border.all(color: Color(0xffE4E6E5))
                ),
                child: TableCalendar(
                 
           
               
                locale: 'vi_VN',
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                
                focusedDay: focusedDay,
                
                calendarFormat: format,
                
                
               onFormatChanged: (CalendarFormat _format){
                 setState(() {
                   format = _format;
                 });
               },
               
              
               startingDayOfWeek: StartingDayOfWeek.monday,
               daysOfWeekVisible: true,
               
               // Thay doi ngay
               onDaySelected: (DateTime selectDay, DateTime focusDay){
                 setState(() {
                   selectedDay = selectDay;
                   focusedDay = focusDay;
                 });
                 //print(selectedDay);
                 var day = focusedDay.toString().split(" ")[0];
                 tkbnew.clear();
                 //print(day);
                 tkb.forEach((element) {
                   if(element["ngay"]==day){
                     tkbnew.add(element);
                     
                   }
                 });
                
               },
               selectedDayPredicate: (DateTime date){
                 var formatter = new DateFormat('yyyy-MM-dd');
                 String formatterDate = formatter.format(date);
                 return ngay.contains(formatterDate);
                 
               },
               
              
               // style
               calendarStyle: CalendarStyle(
                 isTodayHighlighted: true,
                 selectedDecoration: BoxDecoration(
                   color: Colors.red,
                   shape: BoxShape.circle,
                 ),
                 selectedTextStyle: TextStyle(color: Colors.white)
              
                   
                
               ),
               
               headerStyle: HeaderStyle(formatButtonVisible: false,titleCentered: true),
              )
              
              ),
              
            ),
            Container(
              height: 500,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: item2.length,
                  itemBuilder: (context, index) =>
                      buildCardTKB(item: item2[index]),
                )
            ),
            
          ],
        ),
      ),
    );
  }
 Widget buildCardTKB({
    required CardItemTKB item,
 }) => Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            "assets/images/line.png", 
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(item.gio,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                      ],
                    ),
                   
                  ),
                  Container(
                   margin: EdgeInsets.all(20),
                    height: 180,
                    decoration: BoxDecoration(
                       //color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Color(0xffE4E6E5))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          //margin: EdgeInsets.only(left: 0),
                          
                          child: Text(item.monHoc,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          ),
                        ),
                        Container(
                          child: Row(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 22),
                              child: Image.asset(
                                  "assets/images/thongtinsinhvien.png",height: 14,
                                ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 13),
                              child: Text(item.tenGV,
                              style: TextStyle(
                                color: Color(0xff818792),
                                fontSize: 15
                              ),
                              ),
                            ),
                          ],),
                        ),
                        Container(
                          child: Row(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 22),
                              child: Image.asset(
                                  "assets/images/vitri.png",
                                ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 13),
                              child: Text(item.phongHoc,
                              style: TextStyle(
                                color: Color(0xff818792),
                                fontSize: 15
                              ),
                              ),
                            ),
                          ],),
                        ),
                        Container(
                          child: Row(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 22),
                              child: Image.asset(
                                  "assets/images/tiethoc.png",
                                ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 13),
                              child: Text(item.tiet,
                              style: TextStyle(
                                color: Color(0xff818792),
                                fontSize: 15
                              ),
                              ),
                            ),
                          ],),
                        ),
                        Container(
                          child: Row(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 22),
                              child: item.diemDanh=="Đã Điểm Danh"?Image.asset(
                                  "assets/images/dadiemdanh.png",
                                ):Image.asset(
                                  "assets/images/vanghoc.png",
                                ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 13),
                              child: Text(item.diemDanh,
                              style: TextStyle(
                                color: item.diemDanh=="Đã Điểm Danh"?Colors.green:Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                          ],),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
}
   