import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:hospital/src/app/pages/detail/detail_presenter.dart';
import 'package:hospital/src/domain/entities/hospital.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailController extends Controller {
  final DetailPresenter detailPresenter;
  final Hospital _hospital;
  Hospital get hospital => _hospital;
  DetailController(this._hospital) : detailPresenter = DetailPresenter();

  @override
  void initListeners() {}

  void onNavigatePressed() {
    var lat = _hospital.location.lat;
    var lng = _hospital.location.lng;
    var url = Uri.parse('http://maps.google.com/maps?z=19&t=m&q=$lat,$lng');
    launchUrl(url);
  }

  @override
  void onDisposed() {
    detailPresenter.dispose();
    super.onDisposed();
  }
}
