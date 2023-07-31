class GetBusinessModal {
  String id;
  String name;
  String category;
  String city;
  String state;
  String corporation;
  GetBusinessModal(
      {required this.id,
      required this.name,
      required this.category,
      required this.city,
      required this.state,
      required this.corporation});

/*  factory GetBusinessModal.fromJson(Map<String, dynamic> json) =>
      GetBusinessModal(
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
