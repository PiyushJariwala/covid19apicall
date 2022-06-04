class HelpData {
  bool? success;
  Data? data;
  String? lastRefreshed;
  String? lastOriginUpdate;

  HelpData(
      {this.success, this.data, this.lastRefreshed, this.lastOriginUpdate});

  HelpData.fromJson(Map<String, dynamic> json) {
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
  Contacts? contacts;

  Data({this.contacts});

  Data.fromJson(Map<String, dynamic> json) {
    contacts = json['contacts'] != null
        ? new Contacts.fromJson(json['contacts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contacts != null) {
      data['contacts'] = this.contacts!.toJson();
    }
    return data;
  }
}

class Contacts {
  Primary? primary;
  List<Regional>? regional;

  Contacts({this.primary, this.regional});

  Contacts.fromJson(Map<String, dynamic> json) {
    primary =
    json['primary'] != null ? new Primary.fromJson(json['primary']) : null;
    if (json['regional'] != null) {
      regional = <Regional>[];
      json['regional'].forEach((v) {
        regional!.add(new Regional.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.primary != null) {
      data['primary'] = this.primary!.toJson();
    }
    if (this.regional != null) {
      data['regional'] = this.regional!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Primary {
  String? number;
  String? numberTollfree;
  String? email;
  String? twitter;
  String? facebook;
  List<String>? media;

  Primary(
      {this.number,
        this.numberTollfree,
        this.email,
        this.twitter,
        this.facebook,
        this.media});

  Primary.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    numberTollfree = json['number-tollfree'];
    email = json['email'];
    twitter = json['twitter'];
    facebook = json['facebook'];
    media = json['media'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['number-tollfree'] = this.numberTollfree;
    data['email'] = this.email;
    data['twitter'] = this.twitter;
    data['facebook'] = this.facebook;
    data['media'] = this.media;
    return data;
  }
}

class Regional {
  String? loc;
  String? number;

  Regional({this.loc, this.number});

  Regional.fromJson(Map<String, dynamic> json) {
    loc = json['loc'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loc'] = this.loc;
    data['number'] = this.number;
    return data;
  }
}
