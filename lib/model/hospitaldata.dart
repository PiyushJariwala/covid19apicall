class HospitalData {
  bool? success;
  Data? data;
  String? lastRefreshed;
  String? lastOriginUpdate;

  HospitalData(
      {this.success, this.data, this.lastRefreshed, this.lastOriginUpdate});

  HospitalData.fromJson(Map<String, dynamic> json) {
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
  Summary? summary;
  List<Sources>? sources;
  List<Regional>? regional;

  Data({this.summary, this.sources, this.regional});

  Data.fromJson(Map<String, dynamic> json) {
    summary =
    json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    if (json['sources'] != null) {
      sources = <Sources>[];
      json['sources'].forEach((v) {
        sources!.add(new Sources.fromJson(v));
      });
    }
    if (json['regional'] != null) {
      regional = <Regional>[];
      json['regional'].forEach((v) {
        regional!.add(new Regional.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    if (this.sources != null) {
      data['sources'] = this.sources!.map((v) => v.toJson()).toList();
    }
    if (this.regional != null) {
      data['regional'] = this.regional!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summary {
  int? ruralHospitals;
  int? ruralBeds;
  int? urbanHospitals;
  int? urbanBeds;
  int? totalHospitals;
  int? totalBeds;

  Summary(
      {this.ruralHospitals,
        this.ruralBeds,
        this.urbanHospitals,
        this.urbanBeds,
        this.totalHospitals,
        this.totalBeds});

  Summary.fromJson(Map<String, dynamic> json) {
    ruralHospitals = json['ruralHospitals'];
    ruralBeds = json['ruralBeds'];
    urbanHospitals = json['urbanHospitals'];
    urbanBeds = json['urbanBeds'];
    totalHospitals = json['totalHospitals'];
    totalBeds = json['totalBeds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ruralHospitals'] = this.ruralHospitals;
    data['ruralBeds'] = this.ruralBeds;
    data['urbanHospitals'] = this.urbanHospitals;
    data['urbanBeds'] = this.urbanBeds;
    data['totalHospitals'] = this.totalHospitals;
    data['totalBeds'] = this.totalBeds;
    return data;
  }
}

class Sources {
  String? url;
  String? lastUpdated;

  Sources({this.url, this.lastUpdated});

  Sources.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['lastUpdated'] = this.lastUpdated;
    return data;
  }
}

class Regional {
  String? state;
  int? ruralHospitals;
  int? ruralBeds;
  int? urbanHospitals;
  int? urbanBeds;
  int? totalHospitals;
  int? totalBeds;
  String? asOn;

  Regional(
      {this.state,
        this.ruralHospitals,
        this.ruralBeds,
        this.urbanHospitals,
        this.urbanBeds,
        this.totalHospitals,
        this.totalBeds,
        this.asOn});

  Regional.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    ruralHospitals = json['ruralHospitals'];
    ruralBeds = json['ruralBeds'];
    urbanHospitals = json['urbanHospitals'];
    urbanBeds = json['urbanBeds'];
    totalHospitals = json['totalHospitals'];
    totalBeds = json['totalBeds'];
    asOn = json['asOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['ruralHospitals'] = this.ruralHospitals;
    data['ruralBeds'] = this.ruralBeds;
    data['urbanHospitals'] = this.urbanHospitals;
    data['urbanBeds'] = this.urbanBeds;
    data['totalHospitals'] = this.totalHospitals;
    data['totalBeds'] = this.totalBeds;
    data['asOn'] = this.asOn;
    return data;
  }
}
