class Class_data {
  final String level;
  final String result;

  Class_data({
    required this.level,
    required this.result,
  });
  /*factory Class_data.fromMap(Map<String, dynamic> json) {
    return Class_data(json['level'], json['result']);
  }*/
  factory Class_data.fromJson(Map<String, dynamic> json) {
    return Class_data(
      level: json['level'], 
      result: json['result']
      );
  }
}