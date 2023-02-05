import 'package:flutter_test/flutter_test.dart';
import 'package:hospital/src/domain/entities/hospital.dart';

void main() {
  group('Entity Test: Event', () {
    late Map<String, dynamic> hospitalMap;

    setUp(() {
      hospitalMap = {
        "id": 1,
        "name": "Samitivej Hospital",
        "waitingList": [
          {"patientCount": 10, "levelOfPain": 0, "averageProcessTime": 20}
        ],
        "location": {"lat": 13.7349, "lng": 100.5766}
      };
    });

    test('.fromJson(map) creates an Hospital correctly.', () {
      Hospital hospital = Hospital.fromJson(hospitalMap);
      expect(hospital, const TypeMatcher<Hospital>());
      expect(hospital.id, 1);
      expect(hospital.name, 'Samitivej Hospital');
      expect(hospital.waitingList.length, 1);
      expect(hospital.waitingList.first.patientCount, 10);
      expect(hospital.waitingList.first.levelOfPain, 0);
      expect(hospital.waitingList.first.averageProcessTime, 20);
      expect(hospital.location.lat, 13.7349);
      expect(hospital.location.lng, 100.5766);
    }); // end .fromMap testnt
  }); // end group
} // end main