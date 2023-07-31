import 'dart:convert';

class ViewInvoiceModel {
  final String vendorId;
  final String vendorName;
  final String invoiceId;
  final String date;

  ViewInvoiceModel(
      {required this.vendorId,
      required this.vendorName,
      required this.invoiceId,
      required this.date});
}

// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

ViewInvoiceModel2 postsFromJson(String str) =>
    ViewInvoiceModel2.fromJson(json.decode(str));

String postsToJson(ViewInvoiceModel2 data) => json.encode(data.toJson());

class ViewInvoiceModel2 {
  ViewInvoiceModel2({
    required this.message,
    required this.data,
    required this.status,
  });

  String message;
  List<Datum> data;
  String status;

  factory ViewInvoiceModel2.fromJson(Map<String, dynamic> json) =>
      ViewInvoiceModel2(
        message: json["Message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "Status": status,
      };
}

class Datum {
  Datum({
    required this.serialNumber,
    this.vendorId,
    this.vendorName,
    this.invoiceId,
    this.invoice,
    this.date,
  });

  int serialNumber;
  String? vendorId;
  String? vendorName;
  String? invoiceId;
  String? invoice;
  String? date;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        serialNumber: json["serial_number"],
        vendorId: json["vendor_id"],
        vendorName: json["vendor_name"],
        invoiceId: json["invoice_id"] == null ? null : json["invoice_id"],
        invoice: json["invoice"] == null ? null : json["invoice"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "serial_number": serialNumber,
        "vendor_id": vendorId,
        "vendor_name": vendorName,
        "invoice_id": invoiceId == null ? null : invoiceId,
        "invoice": invoice == null ? null : invoice,
        "date": date,
      };
}

enum VendorName {
  COMCAST,
  HACKNEYRECATHENS,
  EAGLE_DISTRIBUTOR_COMP,
  CHAROKEE,
  C_STORE_MASTER,
  TH_STATE_WHOLE_SALE,
  SEVEN_UP,
  TENNESSEE_VALLEY_ICE,
  LIGGETT_VECTOR_BRANDS,
  ROCKWOOD_ELECTRIC_WATER_BILL,
  COCA_COLA,
  BDT_BEVERAGE,
  WHOLE_SALE_OUTLET,
  ROANE_COUNTY_NEWS,
  COUPONS,
  TRI_STAR_DISTRIBUTOR,
  RAFIDX_CHANGE,
  R_J_RAYNOLDS,
  TIR_STATE_WHOLE_SALE,
  NEW_TARZAN_WHOLESALE,
  ATM_QUICK_CASH,
  ONE_STOP_SUPPLY
}
