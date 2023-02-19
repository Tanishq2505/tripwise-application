class AttractionDetails {
  List<Points>? points;

  AttractionDetails({this.points});

  AttractionDetails.fromJson(Map<String, dynamic> json) {
    if (json['points'] != null) {
      points = <Points>[];
      json['points'].forEach((v) {
        points!.add(new Points.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.points != null) {
      data['points'] = this.points!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Points {
  Coordinates? coordinates;
  String? heading;
  String? title;
  String? type;
  Link? link;
  Image? image;
  String? description;

  Points(
      {this.coordinates,
      this.heading,
      this.title,
      this.type,
      this.link,
      this.image,
      this.description});

  Points.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    heading = json['heading'];
    title = json['title'];
    type = json['type'];
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    data['heading'] = this.heading;
    data['title'] = this.title;
    data['type'] = this.type;
    if (this.link != null) {
      data['link'] = this.link!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['description'] = this.description;
    return data;
  }
}

class Coordinates {
  double? lat;
  double? lon;

  Coordinates({this.lat, this.lon});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}

class Link {
  String? href;

  Link({this.href});

  Link.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Image {
  Null? url;
  String? alt;

  Image({this.url, this.alt});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['alt'] = this.alt;
    return data;
  }
}
