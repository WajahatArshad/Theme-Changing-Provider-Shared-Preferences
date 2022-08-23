class UserModel {
  String? fullName;
  String? emailId;
  String? profilePic;
  String? userId;

  UserModel({
    this.fullName,
    this.emailId,
    this.profilePic,
    this.userId,
  });

// Receving Data From The Server

  UserModel.fromMap(Map<String, dynamic> map) {
    fullName = map['fullName'];
    emailId = map['emailId'];
    profilePic = map['profilePic'];
    userId = map['userId'];
  }

  // Sending Data To The Server

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'emailId': emailId,
      'profilePic': profilePic,
      'userId': userId,
    };
  }
}
