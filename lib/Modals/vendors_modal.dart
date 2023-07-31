class VendorsModal {
  String id;
  String vendorName;
  String vendorType;
  String departmentName;
  VendorsModal({
    required this.id,
    required this.vendorName,
    required this.vendorType,
    required this.departmentName,
  });

/*  factory VendorsModal.fromJson(Map<String, dynamic> json) =>
      VendorsModal(
        status: json["status"],
        data: List<dynamic>.from(json["data"].map((x) =>
            Map.from(x).map((k, v) => MapEntry<String, String>(k, v ?? null)))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => Map.from(x)
            .map((k, v) => MapEntry<String, dynamic>(k, v ?? null)))),
      };*/
}
