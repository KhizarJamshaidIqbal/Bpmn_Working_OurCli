class SugerCalculateModel {
  String? id;
  int sysTolic;
  int diasTolic;
  int pulse;
  String date;
  String time;
  SugerCalculateModel(
      {this.id,
      required this.sysTolic,
      required this.diasTolic,
      required this.pulse,
      required this.date,
      required this.time});

  SugerCalculateModel.fromMap(Map<String, dynamic> item)
      : id = item['id'].toString(),
        sysTolic = item["sysTolic"],
        diasTolic = item["diasTolic"],
        pulse = item["pulse"],
        date = item["date"],
        time = item["time"];
  Map<String, Object> tomap() {
    return {
      "sysTolic": sysTolic,
      "diasTolic": diasTolic,
      "pulse": pulse,
      "date": date,
      "time": time
    };
  }

  void setSugerList(SugerCalculateModel item) {}
}
