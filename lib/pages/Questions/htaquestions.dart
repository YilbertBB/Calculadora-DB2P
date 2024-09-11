import 'package:flutter/material.dart';

import '../../models/enfermedades.dart';
import '../constants/constants.dart';
import '../constants/theme_helper.dart';

class QuestionsHTA extends StatefulWidget {
  const QuestionsHTA({
    super.key,
    required this.enfermedad,
    required this.press,
    required this.unidadPSControler,
    required this.unidadPDControler,
    required this.formKey,
    required this.isSelect,
    required this.pressSi,
    required this.pressNo,
  });
  final Enfermedades enfermedad;
  final VoidCallback press;
  final TextEditingController unidadPSControler;
  final TextEditingController unidadPDControler;
  final GlobalKey formKey;
  final bool isSelect;
  final VoidCallback pressSi;
  final VoidCallback pressNo;
  @override
  State<QuestionsHTA> createState() => _QuestionsHTAState();
}

class _QuestionsHTAState extends State<QuestionsHTA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Estimar el Riesgo ',
                      style: TextStyle(
                        color: kprimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Cardiovascular',
                      style: TextStyle(
                        color: kprimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Form(
                key: widget.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Le han diagnosticado Hipertensión Arterial (HTA) o consume medicamentos hipotensores?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: widget.isSelect
                              ? ThemeHelper().buttonStyle(
                                  kprimaryColor, kprimaryColor, 90, 40)
                              : ThemeHelper().buttonStyle(
                                  Colors.white, Colors.black, 90, 40),
                          onPressed: widget.pressSi,
                          child: Text(
                            'Si',
                            style: TextStyle(
                                color: widget.isSelect
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                        const SizedBox(width: 40),
                        ElevatedButton(
                          style: widget.isSelect == false
                              ? ThemeHelper().buttonStyle(
                                  kprimaryColor, kprimaryColor, 90, 40)
                              : ThemeHelper().buttonStyle(
                                  Colors.white, Colors.black, 90, 40),
                          onPressed: widget.pressNo,
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: widget.isSelect == false
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Presión Alterial Sistólica',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      '(mmHg)',
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextFormField(
                        controller: widget.unidadPSControler,
                        keyboardType: TextInputType.number,
                        decoration: ThemeHelper().textInputDecoration(),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Entre la PAS';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Presión Alterial Diastólica',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      '(mmHg)',
                      style: TextStyle(),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextFormField(
                        controller: widget.unidadPDControler,
                        keyboardType: TextInputType.number,
                        decoration: ThemeHelper().textInputDecoration(),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Entre la PAD';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(
                            kprimaryColor, kprimaryColor, double.infinity, 50),
                        onPressed: widget.press,
                        child: const Text(
                          'Continuar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
