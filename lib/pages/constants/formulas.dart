import 'dart:math';

import 'package:cardioapp/models/enfermedades.dart';

int calcularRiesgo(Enfermedades enfermedad) {
  int hta = 3 * enfermedad.hta;
  int hlm = 2 * enfermedad.hlm;
  int sed = 2 * enfermedad.sedentarismo;
  int result = hta + hlm + sed + enfermedad.tabaquismo;
  return result;
}

double calcularCnoHDL(double ct, double chdl) {
  return ct - chdl;
}

String tipoMenopausia(int edadUM) {
  edadUM += 1;
  if (edadUM < 40) {
    return 'Insuficiencia ovárica precoz.';
  } else if (edadUM >= 40 && edadUM <= 45) {
    return 'Menopausia prematura.';
  } else if (edadUM >= 46 && edadUM <= 59) {
    return 'Menopausia normal.';
  } else {
    return 'Menopausia tardía.';
  }
}

double calcularIMC(double talla, double peso) {
  double resultadoIMC = peso / pow(talla, 2);
  return resultadoIMC;
}

String saberIMC(double resultadoIMC) {
  if (resultadoIMC >= 30.0 && resultadoIMC <= 34.9) {
    return 'Obesidad grado 1.';
  } else if (resultadoIMC >= 35.0 && resultadoIMC <= 39.9) {
    return 'Obesidad grado 2.';
  } else if (resultadoIMC >= 40.0) {
    return 'Obesidad grado 3.';
  } else if (resultadoIMC >= 25.1 && resultadoIMC < 27.5) {
    return 'Sobrepeso grado 1.';
  } else if (resultadoIMC >= 27.6 && resultadoIMC < 30.0) {
    return 'Sobrepeso grado 2.';
  } else if (resultadoIMC >= 18.50 && resultadoIMC <= 24.9) {
    return 'Normopeso';
  } else if (resultadoIMC >= 16.0 && resultadoIMC <= 16.9) {
    return 'Delgadez moderada.';
  } else if (resultadoIMC >= 17.0 && resultadoIMC <= 18.5) {
    return 'Delgadez leve.';
  } else {
    return 'Delgadez extrema.';
  }
}

String saberHiperTG(double tg) {
  if (tg >= 1.7 && tg <= 5.6) {
    return 'Hipertrigliceridemia Leve.';
  } else if (tg >= 5.7 && tg < 11.3) {
    return 'Hipertrigliceridemia Moderada.';
  } else {
    return 'Hipertrigliceridemia Grave.';
  }
}

String saberHiperCnoHDL(double cnoHDL) {
  if (cnoHDL >= 4.9 && cnoHDL <= 5.7) {
    return 'Hipercolesterolemia debido a que el colesterol no HDL es elevado.';
  } else {
    return 'Hipercolesterolemia debido a que el colesterol no HDL muy elevado.';
  }
}

String saberRiesgoMetabolico(double circunfAbd) {
  if (circunfAbd <= 80) {
    return 'Sin riesgo metabólico.';
  } else if (circunfAbd > 80 && circunfAbd < 88) {
    return 'Riesgo metabólico incrementado.';
  } else {
    return 'Riesgo metabólico sustancialmente incrementado.';
  }
}

int calcularTHMEdadUM(int edad, int edadUM) {
  return edad - edadUM;
}
