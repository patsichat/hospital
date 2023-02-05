import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:hospital/src/app/pages/detail/detail_controller.dart';
import 'package:hospital/src/domain/entities/hospital.dart';

class DetailPage extends View {
  const DetailPage({Key? key, required this.hospital}) : super(key: key);

  final Hospital hospital;

  @override
  DetailPageState createState() => DetailPageState(hospital);
}

class DetailPageState extends ViewState<DetailPage, DetailController> {
  DetailPageState(hospital) : super(DetailController(hospital));

  @override
  Widget get view {
    return ControlledWidgetBuilder<DetailController>(
      builder: (context, controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              controller.hospital.name,
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.near_me,
                ),
                onPressed: controller.onNavigatePressed,
              )
            ],
          ),
          body: Scaffold(
              key: globalKey,
              body: SafeArea(
                child: ListView.builder(
                  itemCount: controller.hospital.waitingList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const ListTile(
                          title: Text(
                        "Waiting List",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ));
                    }
                    var levelOfPain =
                        controller.hospital.waitingList[index - 1].levelOfPain;
                    var patientCount =
                        controller.hospital.waitingList[index - 1].patientCount;
                    var averageProcessTime = controller
                        .hospital.waitingList[index - 1].averageProcessTime;
                    return ListTile(
                        title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text("Pain Level: "),
                            ...List.generate(
                              levelOfPain + 1,
                              (index) => const Icon(
                                Icons.sentiment_very_dissatisfied,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                        Text("Patient: $patientCount"),
                        Text("Process Time: $averageProcessTime min")
                      ],
                    ));
                  },
                ),
              )),
        );
      },
    );
  }
}
