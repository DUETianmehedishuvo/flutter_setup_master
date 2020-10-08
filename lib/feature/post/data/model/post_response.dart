/// responseBody : {"status":true,"message":"Active Banner List"}
/// dataInfo : [{"id":1,"banner_title":"Banner 1","banner_image":"/admin/upload/banner/1574656278-slider1.jpg","web_link":"https://amarbebsha.com/","banner_position":"1","banner_active":1,"type":1,"created_at":"2019-11-25 10:31:18","updated_at":"2019-11-25 10:31:18"},{"id":2,"banner_title":"Banner 2","banner_image":"/admin/upload/banner/1574656294-slider2.jpg","web_link":"https://amarbebsha.com/","banner_position":"2","banner_active":1,"type":2,"created_at":"2019-11-25 10:31:34","updated_at":"2019-11-25 10:31:34"},{"id":3,"banner_title":"Banner 3","banner_image":"/admin/upload/banner/1574656308-slider3.jpg","web_link":"https://amarbebsha.com/","banner_position":"3","banner_active":1,"type":1,"created_at":"2019-11-25 10:31:48","updated_at":"2019-11-25 10:31:48"},{"id":4,"banner_title":"Banner 4","banner_image":"/admin/upload/banner/1574656323-slider4.jpg","web_link":"https://amarbebsha.com/","banner_position":"4","banner_active":1,"type":2,"created_at":"2019-11-25 10:32:03","updated_at":"2019-11-25 10:32:03"},{"id":5,"banner_title":"Banner 5","banner_image":"/admin/upload/banner/1574656294-slider2.jpg","web_link":"https://amarbebsha.com/","banner_position":"5","banner_active":1,"type":1,"created_at":"2019-11-25 10:32:20","updated_at":"2019-11-25 10:32:20"},{"id":7,"banner_title":"Banner 1","banner_image":"/admin/upload/banner/1574656278-slider1.jpg","web_link":"https://amarbebsha.com/","banner_position":"1","banner_active":1,"type":2,"created_at":"2019-11-25 10:31:18","updated_at":"2019-11-25 10:31:18"}]

class PostResponse {
  ResponseBody _responseBody;
  List<Post> _dataInfo;

  ResponseBody get responseBody => _responseBody;
  List<Post> get dataInfo => _dataInfo;

  PostResponse({
      ResponseBody responseBody, 
      List<Post> dataInfo}){
    _responseBody = responseBody;
    _dataInfo = dataInfo;
}

  PostResponse.fromJson(dynamic json) {
    _responseBody = json["responseBody"] != null ? ResponseBody.fromJson(json["responseBody"]) : null;
    if (json["dataInfo"] != null) {
      _dataInfo = [];
      json["dataInfo"].forEach((v) {
        _dataInfo.add(Post.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_responseBody != null) {
      map["responseBody"] = _responseBody.toJson();
    }
    if (_dataInfo != null) {
      map["dataInfo"] = _dataInfo.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// banner_title : "Banner 1"
/// banner_image : "/admin/upload/banner/1574656278-slider1.jpg"
/// web_link : "https://amarbebsha.com/"
/// banner_position : "1"
/// banner_active : 1
/// type : 1
/// created_at : "2019-11-25 10:31:18"
/// updated_at : "2019-11-25 10:31:18"

class Post {
  int _id;
  String _bannerTitle;
  String _bannerImage;
  String _webLink;
  String _bannerPosition;
  int _bannerActive;
  int _type;
  String _createdAt;
  String _updatedAt;

  int get id => _id;
  String get bannerTitle => _bannerTitle;
  String get bannerImage => _bannerImage;
  String get webLink => _webLink;
  String get bannerPosition => _bannerPosition;
  int get bannerActive => _bannerActive;
  int get type => _type;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Post({
      int id, 
      String bannerTitle, 
      String bannerImage, 
      String webLink, 
      String bannerPosition, 
      int bannerActive, 
      int type, 
      String createdAt, 
      String updatedAt}){
    _id = id;
    _bannerTitle = bannerTitle;
    _bannerImage = bannerImage;
    _webLink = webLink;
    _bannerPosition = bannerPosition;
    _bannerActive = bannerActive;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Post.fromJson(dynamic json) {
    _id = json["id"];
    _bannerTitle = json["banner_title"];
    _bannerImage = json["banner_image"];
    _webLink = json["web_link"];
    _bannerPosition = json["banner_position"];
    _bannerActive = json["banner_active"];
    _type = json["type"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["bannerTitle"] = _bannerTitle;
    map["bannerImage"] = _bannerImage;
    map["webLink"] = _webLink;
    map["bannerPosition"] = _bannerPosition;
    map["bannerActive"] = _bannerActive;
    map["type"] = _type;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    return map;
  }

}

/// status : true
/// message : "Active Banner List"

class ResponseBody {
  bool _status;
  String _message;

  bool get status => _status;
  String get message => _message;

  ResponseBody({
      bool status, 
      String message}){
    _status = status;
    _message = message;
}

  ResponseBody.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    return map;
  }

}