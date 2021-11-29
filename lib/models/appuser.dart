class AppUser {
  int? id;
  String? name;
  String? email;
  String? countryCode;
  String? mobile;
  int? cityId;
  int? otp;
  bool? existingUser;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  AppUser(
      {this.id,
      this.name,
      this.email,
      this.countryCode,
      this.mobile,
      this.cityId,
      this.otp,
      this.existingUser,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  AppUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    cityId = json['city_id'];
    otp = json['otp'];
    existingUser = json['existing_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  AppUser.fromLoginResponse(Map<String, dynamic> json) {
    id = json['user_id'];
    otp = json['otp'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    existingUser = json['existing_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['city_id'] = this.cityId;
    data['existing_user'] = this.existingUser;
    data['otp'] = this.otp;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['existing_user'] = this.existingUser;
    return data;
  }

  AppUser.fromOtpResponse(Map<String, dynamic> json, AppUser oldUser) {
    id = oldUser.id;
    name = oldUser.name;
    email = oldUser.email;
    countryCode = oldUser.countryCode;
    mobile = oldUser.mobile;
    cityId = oldUser.cityId;
    otp = oldUser.otp;
    existingUser = json['existing_user'];
    createdAt = oldUser.createdAt;
    updatedAt = oldUser.updatedAt;
    deletedAt = oldUser.deletedAt;
    existingUser = json['existing_user'];
  }
  AppUser.fromResendResponse(Map<String, dynamic> json, AppUser oldUser) {
    id = oldUser.id;
    name = oldUser.name;
    email = oldUser.email;
    countryCode = oldUser.countryCode;
    mobile = oldUser.mobile;
    cityId = oldUser.cityId;
    otp = json['otp'];
    existingUser = oldUser.existingUser;
    createdAt = oldUser.createdAt;
    updatedAt = oldUser.updatedAt;
    deletedAt = oldUser.deletedAt;
  }
  AppUser.fromUserDetails(Map<String, dynamic> json, AppUser oldUser) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    cityId = json['city_id'];
    otp = oldUser.id;
    existingUser = oldUser.existingUser;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    existingUser = oldUser.existingUser;
  }
}
