import 'package:cardioapp/pages/Questions/questions.dart';
import 'package:cardioapp/pages/constants/constants.dart';
import 'package:cardioapp/pages/constants/theme_helper.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kprimaryColor,
        title: const Text(
          'Calculadora DB2P',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Evaluar',
        backgroundColor: kprimaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Questions(),
            ),
          );
        },
        child: const Icon(Icons.assignment, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '1. Sobre Calculadora DB2P',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Esta aplicación sirve para calcular el riesgo cardiovascular en mujeres con diabetes tipo 2 posmenospausicas y conocer el nivel de riesgo que tiene.',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 20),
              const Text(
                '2. Instrucciones para el uso de la App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              const Text.rich(
                style: TextStyle(fontSize: 15),
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Selecciona el botón de ',
                    ),
                    TextSpan(
                        text: 'Evaluar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(text: ' o el botón con el ícono'),
                    WidgetSpan(
                      child: Icon(
                        Icons.assignment,
                      ),
                    ),
                    TextSpan(
                        text:
                            ' en la esquina inferior derecha. Después responda cada una de las preguntas y al final verá el resultado con los valores de riesgo '),
                    TextSpan(
                        text: 'Alto',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' o '),
                    TextSpan(
                        text: 'Muy Alto',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            ' además de los motivos de por qué esos resultados.'),
                  ],
                ),
              ),
              const Text(
                '3. Precausiones en su uso',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Bajo ningún concepto esta aplicación está pensada como un reemplazo a la consulta con un profesional de la salud o su juicio clínico. Su difusión ayudará a los médicos a estimar en forma más rápida el riesgo cardiovascular y a dialogar con los pacientes para analizar en qué medida éste puede ser modificado. Asimismo, intenta ayudar a personas interesadas por su salud. Las recomendaciones de tratamientos están orientadas a los profesionales de la salud y no contituyen una guía para la automedicación, la cual puede resultar riesgosa.',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                    style: ThemeHelper().buttonStyle(
                        kprimaryColor, kprimaryColor, double.infinity, 50),
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Questions(),
                          ),
                        ),
                    child: const Text(
                      'Evaluar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}



  // Text(
  //           'Edad',
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         Container(
  //           width: 150,
  //           height: 50,
  //           child: TextField(
  //             keyboardType: TextInputType.number,
  //             decoration: ThemeHelper().textInputDecoration(),
  //           ),
  //         ),


    // Container(
          //   width: 100,
          //   child: DropdownButtonFormField(
          //     decoration: const InputDecoration(
          //       enabledBorder: InputBorder.none,
          //       focusedBorder: InputBorder.none,
          //     ),
          //     value: unidadPO,
          //     items: const [
          //       DropdownMenuItem(
          //         value: 'mg/dl',
          //         child: Text(
          //           '(mg/dl)',
          //           style: TextStyle(),
          //         ),
          //       ),
          //       DropdownMenuItem(
          //         value: 'mmol/L',
          //         child: Text('(mmol/L)'),
          //       ),
          //     ],
          //     onChanged: (String? newValue) {
          //       setState(() {
          //         unidadPO = newValue!;
          //       });
          //     },
          //   ),
          // ),

          // Container(
          //   width: 100,
          //   child: DropdownButtonFormField(
          //     decoration: const InputDecoration(
          //       enabledBorder: InputBorder.none,
          //       focusedBorder: InputBorder.none,
          //     ),
          //     value: unidadPS,
          //     items: const [
          //       DropdownMenuItem(
          //         value: 'mg/dl',
          //         child: Text(
          //           '(mg/dl)',
          //           style: TextStyle(),
          //         ),
          //       ),
          //       DropdownMenuItem(
          //         value: 'mmol/L',
          //         child: Text('(mmol/L)'),
          //       ),
          //     ],
          //     onChanged: (String? newValue) {
          //       setState(() {
          //         unidadPS = newValue!;
          //       });
          //     },
          //   ),
          // ),