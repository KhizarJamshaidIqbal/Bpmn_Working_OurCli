class SugerModel {
  String? id;
  int mgddl;
  String sateName;
  String date, time;
  SugerModel(
      {required this.id,
      required this.mgddl,
      required this.sateName,
      required this.date,
      required this.time});
  SugerModel.fromMap(Map<String, dynamic> item)
      : id = item['id'].toString(),
        mgddl = item["mgddl"],
        sateName = item["sateName"],
        date = item["date"],
        time = item["time"];
  Map<String, Object> tomap() {
    return {"mgddl": mgddl, "sateName": sateName, "date": date, "time": time};
  }
}