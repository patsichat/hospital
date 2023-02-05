import 'package:flutter/foundation.dart';
import 'package:hospital/src/data/utils/constants.dart';
import 'package:hospital/src/data/utils/http_helper.dart';
import 'package:hospital/src/domain/entities/hospital.dart';
import 'package:hospital/src/domain/repositories/hospitals_repository.dart';
import 'package:logging/logging.dart';

import 'dart:async';

class DataHospitalsRepository implements HospitalsRepository {
  // singleton
  static final DataHospitalsRepository _instance =
      DataHospitalsRepository._internal();

  DataHospitalsRepository._internal() {}
  factory DataHospitalsRepository() => _instance;

  @override
  Future<List<Hospital>> getHospitalList() async {
    List<Hospital> hospitals;
    Map<String, dynamic> body;

    Uri uri = Uri.https(Constants.baseUrl, Constants.hospitalsRoute);
    try {
      body = await HttpHelper.invokeHttp(uri, RequestType.get);
    } catch (error) {
      rethrow;
    }
    Map<String, dynamic> record = body['record'];
    Map<String, dynamic> hospitalsData = record['hospitals'];
    List<dynamic> hospitalsArray = hospitalsData['hospitals'];
    hospitals = List.from(hospitalsArray.map((map) => Hospital.fromJson(map)));
    return hospitals;
  }
}
