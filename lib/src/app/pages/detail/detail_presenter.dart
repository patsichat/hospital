import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:hospital/src/domain/entities/hospital.dart';

class DetailPresenter extends Presenter {
  // late Function getHospitalOnNext;
  // late Function getHospitalOnComplete;
  // late Function getHospitalOnError;

  final Hospital hospital;

  DetailPresenter(this.hospital);

  @override
  void dispose() {
    // getHospitalUseCase.dispose();
  }
// }

// class _GetHospitalUseCaseeObserver
//     extends Observer<GetHospitalUseCaseResponse> {
//   final HomePresenter presenter;
//   _GetHospitalUseCaseeObserver(this.presenter);
//   @override
//   void onComplete() {
//     presenter.getHospitalOnComplete();
//   }

//   @override
//   void onError(e) {
//     presenter.getHospitalOnError(e);
//   }

//   @override
//   void onNext(response) {
//     presenter.getHospitalOnNext(response?.hospitals);
//   }
}
