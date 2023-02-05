class Hospital {
  final int id;
  final String name;
  final List<WaitingList> waitingList;
  final Location location;
  Hospital(this.id, this.name, this.waitingList, this.location);

  Hospital.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        waitingList = (map['waitingList'] as List)
            .map((i) => WaitingList.fromJson(i))
            .toList(),
        location = Location.fromJson(map['location']);
}

class WaitingList {
  final int levelOfPain;
  final int patientCount;
  final int averageProcessTime;
  WaitingList(this.levelOfPain, this.patientCount, this.averageProcessTime);
  WaitingList.fromJson(Map<String, dynamic> map)
      : levelOfPain = map['levelOfPain'],
        patientCount = map['patientCount'],
        averageProcessTime = map['averageProcessTime'];
}

class Location {
  final double lat;
  final double lng;
  Location(this.lat, this.lng);
  Location.fromJson(Map<String, dynamic> map)
      : lat = map['lat'],
        lng = map['lng'];
}
