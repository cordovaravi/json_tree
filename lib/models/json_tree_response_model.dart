// To parse this JSON data, do
//
//     final jsonTreeResponseModel = jsonTreeResponseModelFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators, prefer_if_null_operators, constant_identifier_names, prefer_conditional_assignment

import 'dart:convert';

JsonTreeResponseModel jsonTreeResponseModelFromJson(String str) =>
    JsonTreeResponseModel.fromJson(json.decode(str));

class JsonTreeResponseModel {
  JsonTreeResponseModel({
    this.rawJson,
  });

  List<RawJson>? rawJson;

  factory JsonTreeResponseModel.fromJson(Map<String, dynamic> json) =>
      JsonTreeResponseModel(
        rawJson:
            List<RawJson>.from(json["rawJson"].map((x) => RawJson.fromJson(x))),
      );
}

class RawJson {
  RawJson({
    this.id,
    this.parentId,
    this.name,
    this.username,
    this.mObileNo,
    this.emailAddress,
    this.status,
    this.userType,
    this.category,
    this.kycStatus,
    this.totalAchiEvedIncome,
    this.totalExpectedIncome,
    this.packageName,
    this.packageAmount,
    this.createdOn,
    this.children,
    this.j,
    this.i,
  });

  int? id;
  dynamic parentId;
  String? name;
  String? username;
  String? mObileNo;
  String? emailAddress;
  int? status;
  UserType? userType;
  String? category;
  int? kycStatus;
  double? totalAchiEvedIncome;
  double? totalExpectedIncome;
  String? packageName;
  double? packageAmount;
  CreatedOn? createdOn;
  List<Child>? children;
  dynamic j;
  dynamic i;

  factory RawJson.fromJson(Map<String, dynamic> json) => RawJson(
        id: json["Id"],
        parentId: json["parentId"],
        name: json["Name"],
        username: json["Username"],
        mObileNo: json["M obileNo"],
        emailAddress: json["EmailAddress"],
        status: json["Status"],
        userType: userTypeValues.map[json["UserType"]],
        category: json["Category"],
        kycStatus: json["KYCStatus"],
        totalAchiEvedIncome: json["TotalAchi evedIncome"].toDouble(),
        totalExpectedIncome: json["TotalExpectedIncome"].toDouble(),
        packageName: json["PackageName "],
        packageAmount: json["PackageAmount"].toDouble(),
        createdOn: createdOnValues.map[json["CreatedOn"]],
        children:
            List<Child>.from(json["Children"].map((x) => Child.fromJson(x))),
        j: json["j"],
        i: json["i"],
      );
}

class Child {
  Child({
    this.id,
    this.parentId,
    this.name,
    this.username,
    this.mobileNo,
    this.emailAddress,
    this.status,
    this.userType,
    this.category,
    this.kycStatus,
    this.totalAchievedIncome,
    this.childTotalExpectedIncome,
    this.packageName,
    this.packageAmount,
    this.createdOn,
    this.children,
    this.j,
    this.i,
    this.parentID,
    this.totalExpectedIncoMe,
    this.totalExpectedIncome,
    this.childParentId,
  });

  int? id;
  int? parentId;
  String? name;
  String? username;
  String? mobileNo;
  String? emailAddress;
  int? status;
  UserType? userType;
  Category? category;
  int? kycStatus;
  double? totalAchievedIncome;
  double? childTotalExpectedIncome;
  String? packageName;
  double? packageAmount;
  CreatedOn? createdOn;
  List<Child>? children;
  int? j;
  dynamic i;
  int? parentID;
  double? totalExpectedIncoMe;
  double? totalExpectedIncome;
  int? childParentId;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json["Id"],
        parentId: json["parentId"] == null ? null : json["parentId"],
        name: json["Name"],
        username: json["Username"],
        mobileNo: json["MobileNo"],
        emailAddress: json["EmailAddress"],
        status: json["Status"],
        userType: userTypeValues.map[json["UserType"]],
        category: categoryValues.map[json["Category"]],
        kycStatus: json["KYCStatus"],
        totalAchievedIncome: json["TotalAchievedIncome"].toDouble(),
        childTotalExpectedIncome:
            json["TotalExpectedIncome "] ?? json["TotalExpectedInco me"],
        packageName: json["PackageName"] == null ? null : json["PackageName"],
        packageAmount: json["PackageAmount"] == null
            ? null
            : json["PackageAmount"].toDouble(),
        createdOn: createdOnValues.map[json["CreatedOn"]],
        children:
            List<Child>.from(json["Children"].map((x) => Child.fromJson(x))),
        j: json["j"] == null ? null : json["j"],
        i: json["i"],
        parentID: json["parentI d"] == null ? null : json["parentI d"],
        // totalExpectedIncoMe: json["TotalExpectedInco me"] == null
        //     ? null
        //     : json["TotalExpectedInco me"],
        totalExpectedIncome: json["TotalExpectedIncome"] == null
            ? null
            : json["TotalExpectedIncome"] ?? json["TotalExpectedInco me"],
        childParentId: json["parentId "] == null ? null : json["parentId "],
      );
}

enum Category { MEMBER, CATEGORY_MEMBER, MEM_BER }

final categoryValues = EnumValues({
  "Member": Category.CATEGORY_MEMBER,
  "Member ": Category.MEMBER,
  "Mem ber": Category.MEM_BER
});

enum CreatedOn { THE_00010101_T00_0000, CREATED_ON_00010101_T00_0000 }

final createdOnValues = EnumValues({
  "0001- 01- 01T00:00:00": CreatedOn.CREATED_ON_00010101_T00_0000,
  "0001-01- 01T00:00:00": CreatedOn.THE_00010101_T00_0000
});

enum UserType { USER }

final userTypeValues = EnumValues({"User": UserType.USER});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap!;
  }
}
