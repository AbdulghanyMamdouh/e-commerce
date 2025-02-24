class RegisterRequest {
  String? name;
  String? email;
  String? password;

  String? phone;

  RegisterRequest({
    this.name,
    this.email,
    this.password,
    this.phone,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'rePassword': password,
        'phone': phone,
      };
}
