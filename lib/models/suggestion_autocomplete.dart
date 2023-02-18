class Suggestion {
  String? id;
  String? displayname;
  String? loctype;
  int? cid;
  int? rid;
  int? ctid;
  double? lat;
  double? lng;
  String? cc;
  String? country;
  String? rc;
  String? cityname;
  String? timezone;
  String? utc;
  String? ap;
  String? apicode;
  String? citynameshort;
  String? cityonly;
  DestinationImages? destinationImages;
  DisplayType? displayType;
  String? entityKey;
  String? indexId;
  String? kayakId;
  String? kayakType;
  String? locationname;
  String? name;
  String? objectID;
  String? placeID;
  String? ptid;
  String? region;
  String? searchFormPrimary;
  String? searchFormSecondary;
  String? secondary;
  String? shortdisplayname;
  String? smartyDisplay;

  Suggestion(
      {this.id,
      this.displayname,
      this.loctype,
      this.cid,
      this.rid,
      this.ctid,
      this.lat,
      this.lng,
      this.cc,
      this.country,
      this.rc,
      this.cityname,
      this.timezone,
      this.utc,
      this.ap,
      this.apicode,
      this.citynameshort,
      this.cityonly,
      this.destinationImages,
      this.displayType,
      this.entityKey,
      this.indexId,
      this.kayakId,
      this.kayakType,
      this.locationname,
      this.name,
      this.objectID,
      this.placeID,
      this.ptid,
      this.region,
      this.searchFormPrimary,
      this.searchFormSecondary,
      this.secondary,
      this.shortdisplayname,
      this.smartyDisplay});

  Suggestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayname = json['displayname'];
    loctype = json['loctype'];
    cid = json['cid'];
    rid = json['rid'];
    ctid = json['ctid'];
    lat = json['lat'];
    lng = json['lng'];
    cc = json['cc'];
    country = json['country'];
    rc = json['rc'];
    cityname = json['cityname'];
    timezone = json['timezone'];
    utc = json['utc'];
    ap = json['ap'];
    apicode = json['apicode'];
    citynameshort = json['citynameshort'];
    cityonly = json['cityonly'];
    destinationImages = json['destination_images'] != null
        ? new DestinationImages.fromJson(json['destination_images'])
        : null;
    displayType = json['displayType'] != null
        ? new DisplayType.fromJson(json['displayType'])
        : null;
    entityKey = json['entityKey'];
    indexId = json['indexId'];
    kayakId = json['kayakId'];
    kayakType = json['kayakType'];
    locationname = json['locationname'];
    name = json['name'];
    objectID = json['objectID'];
    placeID = json['placeID'];
    ptid = json['ptid'];
    region = json['region'];
    searchFormPrimary = json['searchFormPrimary'];
    searchFormSecondary = json['searchFormSecondary'];
    secondary = json['secondary'];
    shortdisplayname = json['shortdisplayname'];
    smartyDisplay = json['smartyDisplay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['displayname'] = this.displayname;
    data['loctype'] = this.loctype;
    data['cid'] = this.cid;
    data['rid'] = this.rid;
    data['ctid'] = this.ctid;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['cc'] = this.cc;
    data['country'] = this.country;
    data['rc'] = this.rc;
    data['cityname'] = this.cityname;
    data['timezone'] = this.timezone;
    data['utc'] = this.utc;
    data['ap'] = this.ap;
    data['apicode'] = this.apicode;
    data['citynameshort'] = this.citynameshort;
    data['cityonly'] = this.cityonly;
    if (this.destinationImages != null) {
      data['destination_images'] = this.destinationImages!.toJson();
    }
    if (this.displayType != null) {
      data['displayType'] = this.displayType!.toJson();
    }
    data['entityKey'] = this.entityKey;
    data['indexId'] = this.indexId;
    data['kayakId'] = this.kayakId;
    data['kayakType'] = this.kayakType;
    data['locationname'] = this.locationname;
    data['name'] = this.name;
    data['objectID'] = this.objectID;
    data['placeID'] = this.placeID;
    data['ptid'] = this.ptid;
    data['region'] = this.region;
    data['searchFormPrimary'] = this.searchFormPrimary;
    data['searchFormSecondary'] = this.searchFormSecondary;
    data['secondary'] = this.secondary;
    data['shortdisplayname'] = this.shortdisplayname;
    data['smartyDisplay'] = this.smartyDisplay;
    return data;
  }
}

class DestinationImages {
  String? imageJpeg;
  String? imageWebp;

  DestinationImages({this.imageJpeg, this.imageWebp});

  DestinationImages.fromJson(Map<String, dynamic> json) {
    imageJpeg = json['image_jpeg'];
    imageWebp = json['image_webp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_jpeg'] = this.imageJpeg;
    data['image_webp'] = this.imageWebp;
    return data;
  }
}

class DisplayType {
  String? type;
  String? displayName;

  DisplayType({this.type, this.displayName});

  DisplayType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['displayName'] = this.displayName;
    return data;
  }
}
