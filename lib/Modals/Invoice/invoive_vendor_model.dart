// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

InvoiceVendorsModal postsFromJson(String str) =>
    InvoiceVendorsModal.fromJson(json.decode(str));

String postsToJson(InvoiceVendorsModal data) => json.encode(data.toJson());

class InvoiceVendorsModal {
  InvoiceVendorsModal({
    required this.vendor,
    required this.status,
  });

  List<Vendor> vendor;
  String status;

  factory InvoiceVendorsModal.fromJson(Map<String, dynamic> json) =>
      InvoiceVendorsModal(
        vendor:
            List<Vendor>.from(json["vendor"].map((x) => Vendor.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "vendor": List<dynamic>.from(vendor.map((x) => x.toJson())),
        "status": status,
      };
}

class Vendor {
  Vendor({
    required this.id,
    required this.vendorName,
    required this.departmentName,
  });

  String id;
  String vendorName;
  String departmentName;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        vendorName: json["vendor_name"],
        departmentName: json["department_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_name": vendorName,
        "department_name": departmentName,
      };
}

// class InvoiceVendorsModal {
//   String id;
//   String vendorName;
//   String departmentName;
//   InvoiceVendorsModal({
//     required this.id,
//     required this.vendorName,
//     required this.departmentName,
//   });
// }
