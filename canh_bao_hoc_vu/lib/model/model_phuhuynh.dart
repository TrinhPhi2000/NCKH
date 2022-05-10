class PhuHuynh {
  int? id;
  String? tenph;
  String? sodt;
  String? matkhau;
  String? diachi;
  String? createdAt;
  String? updatedAt;

  PhuHuynh(
      {this.id,
      this.tenph,
      this.sodt,
      this.matkhau,
      this.diachi,
      this.createdAt,
      this.updatedAt});

  PhuHuynh.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenph = json['tenph'];
    sodt = json['sodt'];
    matkhau = json['matkhau'];
    diachi = json['diachi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenph'] = this.tenph;
    data['sodt'] = this.sodt;
    data['matkhau'] = this.matkhau;
    data['diachi'] = this.diachi;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
