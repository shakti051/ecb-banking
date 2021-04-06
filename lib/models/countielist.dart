class Country {
  String name;
  String alpha2Code;
  String alpha3Code;
  String callingcode;
  String flag;
  Country(
      {this.name,
      this.alpha2Code,
      this.alpha3Code,
      this.callingcode,
      this.flag});
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json["name"] as String,
      alpha2Code: json["alpha2Code"] as String,
      alpha3Code: json["alpha3Code"] as String,
      callingcode: json["callingcode"] as String,
      flag: json["flag"] as String,
    );
  }
}
