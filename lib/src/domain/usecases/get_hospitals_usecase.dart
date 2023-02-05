import 'dart:async';

import '../entities/hospital.dart';
import '../repositories/hospitals_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetHospitalUseCase extends UseCase<GetHospitalUseCaseResponse, void> {
  final HospitalsRepository hospitalsRepository;
  GetHospitalUseCase(this.hospitalsRepository);

  @override
  Future<Stream<GetHospitalUseCaseResponse>> buildUseCaseStream(_) async {
    final controller = StreamController<GetHospitalUseCaseResponse>();
    try {
      final user = await hospitalsRepository.getHospitalList();
      controller.add(GetHospitalUseCaseResponse(user));
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetHospitalUseCaseResponse {
  final List<Hospital> hospitals;
  GetHospitalUseCaseResponse(this.hospitals);
}
