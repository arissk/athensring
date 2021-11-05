import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///Variable Initialization
  //Form Global Key and Text Editing Contoller
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _carNumberController = TextEditingController();
  //Date time and data variables that they app gets from the user.
  DateTime _selectedDate = DateTime.now();
  int intDateNumber = 0;
  int carPlateNumber = 0;
  String message = 'Can I go downtown!';
  bool canGo = false;

//Date Picker Functionality
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
      selectableDayPredicate: (DateTime val) =>
          val.weekday == 5 || val.weekday == 6 ? false : true,
    ).then((pickedDate) {
      if (pickedDate == null) {
        _selectedDate = DateTime.now();
        intDateNumber = int.parse(DateFormat('d').format(_selectedDate));
        return;
      }
      //Setting the State for the date and parsing the date number as integer
      setState(() {
        _selectedDate = pickedDate;
        intDateNumber = int.parse(DateFormat('d').format(_selectedDate));
      });
    });
  }

  //Checking the data from the date and the vechicle plate number and providing the message needed
  void _checkValidity(int plateNumber, int dateNumber) {
    if (dateNumber == 0) {
      _selectedDate = DateTime.now();
      intDateNumber = int.parse(DateFormat('d').format(_selectedDate));
    }
    if (plateNumber.isEven && dateNumber.isEven) {
      message = 'You can go downtown!';
      canGo = true;
    } else if (plateNumber.isOdd && dateNumber.isOdd) {
      message = 'You can go downtown!';
      canGo = true;
    } else {
      message = '3No downtown for you!';
      canGo = false;
    }
    //Setting the state for the message in order to change according to the data and get the necessary colors for the message.
    setState(() {
      message;
      canGo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            iconSize: 40.0,
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/info');
            },
            icon: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 8.0, 0),
              child: Icon(Icons.info_outline),
            ),
          ),
        ],
        title: const Text('Athens Ring'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Expanded(child: SizedBox(height: 5.0)),
              Expanded(
                child: Text(
                  'Insert your vehicle\'s last plate digit!',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              const Expanded(child: SizedBox(height: 10.0)),
              Expanded(
                child: Text(
                  'Plate Digit',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              const Expanded(child: SizedBox(height: 10.0)),
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: 50.0,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 50.0,
                      ),
                      controller: _carNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 1,
                      autofocus: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            message = 'X';
                            canGo = false;
                          });
                          return message;
                        }
                      },
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox(height: 20.0)),
              Expanded(
                flex: 2,
                child: FloatingActionButton(
                  onPressed: _showDatePicker,
                  tooltip: 'Pick Date',
                  child: const Icon(Icons.calendar_today_rounded),
                ),
              ),
              const Expanded(child: SizedBox(height: 10.0)),
              Expanded(
                child: Text(
                  _selectedDate == DateTime.now()
                      ? 'No date selected'
                      : DateFormat('EEEE d/MM/yyyy').format(_selectedDate),
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Expanded(
                child: Text(
                  message,
                  style: canGo == true
                      ? TextStyle(
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)
                      : TextStyle(
                          color: Colors.red[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                ),
              ),
              const Expanded(child: SizedBox(height: 150.0)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn1',
        onPressed: () {
          //Check if the text field has a valid value. If yes then show the info to the user, if not throw warning message.
          if (_formKey.currentState!.validate()) {
            //Get the car plate number and parse it to an int from the text field
            carPlateNumber = int.parse(_carNumberController.text);
            //Perform the checks needed and provider the information to the user
            _checkValidity(intDateNumber, carPlateNumber);
          } else {
            message = 'Insert plate\'s last digit!';
          }
        },
        tooltip: 'Check',
        child: const Icon(Icons.check),
        backgroundColor: Colors.indigo,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
