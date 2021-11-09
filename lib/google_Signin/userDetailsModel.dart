class UserDetailsModel {
  String? displayName;
  String? email;
  String? photoURL;

  UserDetailsModel({this.displayName, this.email, this.photoURL});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    photoURL = json['photoURL'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mapData = Map<String, dynamic>();
    mapData['displayName'] = this.displayName;
    mapData['email'] = this.email;
    mapData['photoURL'] = this.photoURL;
    return mapData;
  }
}
