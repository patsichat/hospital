import '../../../data/repositories/data_hospitals_repository.dart';
import '../../components/hospital_card.dart';
import './home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePage extends View {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ViewState<HomePage, HomeController> {
  HomePageState() : super(HomeController(DataHospitalsRepository()));

  @override
  Widget get view {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scaffold(
        backgroundColor: Colors.lightGreen,
        key: globalKey,
        body: SafeArea(
          child: ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return controller.hospitals.isEmpty
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Expanded(child: createTable(controller));
            },
          ),
        ),
      ),
    );
  }

  Widget createTable(HomeController controller) {
    List<TableRow> rows = [];
    controller.hospitals.forEach((element) {
      rows.add(TableRow(children: [HospitalCard(element)]));
    });
    return SingleChildScrollView(child: Table(children: rows));
  }
}
