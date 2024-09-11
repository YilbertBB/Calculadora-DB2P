import 'package:cardioapp/models/enfermedades.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';
import '../constants/theme_helper.dart';

class QuestionsHLM extends StatefulWidget {
  const QuestionsHLM({
    super.key,
    required this.enfermedad,
    required this.unidadCTControler,
    required this.press,
    required this.formKey,
    required this.unidadCLDLControler,
    required this.unidadCHDLControler,
    required this.unidadTGControler,
  });
  final Enfermedades enfermedad;
  final TextEditingController unidadCTControler;
  final TextEditingController unidadCLDLControler;
  final TextEditingController unidadCHDLControler;
  final TextEditingController unidadTGControler;
  final GlobalKey formKey;
  final VoidCallback press;

  @override
  State<QuestionsHLM> createState() => _QuestionsHLMState();
}

class _QuestionsHLMState extends State<QuestionsHLM> {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Colesterol Total\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(
                                text: '(mmol/L)',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: TextFormField(
                            controller: widget.unidadCTControler,
                            keyboardType: TextInputType.number,
                            decoration: ThemeHelper().textInputDecoration(),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d*'),
                              ),
                            ],
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Entre la CT';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Colesterol LDL\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(text: '(mmol/L)'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: TextFormField(
                            controller: widget.unidadCLDLControler,
                            keyboardType: TextInputType.number,
                            decoration: ThemeHelper().textInputDecoration(),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d*'),
                              ),
                            ],
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Entre el CLDL';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Colesterol HDL\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(text: '(mmol/L)'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: TextFormField(
                            controller: widget.unidadCHDLControler,
                            keyboardType: TextInputType.number,
                            decoration: ThemeHelper().textInputDecoration(),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d*'),
                              ),
                            ],
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Entre el CHDL';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Triglicéridos\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(text: '(mmol/L)'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: TextFormField(
                            controller: widget.unidadTGControler,
                            keyboardType: TextInputType.number,
                            decoration: ThemeHelper().textInputDecoration(),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d*'),
                              ),
                            ],
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Entre los T';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(
                            kprimaryColor, kprimaryColor, double.infinity, 50),
                        onPressed: widget.press,
                        child: const Text(
                          'Continuar',
                          style: TextStyle(color: Colors.white),
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
