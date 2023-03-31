class RequestRegister {
  String? fullname;
  String? email;
  String? password;

  RequestRegister({
    this.fullname,
    this.email,
    this.password,
  });

  RequestRegister.fromJson(Map<String, dynamic> json) {
    fullname = json['fullName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullname;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
