class UserModel {
  String? message;
  String? username;
  String? fullName;
  String? pictureURL;
  String? email;
  String? roleName;
  int? roleId;
  String? token;
  String? expiresOn;
  String? userId;
  String? branchId;
  String? clinicId;
  String? academicYearId;
  String? order;

  UserModel(
      {this.message,
      this.username,
      this.fullName,
      this.pictureURL,
      this.email,
      this.roleName,
      this.roleId,
      this.token,
      this.expiresOn,
      this.userId,
      this.branchId,
      this.clinicId,
      this.academicYearId,
      this.order});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    username = json['Username'];
    fullName = json['FullName'];
    pictureURL = json['PictureURL'];
    email = json['Email'];
    roleName = json['RoleName'];
    roleId = json['RoleId'];
    token = json['Token'];
    expiresOn = json['ExpiresOn'];
    userId = json['UserId'];
    branchId = json['BranchId'];
    clinicId = json['ClinicId'];
    academicYearId = json['AcademicYearId'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['Username'] = this.username;
    data['FullName'] = this.fullName;
    data['PictureURL'] = this.pictureURL;
    data['Email'] = this.email;
    data['RoleName'] = this.roleName;
    data['RoleId'] = this.roleId;
    data['Token'] = this.token;
    data['ExpiresOn'] = this.expiresOn;
    data['UserId'] = this.userId;
    data['BranchId'] = this.branchId;
    data['ClinicId'] = this.clinicId;
    data['AcademicYearId'] = this.academicYearId;
    data['order'] = this.order;
    return data;
  }
}
