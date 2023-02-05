import '../entities/hospital.dart';

abstract class HospitalsRepository {
  Future<List<Hospital>> getHospitalList();
}
