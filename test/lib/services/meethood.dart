class Currency {
  String? disclaimer;
  String? license;
  int? timestamp;
  String? base;
  Map<String, double>? rates;

  Currency(
      {this.disclaimer, this.license, this.timestamp, this.base, this.rates});

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
      disclaimer: json['disclaimer'],
      license: json['license'],
      timestamp: json['timestamp'],
      base: json['base'],
      rates: Map.from(json['rates'])
          .map((k, v) => MapEntry<String, double>(k, v.toDouble())));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disclaimer'] = this.disclaimer;
    data['license'] = this.license;
    data['timestamp'] = this.timestamp;
    data['base'] = this.base;
    if (this.rates != null) {
      data['rates'] = Map.from(rates!)
          .map((k, v) => MapEntry<String, double>(k, v.toDouble()));
    }
    return data;
  }
}
