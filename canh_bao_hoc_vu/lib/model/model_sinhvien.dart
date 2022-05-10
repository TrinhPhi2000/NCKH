import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
class SinhVien {
  String? masv;
  String? tensv;
  Null? ngaysinh;
  Null? maph1;
  Null? maph2;
  String? createdAt;
  String? updatedAt;
  Null? quanheph1;
  Null? quanheph2;

  SinhVien(
      {this.masv,
      this.tensv,
      this.ngaysinh,
      this.maph1,
      this.maph2,
      this.createdAt,
      this.updatedAt,
      this.quanheph1,
      this.quanheph2});

  SinhVien.fromJson(Map<String, dynamic> json) {
    masv = json['masv'];
    tensv = json['tensv'];
    ngaysinh = json['ngaysinh'];
    maph1 = json['maph1'];
    maph2 = json['maph2'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    quanheph1 = json['quanheph1'];
    quanheph2 = json['quanheph2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['masv'] = this.masv;
    data['tensv'] = this.tensv;
    data['ngaysinh'] = this.ngaysinh;
    data['maph1'] = this.maph1;
    data['maph2'] = this.maph2;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['quanheph1'] = this.quanheph1;
    data['quanheph2'] = this.quanheph2;
    return data;
  }
}


List<SinhVien> parsePhoto(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>; 
  List<SinhVien> photos = list.map((model) => SinhVien.fromJson(model)).toList();
  return photos;
}
Future<List<SinhVien>> fetchPhotos() async{
  //final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  final response = await http.get(Uri.parse('https://88c1-13-72-106-213.ngrok.io/api/sinhvien'));
  if(response.statusCode == 200){
    return compute(parsePhoto,response.body);
  }else{
    throw Exception("Loi !!!");
  }
}