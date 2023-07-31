// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

MappingSettingModel eventsModelFromJson(String str) =>
    MappingSettingModel.fromJson(json.decode(str));

String eventsModelToJson(MappingSettingModel data) =>
    json.encode(data.toJson());

class MappingSettingModel {
  MappingSettingModel({
    required this.totalBusiness,
    required this.lotterySold,
    required this.lotteryCommission,
    required this.vendorTypes,
    required this.status,
  });

  LotteryCommission totalBusiness;
  LotteryCommission lotterySold;
  LotteryCommission lotteryCommission;
  List<VendorType> vendorTypes;
  String status;

  factory MappingSettingModel.fromJson(Map<String, dynamic> json) =>
      MappingSettingModel(
        totalBusiness: LotteryCommission.fromJson(json["total_business"]),
        lotterySold: LotteryCommission.fromJson(json["lottery_sold"]),
        lotteryCommission:
            LotteryCommission.fromJson(json["lottery_commission"]),
        vendorTypes: List<VendorType>.from(
            json["vendor_types"].map((x) => VendorType.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "total_business": totalBusiness.toJson(),
        "lottery_sold": lotterySold.toJson(),
        "lottery_commission": lotteryCommission.toJson(),
        "vendor_types": List<dynamic>.from(vendorTypes.map((x) => x.toJson())),
        "status": status,
      };
}

class LotteryCommission {
  LotteryCommission({
    required this.total,
    required this.qryType,
  });

  double total;
  int qryType;

  factory LotteryCommission.fromJson(Map<String, dynamic> json) =>
      LotteryCommission(
        total: json["total"].toDouble(),
        qryType: json["qry_type"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "qry_type": qryType,
      };
}

class VendorType {
  VendorType({
    required this.date,
    required this.amount,
    required this.vendorType,
    required this.qryType,
  });

  String date;
  String amount;
  String vendorType;
  int qryType;

  factory VendorType.fromJson(Map<String, dynamic> json) => VendorType(
        date: json["date"],
        amount: json["amount"],
        vendorType: json["vendor_type"],
        qryType: json["qry_type"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "amount": amount,
        "vendor_type": vendorType,
        "qry_type": qryType,
      };
}
