class TestingData {
  bool? success;
  Data? data;
  String? lastRefreshed;
  String? lastOriginUpdate;

  TestingData(
      {this.success, this.data, this.lastRefreshed, this.lastOriginUpdate});

  TestingData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    lastRefreshed = json['lastRefreshed'];
    lastOriginUpdate = json['lastOriginUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['lastRefreshed'] = this.lastRefreshed;
    data['lastOriginUpdate'] = this.lastOriginUpdate;
    return data;
  }
}

class Data {
  String? day;
  int? totalSamplesTested;
  Null? totalIndividualsTested;
  Null? totalPositiveCases;
  String? source;

  Data(
      {this.day,
        this.totalSamplesTested,
        this.totalIndividualsTested,
        this.totalPositiveCases,
        this.source});

  Data.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    totalSamplesTested = json['totalSamplesTested'];
    totalIndividualsTested = json['totalIndividualsTested'];
    totalPositiveCases = json['totalPositiveCases'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['totalSamplesTested'] = this.totalSamplesTested;
    data['totalIndividualsTested'] = this.totalIndividualsTested;
    data['totalPositiveCases'] = this.totalPositiveCases;
    data['source'] = this.source;
    return data;
  }
}
