///Page that shows generic text information to the user

import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Athens Ring Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 10.0),
              Text(
                'Time Period',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                '25/10/21 to 22/07/22\nThe restrictions are enforced every year and are designed to reduce traffic congestion in the city center.',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15.0),
              Text(
                'Hours',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                'Monday to Thursday: 07:00 - 20:00\nFriday: 07:00 - 15:00\n\nOn Saturdays, Sundays, public holidays, as well as on days when there is a strike of workers in all means of public transport, the measures do not apply.',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15.0),
              Text(
                'Vehicles FREE of restrictions',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                'Vehicles excluded from the measures are: electric, hybrid, gas or LPG cars, as well as Euro 6 cars that emit pollutants below 120g/km CO\u00B2 and drivers who have special permits.',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15.0),
              Text(
                'Small Ring (Mikros Daktylios) boundaries',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                'Alexandras Avenue - Sakharov - Mesogeion Avenue - Feidippidou - Michalakopoulou - Sp. Merkouri - Vryaxidos - Ymittou - El. Iliou - Ambr. Frantzi - L. Syggrou - Hamosternas - Piraeus - Iera Odos - L. Konstantinoupoleos - Achilleos - Pl. Karaiskaki - Karolou - Marni - 28th of October (Patision) - Alexandras Avenue.',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15.0),
              Text(
                'Permanent Residents',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                'For the vehicles of the permanent residents inside the Small Ring, special entry-exit zones are provided and a special card is issued by the competent Services of the Municipality of Athens.\n\nThe applications from the beneficiaries will be submitted exclusively in person and in compliance with the current health protection measures, from Monday to Friday and from 09:00 to 13:00 at the Attica Traffic Department (Th. Diligianni 24-26, Ring Office on the ground floor of the building [entrance from Samos Street], tel. 210-5284142) with the presentation in addition to the specific documents / supporting documents and photocopies of the Vehicle Traffic License and the Driver\'s License.\n\nThe special traffic licenses in Mikro Daktilios, which were issued by the Attica Traffic Directorate for the period 2019-2020 are still valid until Friday 26-11-2021.',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15.0),
              Text(
                'Violation Fine',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                'Violators of these restrictive measures are punished in accordance with the provisions of article 52 par. 6 of the Road Traffic Code (Administrative fine of 100 euros), as amended and in force in conjunction with article 31 of law 3904/2010 (AD218).',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
