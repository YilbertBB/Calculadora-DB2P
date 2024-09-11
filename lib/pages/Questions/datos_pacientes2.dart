import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/theme_helper.dart';

class DatosPacientes2 extends StatefulWidget {
  const DatosPacientes2(
      {super.key,
      required this.pressSiT,
      required this.pressNoT,
      required this.isSelectT,
      required this.pressSiS,
      required this.pressNoS,
      required this.isSelectS,
      required this.pressSiRC,
      required this.pressNoRC,
      required this.isSelectRC,
      required this.pressSiV,
      required this.pressNoV,
      required this.isSelectV,
      required this.pressSiC,
      required this.pressNoC,
      required this.isSelectC,
      required this.press,
      required this.pressSiTHM,
      required this.pressNoTHM,
      required this.isSelectTHM});
  final VoidCallback pressSiTHM;
  final VoidCallback pressNoTHM;
  final bool isSelectTHM;
  final VoidCallback pressSiT;
  final VoidCallback pressNoT;
  final bool isSelectT;
  final VoidCallback pressSiS;
  final VoidCallback pressNoS;
  final bool isSelectS;
  final VoidCallback pressSiRC;
  final VoidCallback pressNoRC;
  final bool isSelectRC;
  final VoidCallback pressSiV;
  final VoidCallback pressNoV;
  final bool isSelectV;
  final VoidCallback pressSiC;
  final VoidCallback pressNoC;
  final bool isSelectC;
  final VoidCallback press;
  @override
  State<DatosPacientes2> createState() => _DatosPacientes2State();
}

class _DatosPacientes2State extends State<DatosPacientes2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Datos de la Paciente',
                  style: TextStyle(
                    color: kprimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Presenta contraindicación de la terapia hormonal de la menopausia (THM)?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: widget.isSelectTHM
                        ? ThemeHelper()
                            .buttonStyle(kprimaryColor, kprimaryColor, 90, 40)
                        : ThemeHelper()
                            .buttonStyle(Colors.white, Colors.black, 90, 40),
                    onPressed: widget.pressSiTHM,
                    child: Text(
                      'Si',
                      style: TextStyle(
                          color:
                              widget.isSelectTHM ? Colors.white : Colors.black),
                    ),
                  ),
                  const SizedBox(width: 50),
                  ElevatedButton(
                    style: widget.isSelectTHM == false
                        ? ThemeHelper()
                            .buttonStyle(kprimaryColor, kprimaryColor, 90, 40)
                        : ThemeHelper()
                            .buttonStyle(Colors.white, Colors.black, 90, 40),
                    onPressed: widget.pressNoTHM,
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: widget.isSelectTHM == false
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Fumas?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: widget.isSelectT
                        ? ThemeHelper()
                            .buttonStyle(kprimaryColor, kprimaryColor, 90, 40)
                        : ThemeHelper()
                            .buttonStyle(Colors.white, Colors.black, 90, 40),
                    onPressed: widget.pressSiT,
                    child: Text(
                      'Si',
                      style: TextStyle(
                          color:
                              widget.isSelectT ? Colors.white : Colors.black),
                    ),
                  ),
                  const SizedBox(width: 50),
                  ElevatedButton(
                    style: widget.isSelectT == false
                        ? ThemeHelper()
                            .buttonStyle(kprimaryColor, kprimaryColor, 90, 40)
                        : ThemeHelper()
                            .buttonStyle(Colors.white, Colors.black, 90, 40),
                    onPressed: widget.pressNoT,
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: widget.isSelectT == false
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Realiza actividad física de 150 minutos o más a la semana?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: widget.isSelectS
                        ? ThemeHelper()
                            .buttonStyle(kprimaryColor, kprimaryColor, 90, 40)
                        : ThemeHelper()
                            .buttonStyle(Colors.white, Colors.black, 90, 40),
                    onPressed: widget.pressSiS,
                    child: Text(
                      'Si',
                      style: TextStyle(
                          color:
                              widget.isSelectS ? Colors.white : Colors.black),
                    ),
                  ),
                  const SizedBox(width: 50),
                  ElevatedButton(
                    style: widget.isSelectS == false
                        ? ThemeHelper()
                            .buttonStyle(kprimaryColor, kprimaryColor, 90, 40)
                        : ThemeHelper()
                            .buttonStyle(Colors.white, Colors.black, 90, 40),
                    onPressed: widget.pressNoS,
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: widget.isSelectS == false
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Está diagnosticada de enfermedad cardiovascular?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text:
                          '\n(Enfermedad esquémica cardiaca, enfermedad cerebrovascular o enfermedad vascular periférico)',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: widget.isSelectC
                        ? ThemeHelper()
                            .buttonStyle(kprimaryColor, kprimaryColor, 90, 40)
                        : ThemeHelper()
                            .buttonStyle(Colors.white, Colors.black, 90, 40),
                    onPressed: widget.pressSiC,
                    child: Text(
                      'Si',
                      style: TextStyle(
                          color:
                              widget.isSelectC ? Colors.white : Colors.black),
                    ),
                  ),
                  const SizedBox(width: 50),
                  ElevatedButton(
                    style: widget.isSelectC == false
                        ? ThemeHelper()
                            .buttonStyle(kprimaryColor, kprimaryColor, 90, 40)
                        : ThemeHelper()
                            .buttonStyle(Colors.white, Colors.black, 90, 40),
                    onPressed: widget.pressNoC,
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: widget.isSelectC == false
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Está dianosticada de enfermedad renal crónica?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: widget.isSelectRC
                        ? ThemeHelper()
                            .buttonStyle(kprimaryColor, kprimaryColor, 90, 40)
                        : ThemeHelper()
                            .buttonStyle(Colors.white, Colors.black, 90, 40),
                    onPressed: widget.pressSiRC,
                    child: Text(
                      'Si',
                      style: TextStyle(
                          color:
                              widget.isSelectRC ? Colors.white : Colors.black),
                    ),
                  ),
                  const SizedBox(width: 50),
                  ElevatedButton(
                    style: widget.isSelectRC == false
                        ? ThemeHelper()
                            .buttonStyle(kprimaryColor, kprimaryColor, 90, 40)
                        : ThemeHelper()
                            .buttonStyle(Colors.white, Colors.black, 90, 40),
                    onPressed: widget.pressNoRC,
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: widget.isSelectRC == false
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Presenta síntomas de vasomotores?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: widget.isSelectV
                        ? ThemeHelper()
                            .buttonStyle(kprimaryColor, kprimaryColor, 90, 40)
                        : ThemeHelper()
                            .buttonStyle(Colors.white, Colors.black, 90, 40),
                    onPressed: widget.pressSiV,
                    child: Text(
                      'Si',
                      style: TextStyle(
                          color:
                              widget.isSelectV ? Colors.white : Colors.black),
                    ),
                  ),
                  const SizedBox(width: 50),
                  ElevatedButton(
                    style: widget.isSelectV == false
                        ? ThemeHelper()
                            .buttonStyle(kprimaryColor, kprimaryColor, 90, 40)
                        : ThemeHelper()
                            .buttonStyle(Colors.white, Colors.black, 90, 40),
                    onPressed: widget.pressNoV,
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: widget.isSelectV == false
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ThemeHelper().buttonStyle(
                    kprimaryColor, kprimaryColor, double.infinity, 50),
                onPressed: widget.press,
                child: const Text(
                  'Continuar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
