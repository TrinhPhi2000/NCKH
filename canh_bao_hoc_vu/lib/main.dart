// ignore_for_file: file_names, prefer_const_constructors, avoid_web_libraries_in_flutter
import 'dart:convert';
// import 'package:canh_bao_hoc_vu/model/model_phuhuynh.dart';
import 'package:canh_bao_hoc_vu/screen/diemthi.dart';
import 'package:canh_bao_hoc_vu/screen/gvcn.dart';
import 'package:canh_bao_hoc_vu/screen/hocphi.dart';
import 'package:canh_bao_hoc_vu/screen/lichhoc_diemdanh.dart';
import 'package:canh_bao_hoc_vu/screen/reset_password.dart';
import 'package:canh_bao_hoc_vu/screen/student_detail.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'screen/home_page.dart';
import 'screen/student.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:canh_bao_hoc_vu/screen/tt_phuhuynh.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(
   DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);
  


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "OpenSans"
      ),
      
      routes: {
        '/homepage' : (context) => HomePage(),
        '/phuhuynh': (context) => PhuHuynh(),
        '/sinhvien': (context) => StudentDetails(),
        '/sinhvien1': (context) => StudentDetail(),
        '/sinhvien2':(context) => DiemThi(),
        //'sinhvien1': (context) => StudentDetail(),
        '/thoikhoabieu': (context)=> LichHocDiemDanh(),
        '/diem':(context) => DiemThi(),
        '/hocphi':(context) =>HocPhi(),
        '/gvcn':(context) => GVCN(),
         
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: LoginPage(

          ),
        ),
      ),
    );
  }
}
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var sdtController = TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(
                    left: 24,
                    right: 26,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: 25,
                          top: 73,
                          right: 25,
                        ),
                        child: Center(
                          child: Image.asset("assets/images/school_login.png"),
                        ),
                      ),
    
                    ],
                  )
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          bottom: 25,
                          right: 198
                      ),
                      child:  Center(
                        child: Text(
                          "Đăng Nhập",
                          style: TextStyle(
                              color: Color(0xffb40284a),
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        bottom: 60,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                top: 20,
                                left: 24,
                                right: 26,
                                bottom: 20
                            ),
                            child: TextField(
                              controller: sdtController,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                  icon: Icon(Icons.phone),
                                  hintText: "Số điện thoại",
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.4)
                                  )
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 24,
                              right: 26,
                            ),
                            child: TextField(
                              controller: passController,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                  icon: Icon(Icons.vpn_key),
                                  hintText: "Mật khẩu",
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.4)
                                  )
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
                child: Column(
                  children: <Widget>[
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
                          login();
                          
                        },
                        child: Text(
                          "ĐĂNG NHẬP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: RawMaterialButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ResetPassWord()));
                        },
                        child: Text("Quên mật khẩu ?",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                    
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 26,
                        top: 31,
                        right: 26,
                        bottom: 47,
                      ),
                      child: Center(
                        child: Text(
                          "Phụ huynh sử dụng số điện thoại đã đăng kí với nhà trường để đăng nhập",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.4)
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
  
  Future<void> login() async{
    if(passController.text.isNotEmpty && sdtController.text.isNotEmpty){
     
      try {
        var response = await http.post(
      Uri.parse("http://quanlyhocvu.tk/api/login?sdt="
       + sdtController.text + "&password=" + passController.text));
     var data = jsonDecode(response.body);
     var pa = data["phuhuynh"];
     var sv = data["sinhvien"];
     var isLogin = false;
     
          Navigator.pushNamed(context, '/homepage', arguments: {"name":pa['tenph'], 
          "sodt":pa['sodt'], "diachi":pa['diachi'], "sv": sv});
         
          //Navigator.pushNamed(context, 'home/sinhvien',arguments: {"tensv":sv['tensv'],"masv":sv['masv']});
         print("Dang nhap thanh cong!");
      } on Exception catch (_) {
            ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content:  Text("Sai tài khoản hoặc mật khẩu !!"),backgroundColor: Colors.red,));
        }
        
      }
    
      
      
        
    //  var response1 = await http.get(Uri.parse("https://db8e-13-72-106-213.ngrok.io/api/sinhvien"));
    //  var data1 = jsonDecode(response1.body);
    //  var sv = data1.map((entry) => (entry)).toList();
    //  var tensv = "";
    //  var masv = "";
    //  for(var sv1 in sv){
    //    if(sv1['maph1'] == pa['sodt']){
    //      Navigator.pushNamed(context, 'homepage', arguments: { "tensv":sv1['tensv'], "masv":sv1['masv']});
    //    }
    //  }
     
    //  if(!isLogin){
    //       print("Thông tin sai!!");
    //       ScaffoldMessenger.of(context)
    //        .showSnackBar(SnackBar(content:  Text("Sai tài khoản hoặc mật khẩu !!")));
    //     }
    //  }
     }
  }
