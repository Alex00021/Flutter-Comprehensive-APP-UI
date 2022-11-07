class FriendModel {
 late List<FriendModelData> data;

  FriendModel({required this.data});

  FriendModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] != null) {
      data = [];
      for (var v in (json["data"] as List)) {data.add(FriendModelData.fromJson(v)); }
      print("13859120951924=====: $data");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data["data"] =  this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FriendModelData {
 late String head;
 late String name;
 late String time;
 late List<String> pics;
 late String desc;

  FriendModelData({ required this.head,  required this.name,  required this.time,  required this.pics,  required this.desc});

  FriendModelData.fromJson(Map<String, dynamic> json) {
    head = json["head"];
    name = json["name"];
    time = json["time"];
    pics = json["pics"]?.cast<String>();
    desc = json["desc"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["head"] = head;
    data["name"] = name;
    data["time"] = time;
    data["pics"] = pics;
    data["desc"] = desc;
    return data;
  }
}
