import 'package:cardioapp/models/enfermedades.dart';
import 'package:cardioapp/models/pacientes.dart';
import 'package:cardioapp/pages/constants/constants.dart';
import 'package:cardioapp/pages/motivos.dart';
import 'package:cardioapp/pages/principal.dart';
import 'package:flutter/material.dart';

import 'constants/formulas.dart';

class Resultados extends StatelessWidget {
  const Resultados({
    super.key,
    required this.enfermedadR,
    required this.pacientes,
    required this.valorTG,
    required this.valorCnoHDL,
  });
  final Enfermedades enfermedadR;
  final Pacientes pacientes;
  final double valorTG;
  final double valorCnoHDL;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ksecondaryColor,
      appBar: AppBar(
        title: const Text('CardioRiesgo'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MyHomePage()),
            (Route<dynamic> route) => false),
        child: Icon(
          Icons.file_download_done_rounded,
          color: kprimaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Riesgo: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    TextSpan(
                      text: calcularRiesgo(enfermedadR) >= 3 ||
                              enfermedadR.eCardiovascular == 1 ||
                              enfermedadR.eRenalCronica == 1
                          ? 'Muy Alto.'
                          : 'Alto.',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'La paciente presenta: ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Motivos(
                validez: true,
                motivo: tipoMenopausia(pacientes.edadUM),
              ),
              Motivos(
                validez: true,
                motivo: saberIMC(calcularIMC(pacientes.talla, pacientes.peso)),
              ),
              Motivos(
                validez: pacientes.cicunfAbdominal != 0 ? true : false,
                motivo: saberRiesgoMetabolico(pacientes.cicunfAbdominal),
              ),
              Motivos(
                validez: enfermedadR.hta == 1 ? true : false,
                motivo:
                    'La paciente está diagnosticada con hipertensión arterial(HTA).',
              ),
              Motivos(
                validez: enfermedadR.ps == 1 ? true : false,
                motivo: 'Presión Arterial Sistólica elevada.',
              ),
              Motivos(
                validez: enfermedadR.pd == 1 ? true : false,
                motivo: 'Presion Arterial Diastólica elevada.',
              ),
              Motivos(
                validez: enfermedadR.ct == 1 ? true : false,
                motivo:
                    'Hipercolesterolemia debido a que el colesterol total es elevado.',
              ),
              Motivos(
                validez: enfermedadR.cldl == 1 ? true : false,
                motivo:
                    'Hipercolesterolemia debido a que el colesterol LDL es elevado.',
              ),
              Motivos(
                validez: enfermedadR.cNoHdl == 1 ? true : false,
                motivo: saberHiperCnoHDL(valorCnoHDL),
              ),
              Motivos(
                validez: enfermedadR.tg == 1 ? true : false,
                motivo: saberHiperTG(valorTG),
              ),
              Motivos(
                validez: enfermedadR.tabaquismo == 1 ? true : false,
                motivo: 'Hábito de fumar.',
              ),
              Motivos(
                validez: enfermedadR.sedentarismo == 1 ? true : false,
                motivo: 'Sedentarismo.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Recomendaciones: ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Motivos(
                validez: calcularIMC(pacientes.talla, pacientes.peso) >= 30
                    ? true
                    : false,
                motivo: 'Evaluar tratamiento para la obesidad.',
              ),
              Motivos(
                validez:
                    enfermedadR.ps == 1 || enfermedadR.pd == 1 ? true : false,
                motivo: 'Evaluar tratamiento antihipertensivo.',
              ),
              Motivos(
                validez: enfermedadR.ct == 1 ||
                        enfermedadR.cldl == 1 ||
                        enfermedadR.chdl == 1 ||
                        enfermedadR.tg == 1
                    ? true
                    : false,
                motivo: 'Evaluar tratamiento con estatinas.',
              ),
              Motivos(
                validez: enfermedadR.tabaquismo == 1 ? true : false,
                motivo: 'Evaluar tratamiento para el tabaquismo.',
              ),
              Motivos(
                validez: enfermedadR.sedentarismo == 1 ? true : false,
                motivo: 'Evaluar tratamiento para el sedentarismo.',
              ),
              Motivos(
                validez: enfermedadR.eCardiovascular == 0 ? true : false,
                motivo:
                    'Evaluar utilización de THM debido a que la paciente no presenta enfermedad cardiovascular establecida.',
              ),
              Motivos(
                validez: enfermedadR.vasometros == 1 ? true : false,
                motivo:
                    'Evaluar utilización de THM debido a que la paciente presenta síntomas vasomotores.',
              ),
              Motivos(
                validez: pacientes.edad > 60 ? true : false,
                motivo:
                    'Evaluar utilización de THM debido a que la edad de la paciente es mayor a los 60 años.',
              ),
              Motivos(
                validez: pacientes.edad < 40 ? true : false,
                motivo:
                    'Evaluar utilización de THM debido a que la edad de la paciente es menor a los 40 años.',
              ),
              Motivos(
                validez:
                    calcularTHMEdadUM(pacientes.edad, pacientes.edadUM) <= 10
                        ? true
                        : false,
                motivo: 'Evaluar utilización de THM.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
