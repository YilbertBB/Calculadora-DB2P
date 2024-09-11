import 'package:cardioapp/models/enfermedades.dart';
import 'package:cardioapp/models/pacientes.dart';
import 'package:cardioapp/pages/Questions/datos_pacientes.dart';
import 'package:cardioapp/pages/Questions/datos_pacientes2.dart';
import 'package:cardioapp/pages/Questions/htaquestions.dart';
import 'package:cardioapp/pages/Questions/questionshml.dart';
import 'package:cardioapp/pages/constants/formulas.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../resultados.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final PageController _pageController = PageController();
  Enfermedades enfermedades =
      Enfermedades(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Pacientes pacientes = Pacientes(0, 0, 0, 0, 0);
  final fromKeyDP = GlobalKey<FormState>();
  final fromKeyHTA = GlobalKey<FormState>();
  final fromKeyHML = GlobalKey<FormState>();
  final fromKeyDP2 = GlobalKey<FormState>();
  TextEditingController unidadPSControler = TextEditingController();
  TextEditingController unidadPDControler = TextEditingController();

  TextEditingController unidadCTControler = TextEditingController();
  TextEditingController unidadCLDLController = TextEditingController();
  TextEditingController unidadCHDLController = TextEditingController();
  TextEditingController unidadTGController = TextEditingController();

  TextEditingController edadController = TextEditingController();
  TextEditingController tallaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController circunfAbdController = TextEditingController();
  TextEditingController mestruacionController = TextEditingController();
  int currentPage = 0;
  double resultadoCnoHDL = 0;
  bool isSelectT = false;
  bool isSelectS = false;
  bool isSelectHTA = false;
  bool isSelectC = false;
  bool isSelectV = false;
  bool isSelectRC = false;
  bool isSelectTHM = false;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_sharp,
              color: kprimaryColor,
            ),
            onPressed: () {
              if (_pageController.page == 0) {
                return Navigator.pop(context);
              } else {
                if (enfermedades.hta == 1) {
                  if (_pageController.page == 1) {
                    return anteriorPage(_pageController);
                  }
                  _pageController.jumpToPage(1);
                } else {
                  return anteriorPage(_pageController);
                }
              }
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  DatosPacientes(
                    formKey: fromKeyDP,
                    edad: edadController,
                    peso: pesoController,
                    talla: tallaController,
                    menstruacion: mestruacionController,
                    circunfAbd: circunfAbdController,
                    press: () {
                      if (fromKeyDP.currentState!.validate()) {
                        pacientes.edad = int.parse(edadController.text);
                        pacientes.peso = double.parse(pesoController.text);
                        pacientes.talla = double.parse(tallaController.text);
                        pacientes.cicunfAbdominal =
                            circunfAbdController.text.isNotEmpty
                                ? double.parse(circunfAbdController.text)
                                : 0;
                        pacientes.edadUM =
                            int.parse(mestruacionController.text);
                        siguientePage(_pageController);
                      }
                    },
                  ),
                  DatosPacientes2(
                    isSelectT: isSelectT,
                    pressSiT: () {
                      if (isSelectT == false) {
                        setState(() {
                          isSelectT = true;
                          enfermedades.tabaquismo = 1;
                        });
                      }
                    },
                    pressNoT: () {
                      if (isSelectT == true) {
                        setState(() {
                          isSelectT = false;
                          enfermedades.tabaquismo = 0;
                        });
                      }
                    },
                    isSelectS: isSelectS,
                    pressSiS: () {
                      if (isSelectS == false) {
                        setState(() {
                          isSelectS = true;
                          enfermedades.sedentarismo = 1;
                        });
                      }
                    },
                    pressNoS: () {
                      if (isSelectS == true) {
                        setState(() {
                          isSelectS = false;
                          enfermedades.sedentarismo = 0;
                        });
                      }
                    },
                    isSelectRC: isSelectRC,
                    isSelectV: isSelectV,
                    isSelectC: isSelectC,
                    pressSiRC: () {
                      if (!isSelectRC) {
                        setState(() {
                          enfermedades.eRenalCronica = 1;
                          isSelectRC = true;
                        });
                      }
                    },
                    pressNoRC: () {
                      if (isSelectRC) {
                        setState(() {
                          enfermedades.eRenalCronica = 0;

                          isSelectRC = false;
                        });
                      }
                    },
                    pressSiV: () {
                      if (!isSelectV) {
                        setState(() {
                          enfermedades.vasometros = 1;
                          isSelectV = true;
                        });
                      }
                    },
                    pressNoV: () {
                      if (isSelectV) {
                        setState(() {
                          enfermedades.vasometros = 0;
                          isSelectV = false;
                        });
                      }
                    },
                    pressSiC: () {
                      if (!isSelectC) {
                        setState(() {
                          enfermedades.eCardiovascular = 1;
                          isSelectC = true;
                        });
                      }
                    },
                    pressNoC: () {
                      if (isSelectC) {
                        setState(() {
                          enfermedades.eCardiovascular = 0;
                          isSelectC = false;
                        });
                      }
                    },
                    isSelectTHM: isSelectTHM,
                    pressSiTHM: () {
                      setState(() {
                        // enfermedades.eCardiovascular = 0;
                        isSelectTHM = true;
                      });
                    },
                    pressNoTHM: () {
                      setState(() {
                        // enfermedades.eCardiovascular = 0;
                        isSelectTHM = false;
                      });
                    },
                    press: () {
                      siguientePage(_pageController);
                    },
                  ),
                  QuestionsHTA(
                    formKey: fromKeyHTA,
                    unidadPSControler: unidadPSControler,
                    unidadPDControler: unidadPDControler,
                    enfermedad: enfermedades,
                    press: () {
                      if (fromKeyHTA.currentState!.validate()) {
                        double resultadoPS =
                            double.parse(unidadPSControler.text);
                        double resultadoPD =
                            double.parse(unidadPDControler.text);

                        if (resultadoPS >= 140) {
                          setState(() {
                            enfermedades.ps = 1;
                            enfermedades.hta = 1;
                          });
                        } else {
                          if (isSelectHTA == false) {
                            setState(() {
                              enfermedades.hta = 0;
                            });
                          }
                        }

                        if (resultadoPD >= 90) {
                          setState(() {
                            enfermedades.pd = 1;
                            enfermedades.hta = 1;
                          });
                        } else {
                          if (isSelectHTA == false) {
                            setState(() {
                              enfermedades.hta = 0;
                            });
                          }
                        }
                        siguientePage(_pageController);
                      }
                    },
                    isSelect: isSelectHTA,
                    pressSi: () {
                      if (isSelectHTA == false) {
                        setState(() {
                          isSelectHTA = true;
                          enfermedades.hta = 1;
                        });
                      }
                    },
                    pressNo: () {
                      if (isSelectHTA == true) {
                        setState(() {
                          isSelectHTA = false;
                          enfermedades.hta = 0;
                        });
                      }
                    },
                  ),
                  QuestionsHLM(
                    enfermedad: enfermedades,
                    formKey: fromKeyHML,
                    unidadCTControler: unidadCTControler,
                    unidadCHDLControler: unidadCHDLController,
                    unidadCLDLControler: unidadCLDLController,
                    unidadTGControler: unidadTGController,
                    press: () {
                      if (fromKeyHML.currentState!.validate()) {
                        double resultadoCT =
                            double.parse(unidadCTControler.text);
                        double resultadoCLDL =
                            double.parse(unidadCLDLController.text);
                        double resultadoCHDL =
                            double.parse(unidadCHDLController.text);
                        double resultadoTG =
                            double.parse(unidadTGController.text);
                        if (resultadoCT > 6.4) {
                          setState(() {
                            enfermedades.ct = 1;
                          });
                        }
                        if (resultadoCHDL < 1.2) {
                          setState(() {
                            enfermedades.chdl = 1;
                          });
                        }
                        if (resultadoTG >= 4.5) {
                          setState(() {
                            enfermedades.tg = 1;
                          });
                          resultadoCnoHDL =
                              calcularCnoHDL(resultadoCT, resultadoCHDL);
                          if (resultadoCnoHDL >= 4.9) {
                            setState(() {
                              enfermedades.cNoHdl = 1;
                              enfermedades.hlm = 1;
                            });
                          } else {
                            setState(() {
                              enfermedades.hlm = 0;
                            });
                          }
                        } else {
                          if (resultadoTG >= 1.7) {
                            setState(() {
                              enfermedades.tg = 1;
                            });

                            if (resultadoCLDL >= 4.1) {
                              setState(() {
                                enfermedades.cldl = 1;
                                enfermedades.hlm = 1;
                              });
                            } else {
                              setState(() {
                                enfermedades.hlm = 0;
                              });
                            }
                          } else {
                            setState(() {
                              enfermedades.hlm = 0;
                            });
                          }
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Resultados(
                              valorCnoHDL: resultadoCnoHDL,
                              valorTG: double.parse(unidadTGController.text),
                              enfermedadR: enfermedades,
                              pacientes: pacientes,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: currentPage == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kprimaryColor),
                      color: currentPage == index
                          ? kprimaryColor
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

void siguientePage(PageController pageController) {
  pageController.nextPage(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  );
}

void anteriorPage(PageController pageController) {
  pageController.previousPage(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  );
}
