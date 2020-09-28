class Result {
  Result({
    this.date,
    this.result,
    this.bmi,
    this.bmr,
    this.ibw,
  });

  final String date;
  final String result;
  final String bmi;
  final String bmr;
  final String ibw;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        date: json["date"],
        result: json["result"],
        bmi: json["bmi"],
        bmr: json["bmr"],
        ibw: json["ibw"],
      );

  Map<String, dynamic> toMap() => {
        "date": date,
        "result": result,
        "bmi": bmi,
        "bmr": bmr,
        "ibw": ibw,
      };
}
