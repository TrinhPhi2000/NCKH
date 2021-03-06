// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:canh_bao_hoc_vu/screen/bottomNavyBar.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:dialog/dialog.dart';

class CardItemDiem {
  final String namhoc;
  final String tenHocPhan;
  final String diemTong;
  final String quyDoi;
  final String ketQua;
  final String chiTiet;

  const CardItemDiem({
    required this.namhoc,
    required this.tenHocPhan,
    required this.diemTong,
    required this.quyDoi,
    required this.ketQua,
    required this.chiTiet,
  });
}

class DiemThi extends StatefulWidget {
  const DiemThi({Key? key}) : super(key: key);

  @override
  State<DiemThi> createState() => _DiemThiState();
}

class _DiemThiState extends State<DiemThi> {
  String? selectedValueNamHoc;
  String? selectedValueHocKi;
  String? NamHocDay;
  String? HocKy;
  var diem1 = [];
  var diem2 = [];
  var diemHe10 = '0';
  var tongTinChi = 0;
  var diemHe4 = '0';
  var diemRenLuyen = 0;
  var xepLoai = '';
  List<String> itemNamHoc = ['2019-2020', '2020-2021', '2021-2022'];

  List<String> itemHocKy = ['1', '2', '3'];
  @override
  Widget build(BuildContext context) {
    var diem = [];
    var sv = [];
    var diemrenluyen = [];
    final rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    sv = rcvdData['sv'];
    
    diem = rcvdData['diem'];
    List<DataRow> arr = [];
    diemrenluyen = rcvdData['diemrenluyen'];

    diem2.forEach((element) {
      arr.add(
      DataRow(
        cells: <DataCell>[
          DataCell(Text(
            element["tenhp"],
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(element["Diemtk"])),
          DataCell(Text(element["diemquydoi"])),
          DataCell(Container(
                              margin: EdgeInsets.only(left: 22),
                              child: element["TrangThai"]=="Đạt"?Image.asset(
                                  "assets/images/dadiemdanh.png",
                                ):Image.asset(
                                  "assets/images/vanghoc.png",
                                ),
                            ),),
         
        ],
      ),
    );
    });
   
  

    return Scaffold(
      bottomNavigationBar: const BottomNavyBar(),
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
                                margin:
                                    const EdgeInsets.only(top: 20, left: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child:  Text(
                                        sv[0]["tensv"],
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
                                        text:  TextSpan(children: [
                                           TextSpan(
                                              text: "MSSV: ",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                           TextSpan(
                                              text:  sv[0]["masv"],
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
                        //       Container(
                        //         margin:
                        //             const EdgeInsets.only(top: 22, left: 30),
                        //         child: Column(
                        //           children: <Widget>[
                        //             Container(
                        //               child: RichText(
                        //                 text: const TextSpan(children: [
                        //                   TextSpan(
                        //                       text: "3.7",
                        //                       style: const TextStyle(
                        //                           color: Colors.white,
                        //                           fontWeight: FontWeight.bold)),
                        //                   const TextSpan(
                        //                       text: "/4",
                        //                       style: TextStyle(
                        //                           color: Colors.white,
                        //                           fontWeight: FontWeight.bold)),
                        //                 ]),
                        //               ),
                        //             ),
                        //             Container(
                        //               margin: const EdgeInsets.only(top: 10),
                        //               height: 15,
                        //               width: 40,
                        //               child: const Text(
                        //                 "GPA",
                        //                 style: TextStyle(
                        //                     fontWeight: FontWeight.bold,
                        //                     color: Colors.white,
                        //                     fontSize: 11),
                        //                 textAlign: TextAlign.center,
                        //               ),
                        //               decoration: const BoxDecoration(
                        //                 borderRadius: const BorderRadius.all(
                        //                     const Radius.circular(20)),
                        //                 color: const Color.fromRGBO(
                        //                     28, 42, 75, 100),
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
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: const Radius.circular(25),
                                topRight: const Radius.circular(25),
                              ),
                              border: Border.all(color: Colors.grey)),
                          child: Column(
                            children: <Widget>[
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
                                                  diem1=[];
                                                  diem.forEach((value) {
                                                    if (value["namhoc"] ==
                                                        NamHocDay) {
                                                      diem1.add(value);
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
                                                  diem2=[];
                                                  diem1.forEach((value) {
                                                    if (value["hocky"] ==
                                                        HocKy) {
                                                      diem2.add(value);
                                                    }
                                                  });
                                                   var _diemHe10 = 0.0;
                                                    var _diemHe4 = 0.0;
                                                    for(var i = 0; i< diem2.length; i++) {
                                                      _diemHe10 = _diemHe10 + double.parse(diem2[i]["Diemtk"])*int.parse(diem2[i]["stc"]);
                                                      tongTinChi = tongTinChi + int.parse(diem2[i]["stc"]);
                                                      _diemHe4 = _diemHe4 + double.parse(diem2[i]["diemtkhe4"])*int.parse(diem2[i]["stc"]);
                                                    }
                                                    _diemHe10 = _diemHe10/tongTinChi;
                                                    _diemHe4 = _diemHe4/tongTinChi;
                                                    diemHe10 = _diemHe10.toStringAsFixed(2);
                                                    diemHe4 = _diemHe4.toStringAsFixed(2);
                                                  diemRenLuyen = int.parse(diemrenluyen[0]['diem']);
                                                  xepLoai = diemrenluyen[0]['xeploai'];
                                                  
                                                
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
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                //scrollDirection: Axis.vertical,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: DataTable(
                                    columns: const <DataColumn>[
                                      DataColumn(
                                        label: Text(
                                          'Tên Học Phần',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Điểm Tổng',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Quy đổi',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Kết Quả',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      
                                    ],
                                    rows: arr
                                  ),
                                ),
                                // child: Table(
                                //   children: <TableRow>[
                                //     _tableRow
                                //   ],
                                // ),
                              ),
                              SingleChildScrollView(
                                child: Container(
                                  //height: 230,
                                  margin: EdgeInsets.all(24),

                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border:
                                          Border.all(color: Color(0xffE4E6E5))),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left: 11, top: 10),
                                                child: Image.asset(
                                                  "assets/images/cham.png",
                                                  height: 7,
                                                  width: 7,
                                                )),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 7, top: 10),
                                              child: Text(
                                                "Điểm trung bình học kỳ(hệ 10): ",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text(
                                                diemHe10,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left: 11, top: 10),
                                                child: Image.asset(
                                                  "assets/images/cham.png",
                                                  height: 7,
                                                  width: 7,
                                                )),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 7, top: 10),
                                              child: Text(
                                                "Điểm trung bình học kỳ(hệ 4): ",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text(
                                                diemHe4,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left: 11, top: 10),
                                                child: Image.asset(
                                                  "assets/images/cham.png",
                                                  height: 7,
                                                  width: 7,
                                                )),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 7, top: 10),
                                              child: Text(
                                                "Điểm rèn luyện: ",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text(
                                                diemRenLuyen.toString(),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left: 11, top: 10),
                                                child: Image.asset(
                                                  "assets/images/cham.png",
                                                  height: 7,
                                                  width: 7,
                                                )),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 7, top: 10),
                                              child: Text(
                                                "Xếp loại: ",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text(
                                               xepLoai,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
