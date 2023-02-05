import 'package:hospital/src/domain/entities/hospital.dart';
import './home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller {
  List<Hospital> hospitals = [];
  final HomePresenter homePresenter;

  HomeController(hospitalsRepository)
      : homePresenter = HomePresenter(hospitalsRepository) {
    homePresenter.getHospitals();
  }

  @override
  void initListeners() {
    homePresenter.getHospitalOnNext = (List<Hospital> hospitals) {
      this.hospitals = hospitals;
      refreshUI();
    };
    homePresenter.getHospitalOnComplete = () {};

    homePresenter.getHospitalOnError = (e) {
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      refreshUI();
    };
  }

  void getHospitals() => homePresenter.getHospitals();

  @override
  void onDisposed() {
    homePresenter.dispose();
    super.onDisposed();
  }
}
