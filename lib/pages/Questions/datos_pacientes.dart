import 'package:cardioapp/pages/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/theme_helper.dart';

class DatosPacientes extends StatefulWidget {
  const DatosPacientes({
    super.key,
    required this.edad,
    required this.talla,
    required this.peso,
    required this.press,
    required this.circunfAbd,
    required this.formKey,
    required this.menstruacion,
  });
  final TextEditingController edad;
  final TextEditingController talla;
  final TextEditingController peso;
  final TextEditingController circunfAbd;
  final TextEditingController menstruacion;
  final VoidCallback press;
  final GlobalKey formKey;

  @override
  State<DatosPacientes> createState() => _DatosPacientesState();
}

class _DatosPacientesState extends State<DatosPacientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              Form(
                key: widget.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Edad\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(text: '(años)'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: TextFormField(
                            controller: widget.edad,
                            keyboardType: TextInputType.number,
                            decoration: ThemeHelper().textInputDecoration(),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Entre su Edad';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Talla\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(text: '(m)'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: TextFormField(
                            controller: widget.talla,
                            keyboardType: TextInputType.number,
                            decoration: ThemeHelper().textInputDecoration(),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d*'),
                              ),
                            ],
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Entre su talla';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Peso\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(text: '(Kg)'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: TextFormField(
                            controller: widget.peso,
                            keyboardType: TextInputType.number,
                            decoration: ThemeHelper().textInputDecoration(),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Entre su Peso';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Edad de la Última Menstruación',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      '(años)',
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextFormField(
                        controller: widget.menstruacion,
                        keyboardType: TextInputType.number,
                        decoration: ThemeHelper().textInputDecoration(),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Entre la edad de la ultima menstruación';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Text(
                          'Circunferencia Abdominal ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '(Opcional)',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '(cm)',
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextField(
                        controller: widget.circunfAbd,
                        keyboardType: TextInputType.number,
                        decoration: ThemeHelper().textInputDecoration(),
                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
