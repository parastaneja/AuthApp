import 'package:flutter/cupertino.dart';

class User{
  int? UserId;
  String? FirstName;
  String? LastName;
  String? PhoneNumber;
  String? EmailID;
  String? UserName;
  String? Password;
  int? StateID;
  String? StateName;
  int? CityID;
  String? CityName;
  int? SecurityQuestionID;
  String? SecurityAnswer;
  int? ZipID;
  String? ZipName;
  int? Status;

  User(
      {this.UserId,this.FirstName,this.LastName,this.PhoneNumber,this.EmailID,this.UserName,this.Password,this.StateID,this.StateName,this.CityID,this.CityName,this.SecurityQuestionID,this.SecurityAnswer,this.ZipID,this.ZipName,this.Status});

  User.fromJson(Map<String, dynamic> json) {
    UserId = json['UserId'];
    FirstName = json['FirstName'];
    LastName = json['LastName'];
    PhoneNumber = json['PhoneNumber'];
    EmailID = json['EmailID'];
    UserName = json['UserName'];
    Password = json['Password'];
    StateID = json['StateID'];
    StateName = json['StateName'];
    CityID = json['CityID'];
    CityName = json['CityName'];
    SecurityQuestionID = json['SecurityQuestionID'];
    SecurityAnswer = json["SecurityAnswer"];
    ZipID = json['ZipID'];
    ZipName = json['ZipName'];
    Status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = new Map<String, dynamic>();
    user['UserId'] = this.UserId;
    user['FirstName'] = this.FirstName;
    user['LastName'] = this.LastName;
    user['PhoneNumber'] = this.PhoneNumber;
    user['EmailID'] = this.EmailID;
    user['UserName'] = this.UserName;
    user['Password'] = this.Password;
    user['StateID'] = this.StateID;
    user['StateName'] = this.StateName;
    user['CityID'] = this.CityID;
    user['CityName'] = this.CityName;
    user['SecurityQuestionID'] = this.SecurityQuestionID;
    user['SecurityAnswer'] = this.SecurityAnswer;
    user['ZipID'] = this.ZipID;
    user['ZipName'] = this.ZipName;
    user['Status'] = this.Status;
    return user;
  }
}
