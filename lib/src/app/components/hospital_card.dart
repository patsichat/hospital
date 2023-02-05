import 'package:flutter/material.dart';
import 'package:hospital/src/domain/entities/hospital.dart';

import '../pages/detail/detail_view.dart';

class HospitalCard extends StatelessWidget {
  final Hospital _hospital;

  HospitalCard(this._hospital);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              hospital: _hospital,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Color.fromARGB(50, 0, 0, 0),
                    spreadRadius: 0.5,
                    offset: Offset(0.0, 1),
                  ),
                ]),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.medical_services,
                    weight: 24,
                  ),
                ),
                Text(
                  _hospital.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            )),
      ),
    );
  }

  void navigate(context) {
    // var args = {'event': _event, 'user': _user};
    // args['isUserEvent'] = isUserEvent != null ? true : false;
    // Navigator.pushNamed(context, '/event', arguments: args);
  }
}
