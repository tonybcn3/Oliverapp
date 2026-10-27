import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'indice_turnos.dart';

class Turnos extends StatelessWidget {
  final String? pantalla;
  final String? subpantalla;

  const Turnos({super.key, this.pantalla, this.subpantalla});

  // ---------------- Pantallas principales ----------------
  static final List<String> pantallasPrincipales = [
    "L46",
    "L52",
    "L/X70",
    "L72",
    "L74",
    "L76",
    "L77",
    "L78",
    "M5",
    "M75",
    "SB1",
    "SB2",
    "SB3",
    "X43",
    "X73",
    "X79",
  ];

  // ---------------- Subpantallas por línea ----------------
  static final Map<String, List<String>> subPantallasPorPantalla = {
    "L46": [
      "LABORABLES",
      "LABORABLES VACACIONES COLEGIOS",
      "SÁBADOS Y LABORABLES AGOSTO",
      "DOMINGOS Y FESTIVOS",
    ],
    "L52": ["LABORABLES", "SÁBADOS", "DOMINGOS Y FESTIVOS"],
    "L/X70": [
      "LABORABLES",
      "SÁBADOS Y LABORABLES AGOSTO",
      "DOMINGOS Y FESTIVOS",
    ],
    "L72": ["LABORABLES", "SÁBADOS Y LABORABLES AGOSTO", "DOMINGOS Y FESTIVOS"],
    "L74": ["LABORABLES", "SÁBADOS Y LABORABLES AGOSTO", "DOMINGOS Y FESTIVOS"],
    "L76": ["LABORABLES", "SÁBADOS", "DOMINGOS Y FESTIVOS"],
    "L77": [
      "TODOS LOS DIAS",
      "FINES DE SEMANA JUNIO, JULIO, SEPTIEMBRE Y TODO AGOSTO",
    ],
    "L78": ["LABORABLES", "SÁBADOS Y LABORABLES AGOSTO", "DOMINGOS Y FESTIVOS"],
    "M5": ["LABORABLES", "SÁBADOS Y LABORABLES AGOSTO", "DOMINGOS Y FESTIVOS"],
    "M75": ["LABORABLES", "SÁBADOS Y LABORABLES AGOSTO", "DOMINGOS Y FESTIVOS"],
    "SB1": ["LABORABLES", "SÁBADOS Y LABORABLES AGOSTO", "DOMINGOS Y FESTIVOS"],
    "SB2": ["LABORABLES", "SÁBADOS, DOMINGOS Y FESTIVOS"],
    "SB3": ["LABORABLES", "SÁBADOS, DOMINGOS Y FESTIVOS"],
    "X43": ["LABORABLES", "SÁBADOS"],
    "X73": ["LABORABLES"],
    "X79": ["LABORABLES", "SÁBADOS", "DOMINGOS Y FESTIVOS"],
  };

  // ---------------- Contenido de subpantallas (texto si no hay imágenes) ----------------
  static final Map<String, String> contenidoSubPantalla = {};

  // Todas las imágenes por subpantalla
  static final Map<String, List<String>> imagenesPorPantalla = {
    "M5-LABORABLES": [
      "assets/imagenes/m5_laborables/m5l391_392.png",
      "assets/imagenes/m5_laborables/m5l393_394.png",
      "assets/imagenes/m5_laborables/m5l395_396.png",
      "assets/imagenes/m5_laborables/m5l397_398.png",
      "assets/imagenes/m5_laborables/m5l399_400.png",
      "assets/imagenes/m5_laborables/m5l401_402.png",
      "assets/imagenes/m5_laborables/m5l403_404.png",
      "assets/imagenes/m5_laborables/m5l405_406.png",
      "assets/imagenes/m5_laborables/m5l407_408.png",
      "assets/imagenes/m5_laborables/m5l409_410.png",
      "assets/imagenes/m5_laborables/m5l411_412.png",
      "assets/imagenes/m5_laborables/m5lcompleto.png",
      "assets/pdfs/tira_parada_m5.pdf",
    ],
    "M5-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/m5_sabados/m5s191_192.jpg",
      "assets/imagenes/m5_sabados/m5s193_194.jpg",
      "assets/imagenes/m5_sabados/m5s195_196.jpg",
      "assets/imagenes/m5_sabados/m5s197_198.jpg",
      "assets/imagenes/m5_sabados/m5s199_200.jpg",
      "assets/imagenes/m5_sabados/m5s201_202.jpg",
      "assets/imagenes/m5_sabados/m5s203_204.jpg",
      "assets/imagenes/m5_sabados/m5scompleto.png",
      "assets/pdfs/tira_parada_m5.pdf",
    ],
    "M5-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/m5_domingos/m5d79_80.jpg",
      "assets/imagenes/m5_domingos/m5d81_82.jpg",
      "assets/imagenes/m5_domingos/m5d83_84.jpg",
      "assets/imagenes/m5_domingos/m5d85_86.jpg",
      "assets/imagenes/m5_domingos/m5d87_88.jpg",
      "assets/imagenes/m5_domingos/m5d89_90.jpg",
      "assets/imagenes/m5_domingos/m5dcompleto.png",
      "assets/pdfs/tira_parada_m5.pdf",
    ],
    "L46-LABORABLES": [
      "assets/imagenes/l46_laborables/l46l367_368.jpg",
      "assets/imagenes/l46_laborables/l46l369_370.jpg",
      "assets/imagenes/l46_laborables/l46l371_372.jpg",
      "assets/imagenes/l46_laborables/l46l373_374.jpg",
      "assets/imagenes/l46_laborables/l46l375_376.jpg",
      "assets/imagenes/l46_laborables/l46l377_378.jpg",
      "assets/imagenes/l46_laborables/l46l379_380.jpg",
      "assets/imagenes/l46_laborables/l46l381_382.jpg",
      "assets/imagenes/l46_laborables/l46lcompleto.png",
      "assets/pdfs/tira_parada_l46.pdf",
    ],
    "L46-LABORABLES VACACIONES COLEGIOS": [
      "assets/imagenes/l46_laborablesvc/l46lvc49_50.jpg",
      "assets/imagenes/l46_laborablesvc/l46lvc51_52.jpg",
      "assets/imagenes/l46_laborablesvc/l46lvc53_54.jpg",
      "assets/imagenes/l46_laborablesvc/l46lvc55_56.jpg",
      "assets/imagenes/l46_laborablesvc/l46lvc57_58.jpg",
      "assets/imagenes/l46_laborablesvc/l46lvc59_60.jpg",
      "assets/imagenes/l46_laborablesvc/l46lvc61_62.jpg",
      "assets/imagenes/l46_laborablesvc/l46lvccompleto.png",
      "assets/pdfs/tira_parada_l46.pdf",
    ],
    "L46-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/l46_sabados/l46s17_18.jpg",
      "assets/imagenes/l46_sabados/l46s19_20.jpg",
      "assets/imagenes/l46_sabados/l46s21_22.jpg",
      "assets/imagenes/l46_sabados/l46s23_24.jpg",
      "assets/imagenes/l46_sabados/l46s25_26.jpg",
      "assets/imagenes/l46_sabados/l46scompleto.png",
      "assets/pdfs/tira_parada_l46.pdf",
    ],
    "L46-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/l46_domingos/l46d187_188.jpg",
      "assets/imagenes/l46_domingos/l46d189_190.jpg",
      "assets/imagenes/l46_domingos/l46d191_192.jpg",
      "assets/imagenes/l46_domingos/l46d193_194.jpg",
      "assets/imagenes/l46_domingos/l46dcompleto.png",
      "assets/pdfs/tira_parada_l46.pdf",
    ],
    "L52-LABORABLES": [
      "assets/imagenes/l52_laborables/l52l63_64.jpg",
      "assets/imagenes/l52_laborables/l52l65_66.jpg",
      "assets/imagenes/l52_laborables/l52l67_68.jpg",
      "assets/imagenes/l52_laborables/l52l69_70.jpg",
      "assets/imagenes/l52_laborables/l52l71_72.jpg",
      "assets/imagenes/l52_laborables/l52l73_74.jpg",
      "assets/imagenes/l52_laborables/l52l75_76.jpg",
      "assets/imagenes/l52_laborables/l52lcompleto.png",
      "assets/pdfs/tira_parada_l52.pdf",
    ],
    "L52-SÁBADOS": [
      "assets/imagenes/l52_sabados/l52s27_28.jpg",
      "assets/imagenes/l52_sabados/l52s29_30.jpg",
      "assets/imagenes/l52_sabados/l52s31_32.jpg",
      "assets/imagenes/l52_sabados/l52s33_34.jpg",
      "assets/imagenes/l52_sabados/l52s35_36.jpg",
      "assets/imagenes/l52_sabados/l52scompleto.png",
      "assets/pdfs/tira_parada_l52.pdf",
    ],
    "L52-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/l52_domingos/l52d15_16.jpg",
      "assets/imagenes/l52_domingos/l52d17_18.jpg",
      "assets/imagenes/l52_domingos/l52d19_20.jpg",
      "assets/imagenes/l52_domingos/l52d21_22.jpg",
      "assets/imagenes/l52_domingos/l52dcompleto.png",
      "assets/pdfs/tira_parada_l52.pdf",
    ],
    "L/X70-LABORABLES": [
      "assets/imagenes/lx70_laborables/lx70l239_240.jpg",
      "assets/imagenes/lx70_laborables/lx70l241_242.jpg",
      "assets/imagenes/lx70_laborables/lx70l243_244.jpg",
      "assets/imagenes/lx70_laborables/lx70l245_246.jpg",
      "assets/imagenes/lx70_laborables/lx70l247_248.jpg",
      "assets/imagenes/lx70_laborables/lx70l249_250.jpg",
      "assets/imagenes/lx70_laborables/lx70l251_252.jpg",
      "assets/imagenes/lx70_laborables/lx70l253_254.jpg",
      "assets/imagenes/lx70_laborables/lx70l255_256.jpg",
      "assets/imagenes/lx70_laborables/lx70l257_258.jpg",
      "assets/imagenes/lx70_laborables/lx70l259_260.jpg",
      "assets/imagenes/lx70_laborables/lx70l261_262.jpg",
      "assets/imagenes/lx70_laborables/lx70lcompleto.png",
      "assets/pdfs/tira_parada_l70.pdf",
      "assets/pdfs/tira_parada_x70.pdf",
    ],
    "L/X70-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/lx70_sabados/lx70s223_224.jpg",
      "assets/imagenes/lx70_sabados/lx70s225_226.jpg",
      "assets/imagenes/lx70_sabados/lx70s227_228.jpg",
      "assets/imagenes/lx70_sabados/lx70s229_230.jpg",
      "assets/imagenes/lx70_sabados/lx70s231_232.jpg",
      "assets/imagenes/lx70_sabados/lx70s233_234.jpg",
      "assets/imagenes/lx70_sabados/lx70scompleto.png",
      "assets/pdfs/tira_parada_l70.pdf",
      "assets/pdfs/tira_parada_x70.pdf",
    ],
    "L/X70-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/lx70_domingos/lx70d157_158.jpg",
      "assets/imagenes/lx70_domingos/lx70d159_160.jpg",
      "assets/imagenes/lx70_domingos/lx70d161_162.jpg",
      "assets/imagenes/lx70_domingos/lx70d163_164.jpg",
      "assets/imagenes/lx70_domingos/lx70d165_166.jpg",
      "assets/imagenes/lx70_domingos/lx70d167_168.jpg",
      "assets/imagenes/lx70_domingos/lx70dcompleto.png",
      "assets/pdfs/tira_parada_l70.pdf",
      "assets/pdfs/tira_parada_x70.pdf",
    ],
    "L72-LABORABLES": [
      "assets/imagenes/l72_laborables/l72l89_90.jpg",
      "assets/imagenes/l72_laborables/l72l91_92.jpg",
      "assets/imagenes/l72_laborables/l72l93_94.jpg",
      "assets/imagenes/l72_laborables/l72l95_96.jpg",
      "assets/imagenes/l72_laborables/l72l97_98.jpg",
      "assets/imagenes/l72_laborables/l72l99_100.jpg",
      "assets/imagenes/l72_laborables/l72lcompleto.png",
      "assets/pdfs/tira_parada_l72.pdf",
    ],
    "L72-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/l72_sabados/l72s45_46.jpg",
      "assets/imagenes/l72_sabados/l72s47_48.jpg",
      "assets/imagenes/l72_sabados/l72s49_50.jpg",
      "assets/imagenes/l72_sabados/l72s51_52.jpg",
      "assets/imagenes/l72_sabados/l72scompleto.png",
      "assets/pdfs/tira_parada_l72.pdf",
    ],
    "L72-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/l72_domingos/l72d31_32.jpg",
      "assets/imagenes/l72_domingos/l72d33_34.jpg",
      "assets/imagenes/l72_domingos/l72d35_36.jpg",
      "assets/imagenes/l72_domingos/l72d37_38.jpg",
      "assets/imagenes/l72_domingos/l72dcompleto.png",
      "assets/pdfs/tira_parada_l72.pdf",
    ],
    "L74-LABORABLES": [
      "assets/imagenes/l74_laborables/l74l233_234.jpg",
      "assets/imagenes/l74_laborables/l74l235_236.jpg",
      "assets/imagenes/l74_laborables/l74l237_238.jpg",
      "assets/imagenes/l74_laborables/l74lcompleto.png",
      "assets/pdfs/tira_parada_l74.pdf",
    ],
    "L74-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/l74_sabados/l74s53_54.jpg",
      "assets/imagenes/l74_sabados/l74s55_56.jpg",
      "assets/imagenes/l74_sabados/l74scompleto.png",
      "assets/pdfs/tira_parada_l74.pdf",
    ],
    "L74-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/l74_domingos/l74d39_40.jpg",
      "assets/imagenes/l74_domingos/l74d41_42.jpg",
      "assets/imagenes/l74_domingos/l74dcompleto.png",
      "assets/pdfs/tira_parada_l74.pdf",
    ],
    "L76-LABORABLES": [
      "assets/imagenes/l76_laborables/l76l107_108.png",
      "assets/imagenes/l76_laborables/l76l345_110.png",
      "assets/imagenes/l76_laborables/l76l111_112.png",
      "assets/imagenes/l76_laborables/l76l385_386.png",
      "assets/imagenes/l76_laborables/l76l387_388.png",
      "assets/imagenes/l76_laborables/l76l389_390.png",
      "assets/imagenes/l76_laborables/l76lcompleto_anterior.png",
      "assets/imagenes/l76_laborables/l76lcompleto.png",
      "assets/pdfs/tira_parada_l76.pdf",
    ],
    "L76-SÁBADOS": [
      "assets/imagenes/l76_sabados/l76s57_58.png",
      "assets/imagenes/l76_sabados/l76s59_60.png",
      "assets/imagenes/l76_sabados/l76s61_62.png",
      "assets/imagenes/l76_sabados/l76s235_236.png",
      "assets/imagenes/l76_sabados/l76s237_238.png",
      "assets/imagenes/l76_sabados/l76s239_240.png",
      "assets/imagenes/l76_sabados/l76scompleto_anterior.png",
      "assets/imagenes/l76_sabados/l76scompleto.png",
      "assets/pdfs/tira_parada_l76.pdf",
    ],
    "L76-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/l76_domingos/l76d43_44.png",
      "assets/imagenes/l76_domingos/l76d45_46.png",
      "assets/imagenes/l76_domingos/l76dcompleto.png",
      "assets/pdfs/tira_parada_l76.pdf",
    ],
    "L77-TODOS LOS DIAS": [
      "assets/imagenes/l77_laborables/l77l313_300.jpg",
      "assets/imagenes/l77_laborables/l77l301_302.jpg",
      "assets/imagenes/l77_laborables/l77l303_304.jpg",
      "assets/imagenes/l77_laborables/l77l305_306.jpg",
      "assets/imagenes/l77_laborables/l77l307_308.jpg",
      "assets/imagenes/l77_laborables/l77l309_310.jpg",
      "assets/imagenes/l77_laborables/l77lcompleto.png",
      "assets/pdfs/tira_parada_l77.pdf",
    ],
    "L77-FINES DE SEMANA JUNIO, JULIO, SEPTIEMBRE Y TODO AGOSTO": [
      "assets/imagenes/l77_agosto/l77la149_150.jpg",
      "assets/imagenes/l77_agosto/l77la151_152.jpg",
      "assets/imagenes/l77_agosto/l77la153_154.jpg",
      "assets/imagenes/l77_agosto/l77la155_156.jpg",
      "assets/imagenes/l77_agosto/l77la157_158.jpg",
      "assets/imagenes/l77_agosto/l77la159_160.jpg",
      "assets/imagenes/l77_agosto/l77la161_162.jpg",
      "assets/imagenes/l77_agosto/l77la163_164.jpg",
      "assets/imagenes/l77_agosto/l77la165_166.jpg",
      "assets/imagenes/l77_agosto/l77lacompleto.png",
      "assets/pdfs/tira_parada_l77.pdf",
    ],
    "L78-LABORABLES": [
      "assets/imagenes/l78_laborables/l78l123_124.jpg",
      "assets/imagenes/l78_laborables/l78l125_126.jpg",
      "assets/imagenes/l78_laborables/l78l127_128.jpg",
      "assets/imagenes/l78_laborables/l78l129_130.jpg",
      "assets/imagenes/l78_laborables/l78l131_132.jpg",
      "assets/imagenes/l78_laborables/l78l133_134.jpg",
      "assets/imagenes/l78_laborables/l78lcompleto.png",
      "assets/pdfs/tira_parada_l78.pdf",
    ],
    "L78-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/l78_sabados/l78s73_74.jpg",
      "assets/imagenes/l78_sabados/l78s75_76.jpg",
      "assets/imagenes/l78_sabados/l78s77_78.jpg",
      "assets/imagenes/l78_sabados/l78s79_80.jpg",
      "assets/imagenes/l78_sabados/l78scompleto.png",
      "assets/pdfs/tira_parada_l78.pdf",
    ],
    "L78-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/l78_domingos/l78d57_58.jpg",
      "assets/imagenes/l78_domingos/l78d59_60.jpg",
      "assets/imagenes/l78_domingos/l78d61_62.jpg",
      "assets/imagenes/l78_domingos/l78d63_64.jpg",
      "assets/imagenes/l78_domingos/l78dcompleto.png",
      "assets/pdfs/tira_parada_l78.pdf",
    ],
    "M75-LABORABLES": [
      "assets/imagenes/m75_laborables/m75l289_290.jpg",
      "assets/imagenes/m75_laborables/m75l291_292.jpg",
      "assets/imagenes/m75_laborables/m75l293_294.jpg",
      "assets/imagenes/m75_laborables/m75l295_296.jpg",
      "assets/imagenes/m75_laborables/m75l297_298.jpg",
      "assets/imagenes/m75_laborables/m75lcompleto.png",
      "assets/pdfs/tira_parada_m75.pdf",
    ],
    "M75-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/m75_sabados/m75s81_82.jpg",
      "assets/imagenes/m75_sabados/m75s83_84.jpg",
      "assets/imagenes/m75_sabados/m75scompleto.png",
      "assets/pdfs/tira_parada_m75.pdf",
    ],
    "M75-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/m75_domingos/m75d65_66.jpg",
      "assets/imagenes/m75_domingos/m75d67_68.jpg",
      "assets/imagenes/m75_domingos/m75dcompleto.png",
      "assets/pdfs/tira_parada_m75.pdf",
    ],
    "SB1-LABORABLES": [
      "assets/imagenes/sb1_laborables/sb1l213_214.jpg",
      "assets/imagenes/sb1_laborables/sb1l215_216.jpg",
      "assets/imagenes/sb1_laborables/sb1l217_218.jpg",
      "assets/imagenes/sb1_laborables/sb1l219_220.jpg",
      "assets/imagenes/sb1_laborables/sb1l221_222.jpg",
      "assets/imagenes/sb1_laborables/sb1l223_224.jpg",
      "assets/imagenes/sb1_laborables/sb1l225_226.jpg",
      "assets/imagenes/sb1_laborables/sb1l227_228.jpg",
      "assets/imagenes/sb1_laborables/sb1l229_230.jpg",
      "assets/imagenes/sb1_laborables/sb1l231_232.jpg",
      "assets/imagenes/sb1_laborables/sb1lcompleto.png",
      "assets/pdfs/tira_parada_sb1.pdf",
    ],
    "SB1-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/sb1_sabados/sb1s167_168.jpg",
      "assets/imagenes/sb1_sabados/sb1s169_170.jpg",
      "assets/imagenes/sb1_sabados/sb1s171_172.jpg",
      "assets/imagenes/sb1_sabados/sb1s173_174.jpg",
      "assets/imagenes/sb1_sabados/sb1s175_176.jpg",
      "assets/imagenes/sb1_sabados/sb1s177_178.jpg",
      "assets/imagenes/sb1_sabados/sb1scompleto.png",
      "assets/pdfs/tira_parada_sb1.pdf",
    ],
    "SB1-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/sb1_domingos/sb1d147_148.jpg",
      "assets/imagenes/sb1_domingos/sb1d149_150.jpg",
      "assets/imagenes/sb1_domingos/sb1d151_152.jpg",
      "assets/imagenes/sb1_domingos/sb1d153_154.jpg",
      "assets/imagenes/sb1_domingos/sb1d155_156.jpg",
      "assets/imagenes/sb1_domingos/sb1dcompleto.png",
      "assets/pdfs/tira_parada_sb1.pdf",
    ],
    "SB2-LABORABLES": [
      "assets/imagenes/sb2_laborables/sb2l161_162.jpg",
      "assets/imagenes/sb2_laborables/sb2lsdcompleto.jpg",
      "assets/pdfs/tira_parada_sb2.pdf",
    ],
    "SB2-SÁBADOS, DOMINGOS Y FESTIVOS": [
      "assets/imagenes/sb2_sabados/sb2sd95_96.jpg",
      "assets/imagenes/sb2_sabados/sb2lsdcompleto.jpg",
      "assets/pdfs/tira_parada_sb2.pdf",
    ],
    "SB3-LABORABLES": [
      "assets/imagenes/sb3_laborables/sb3l211_212.jpg",
      "assets/imagenes/sb3_laborables/sb3lsdcompleto.jpg",
      "assets/pdfs/tira_parada_sb3.pdf",
    ],
    "SB3-SÁBADOS, DOMINGOS Y FESTIVOS": [
      "assets/imagenes/sb3_sabados/sb3sd129_130.jpg",
      "assets/imagenes/sb3_sabados/sb3lsdcompleto.jpg",
      "assets/pdfs/tira_parada_sb3.pdf",
    ],
    "X43-LABORABLES": [
      "assets/imagenes/x43_laborables/x43l01_02.jpg",
      "assets/imagenes/x43_laborables/x43l03_04.jpg",
      "assets/imagenes/x43_laborables/x43l05_06.jpg",
      "assets/imagenes/x43_laborables/x43l445_08.png",
      "assets/imagenes/x43_laborables/x43l09_10.jpg",
      "assets/imagenes/x43_laborables/x43l383.jpg",
      "assets/imagenes/x43_laborables/x43lcompleto.png",
      "assets/pdfs/tira_parada_x43.pdf",
    ],
    "X43-SÁBADOS": [
      "assets/imagenes/x43_sabados/x43s01_02.jpg",
      "assets/imagenes/x43_sabados/x43s03_04.jpg",
      "assets/imagenes/x43_sabados/x43scompleto.png",
      "assets/pdfs/tira_parada_x43.pdf",
    ],
    "X73-LABORABLES": [
      "assets/imagenes/x73_laborables/x73l413_414.png",
      "assets/imagenes/x73_laborables/x73l415_416.png",
      "assets/imagenes/x73_laborables/x73l417_418.png",
      "assets/imagenes/x73_laborables/x73l419_420.png",
      "assets/imagenes/x73_laborables/x73lcompleto.png",
      "assets/pdfs/tira_parada_x73.pdf",
    ],
    "X79-LABORABLES": [
      "assets/imagenes/x79_laborables/x79l421_422.png",
      "assets/imagenes/x79_laborables/x79l423_424.png",
      "assets/imagenes/x79_laborables/x79l425_426.png",
      "assets/imagenes/x79_laborables/x79l427_428.png",
      "assets/imagenes/x79_laborables/x79l429_430.png",
      "assets/imagenes/x79_laborables/x79l431_432.png",
      "assets/imagenes/x79_laborables/x79l433_434.png",
      "assets/imagenes/x79_laborables/x79l435_436.png",
      "assets/imagenes/x79_laborables/x79l437_438.png",
      "assets/imagenes/x79_laborables/x79l439_440.png",
      "assets/imagenes/x79_laborables/x79l441_442.png",
      "assets/imagenes/x79_laborables/x79l443_444.png",
      "assets/imagenes/x79_laborables/x79lcompleto.png",
      "assets/pdfs/tira_parada_x79.pdf",
    ],
    "X79-SÁBADOS": [
      "assets/imagenes/x79_sabados/x79s05_06.jpg",
      "assets/imagenes/x79_sabados/x79s123_124.jpg",
      "assets/imagenes/x79_sabados/x79s125_126.jpg",
      "assets/imagenes/x79_sabados/x79s11_12.jpg",
      "assets/imagenes/x79_sabados/x79s13_14.jpg",
      "assets/imagenes/x79_sabados/x79s15_16.jpg",
      "assets/imagenes/x79_sabados/x79scompleto.png",
      "assets/pdfs/tira_parada_x79.pdf",
    ],
    "X79-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/x79_domingos/x79d103_104.jpg",
      "assets/imagenes/x79_domingos/x79d105_106.jpg",
      "assets/imagenes/x79_domingos/x79d05_06.jpg",
      "assets/imagenes/x79_domingos/x79d07_08.jpg",
      "assets/imagenes/x79_domingos/x79dcompleto.png",
      "assets/pdfs/tira_parada_x79.pdf",
    ],
  };

  // Nombres personalizados para mostrar debajo de los iconos
  static final Map<String, String> nombresIconos = {
    "assets/pdfs/tira_parada_m5.pdf": "Tira Parada M5",
    "assets/imagenes/m5_laborables/m5l391_392.png": "L391/L392",
    "assets/imagenes/m5_laborables/m5l393_394.png": "L393/L394",
    "assets/imagenes/m5_laborables/m5l395_396.png": "L395/L396",
    "assets/imagenes/m5_laborables/m5l397_398.png": "L397/L398",
    "assets/imagenes/m5_laborables/m5l399_400.png": "L399/L400",
    "assets/imagenes/m5_laborables/m5l401_402.png": "L401/L402",
    "assets/imagenes/m5_laborables/m5l403_404.png": "L403/L404",
    "assets/imagenes/m5_laborables/m5l405_406.png": "L405/L406",
    "assets/imagenes/m5_laborables/m5l407_408.png": "L407/L408",
    "assets/imagenes/m5_laborables/m5l409_410.png": "L409/L410",
    "assets/imagenes/m5_laborables/m5l411_412.png": "L411/L412",
    "assets/imagenes/m5_laborables/m5lcompleto.png": "Cuadro Completo",
    "assets/imagenes/m5_sabados/m5s191_192.jpg": "S191/S192",
    "assets/imagenes/m5_sabados/m5s193_194.jpg": "S193/S194",
    "assets/imagenes/m5_sabados/m5s195_196.jpg": "S195/S196",
    "assets/imagenes/m5_sabados/m5s197_198.jpg": "S197/S198",
    "assets/imagenes/m5_sabados/m5s199_200.jpg": "S199/S200",
    "assets/imagenes/m5_sabados/m5s201_202.jpg": "S201/S202",
    "assets/imagenes/m5_sabados/m5s203_204.jpg": "S203/S204",
    "assets/imagenes/m5_sabados/m5scompleto.png": "Cuadro Completo",
    "assets/imagenes/m5_domingos/m5d79_80.jpg": "D79/D80",
    "assets/imagenes/m5_domingos/m5d81_82.jpg": "D81/D82",
    "assets/imagenes/m5_domingos/m5d83_84.jpg": "D83/D84",
    "assets/imagenes/m5_domingos/m5d85_86.jpg": "D85/D86",
    "assets/imagenes/m5_domingos/m5d87_88.jpg": "D87/D88",
    "assets/imagenes/m5_domingos/m5d89_90.jpg": "D89/D90",
    "assets/imagenes/m5_domingos/m5dcompleto.png": "Cuadro Completo",
    "assets/pdfs/tira_parada_l46.pdf": "Tira Parada L46",
    "assets/imagenes/l46_laborables/l46l367_368.jpg": "L367/L368",
    "assets/imagenes/l46_laborables/l46l369_370.jpg": "L369/L370",
    "assets/imagenes/l46_laborables/l46l371_372.jpg": "L371/L372",
    "assets/imagenes/l46_laborables/l46l373_374.jpg": "L373/L374",
    "assets/imagenes/l46_laborables/l46l375_376.jpg": "L375/L376",
    "assets/imagenes/l46_laborables/l46l377_378.jpg": "L377/L378",
    "assets/imagenes/l46_laborables/l46l379_380.jpg": "L379/L380",
    "assets/imagenes/l46_laborables/l46l381_382.jpg": "L381/L382",
    "assets/imagenes/l46_laborables/l46lcompleto.png": "Cuadro Completo",
    "assets/imagenes/l46_laborablesvc/l46lvc49_50.jpg": "L49/L50",
    "assets/imagenes/l46_laborablesvc/l46lvc51_52.jpg": "L51/L52",
    "assets/imagenes/l46_laborablesvc/l46lvc53_54.jpg": "L53/L54",
    "assets/imagenes/l46_laborablesvc/l46lvc55_56.jpg": "L55/L56",
    "assets/imagenes/l46_laborablesvc/l46lvc57_58.jpg": "L57/L58",
    "assets/imagenes/l46_laborablesvc/l46lvc59_60.jpg": "L59/L60",
    "assets/imagenes/l46_laborablesvc/l46lvc61_62.jpg": "L61/L62",
    "assets/imagenes/l46_laborablesvc/l46lvccompleto.png": "Cuadro Completo",
    "assets/imagenes/l46_sabados/l46s17_18.jpg": "S17/S18",
    "assets/imagenes/l46_sabados/l46s19_20.jpg": "S19/S20",
    "assets/imagenes/l46_sabados/l46s21_22.jpg": "S21/S22",
    "assets/imagenes/l46_sabados/l46s23_24.jpg": "S23/S24",
    "assets/imagenes/l46_sabados/l46s25_26.jpg": "S25/S26",
    "assets/imagenes/l46_sabados/l46scompleto.png": "Cuadro Completo",
    "assets/imagenes/l46_domingos/l46d187_188.jpg": "D187/D188",
    "assets/imagenes/l46_domingos/l46d189_190.jpg": "D189/D190",
    "assets/imagenes/l46_domingos/l46d191_192.jpg": "D191/D192",
    "assets/imagenes/l46_domingos/l46d193_194.jpg": "D193/D194",
    "assets/imagenes/l46_domingos/l46dcompleto.png": "Cuadro Completo",
    "assets/pdfs/tira_parada_l52.pdf": "Tira Parada L52",
    "assets/imagenes/l52_laborables/l52l63_64.jpg": "L63/L64",
    "assets/imagenes/l52_laborables/l52l65_66.jpg": "L65/L66",
    "assets/imagenes/l52_laborables/l52l67_68.jpg": "L67/L68",
    "assets/imagenes/l52_laborables/l52l69_70.jpg": "L69/L70",
    "assets/imagenes/l52_laborables/l52l71_72.jpg": "L71/L72",
    "assets/imagenes/l52_laborables/l52l73_74.jpg": "L73/L74",
    "assets/imagenes/l52_laborables/l52l75_76.jpg": "L75/L76",
    "assets/imagenes/l52_laborables/l52lcompleto.png": "Cuadro Completo",
    "assets/imagenes/l52_sabados/l52s27_28.jpg": "S27/S28",
    "assets/imagenes/l52_sabados/l52s29_30.jpg": "S29/S30",
    "assets/imagenes/l52_sabados/l52s31_32.jpg": "S31/S32",
    "assets/imagenes/l52_sabados/l52s33_34.jpg": "S33/S34",
    "assets/imagenes/l52_sabados/l52s35_36.jpg": "S35/S36",
    "assets/imagenes/l52_sabados/l52scompleto.png": "Cuadro Completo",
    "assets/imagenes/l52_domingos/l52d15_16.jpg": "D15/D16",
    "assets/imagenes/l52_domingos/l52d17_18.jpg": "D17/D18",
    "assets/imagenes/l52_domingos/l52d19_20.jpg": "D19/D20",
    "assets/imagenes/l52_domingos/l52d21_22.jpg": "D21/D22",
    "assets/imagenes/l52_domingos/l52dcompleto.png": "Cuadro Completo",
    "assets/pdfs/tira_parada_l70.pdf": "Tira Parada L70",
    "assets/pdfs/tira_parada_x70.pdf": "Tira Parada X70",
    "assets/imagenes/lx70_laborables/lx70l239_240.jpg": "L239/L240",
    "assets/imagenes/lx70_laborables/lx70l241_242.jpg": "L241/L242",
    "assets/imagenes/lx70_laborables/lx70l243_244.jpg": "L243/L244",
    "assets/imagenes/lx70_laborables/lx70l245_246.jpg": "L245/L246",
    "assets/imagenes/lx70_laborables/lx70l247_248.jpg": "L247/L248",
    "assets/imagenes/lx70_laborables/lx70l249_250.jpg": "L249/L250",
    "assets/imagenes/lx70_laborables/lx70l251_252.jpg": "L251/L252",
    "assets/imagenes/lx70_laborables/lx70l253_254.jpg": "L253/L254",
    "assets/imagenes/lx70_laborables/lx70l255_256.jpg": "L255/L256",
    "assets/imagenes/lx70_laborables/lx70l257_258.jpg": "L257/L258",
    "assets/imagenes/lx70_laborables/lx70l259_260.jpg": "L259/L260",
    "assets/imagenes/lx70_laborables/lx70l261_262.jpg": "L261/L262",
    "assets/imagenes/lx70_laborables/lx70lcompleto.png": "Cuadro Completo",
    "assets/imagenes/lx70_sabados/lx70s223_224.jpg": "S223/S224",
    "assets/imagenes/lx70_sabados/lx70s225_226.jpg": "S225/S226",
    "assets/imagenes/lx70_sabados/lx70s227_228.jpg": "S227/S228",
    "assets/imagenes/lx70_sabados/lx70s229_230.jpg": "S229/S230",
    "assets/imagenes/lx70_sabados/lx70s231_232.jpg": "S231/S232",
    "assets/imagenes/lx70_sabados/lx70s233_234.jpg": "S-33/S234",
    "assets/imagenes/lx70_sabados/lx70scompleto.png": "Cuadro Completo",
    "assets/imagenes/lx70_domingos/lx70d157_158.jpg": "D157/D158",
    "assets/imagenes/lx70_domingos/lx70d159_160.jpg": "D159/D160",
    "assets/imagenes/lx70_domingos/lx70d161_162.jpg": "D161/D162",
    "assets/imagenes/lx70_domingos/lx70d163_164.jpg": "D163/D164",
    "assets/imagenes/lx70_domingos/lx70d165_166.jpg": "D165/D166",
    "assets/imagenes/lx70_domingos/lx70d167_168.jpg": "D167/D168",
    "assets/imagenes/lx70_domingos/lx70dcompleto.png": "Cuadro Completo",
    "assets/pdfs/tira_parada_l72.pdf": "Tira Parada L72",
    "assets/imagenes/l72_laborables/l72l89_90.jpg": "L89/L90",
    "assets/imagenes/l72_laborables/l72l91_92.jpg": "L91/L92",
    "assets/imagenes/l72_laborables/l72l93_94.jpg": "L93/L94",
    "assets/imagenes/l72_laborables/l72l95_96.jpg": "L95/L96",
    "assets/imagenes/l72_laborables/l72l97_98.jpg": "L97/L98",
    "assets/imagenes/l72_laborables/l72l99_100.jpg": "L99/L100",
    "assets/imagenes/l72_laborables/l72lcompleto.png": "Cuadro Completo",
    "assets/imagenes/l72_sabados/l72s45_46.jpg": "S45/S46",
    "assets/imagenes/l72_sabados/l72s47_48.jpg": "S47/S48",
    "assets/imagenes/l72_sabados/l72s49_50.jpg": "S49/S50",
    "assets/imagenes/l72_sabados/l72s51_52.jpg": "S51/S52",
    "assets/imagenes/l72_sabados/l72scompleto.png": "Cuadro Completo",
    "assets/imagenes/l72_domingos/l72d31_32.jpg": "D31/D32",
    "assets/imagenes/l72_domingos/l72d33_34.jpg": "D33/D34",
    "assets/imagenes/l72_domingos/l72d35_36.jpg": "D35/D36",
    "assets/imagenes/l72_domingos/l72d37_38.jpg": "D37/D38",
    "assets/imagenes/l72_domingos/l72dcompleto.png": "Cuadro Completo",
    "assets/pdfs/tira_parada_l74.pdf": "Tira Parada L74",
    "assets/imagenes/l74_laborables/l74l233_234.jpg": "L233/L234",
    "assets/imagenes/l74_laborables/l74l235_236.jpg": "L235/L236",
    "assets/imagenes/l74_laborables/l74l237_238.jpg": "L237/L238",
    "assets/imagenes/l74_laborables/l74lcompleto.png": "Cuadro Completo",
    "assets/imagenes/l74_sabados/l74s53_54.jpg": "S53/S54",
    "assets/imagenes/l74_sabados/l74s55_56.jpg": "S55/S56",
    "assets/imagenes/l74_sabados/l74scompleto.png": "Cuadro Completo",
    "assets/imagenes/l74_domingos/l74d39_40.jpg": "D39/D40",
    "assets/imagenes/l74_domingos/l74d41_42.jpg": "D41/D42",
    "assets/imagenes/l74_domingos/l74dcompleto.png": "Cuadro Completo",
    "assets/pdfs/tira_parada_l76.pdf": "Tira Parada L76",
    "assets/imagenes/l76_laborables/l76l107_108.png": "L107/L108",
    "assets/imagenes/l76_laborables/l76l345_110.png": "L345/L110",
    "assets/imagenes/l76_laborables/l76l111_112.png": "L111/L112",
    "assets/imagenes/l76_laborables/l76l385_386.png": "L385/L386",
    "assets/imagenes/l76_laborables/l76l387_388.png": "L387/L388",
    "assets/imagenes/l76_laborables/l76l389_390.png": "L389/L390",
    "assets/imagenes/l76_laborables/l76lcompleto_anterior.png":
        "Cuadro Completo Anterior",
    "assets/imagenes/l76_laborables/l76lcompleto.png": "Cuadro Completo",
    "assets/imagenes/l76_sabados/l76s57_58.png": "S57/S58",
    "assets/imagenes/l76_sabados/l76s59_60.png": "S59/S60",
    "assets/imagenes/l76_sabados/l76s61_62.png": "S61/S62",
    "assets/imagenes/l76_sabados/l76s235_236.png": "S235/S236",
    "assets/imagenes/l76_sabados/l76s237_238.png": "S237/S238",
    "assets/imagenes/l76_sabados/l76s239_240.png": "S239/S240",
    "assets/imagenes/l76_sabados/l76scompleto_anterior.png":
        "Cuadro Completo Anterior",
    "assets/imagenes/l76_sabados/l76scompleto.png": "Cuadro Completo",
    "assets/imagenes/l76_domingos/l76d43_44.png": "D43/D44",
    "assets/imagenes/l76_domingos/l76d45_46.png": "D45/D46",
    "assets/imagenes/l76_domingos/l76dcompleto.png": "Cuadro Completo",
    "assets/pdfs/tira_parada_l77.pdf": "Tira Parada L77",
    "assets/imagenes/l77_laborables/l77l313_300.jpg":
        "L313/L300\nS165/S152\nD145/D132",
    "assets/imagenes/l77_laborables/l77l301_302.jpg":
        "L301/L302\nS153/S154\nD133/D134",
    "assets/imagenes/l77_laborables/l77l303_304.jpg":
        "L303/L304\nS155/S156\nD135/D136",
    "assets/imagenes/l77_laborables/l77l305_306.jpg":
        "L305/L306\nS157/S158\nD137/D138",
    "assets/imagenes/l77_laborables/l77l307_308.jpg":
        "L307/L308\nS159/S160\nD139/D140",
    "assets/imagenes/l77_laborables/l77l309_310.jpg":
        "L309/L310\nS161/S162\nD141/D142",
    "assets/imagenes/l77_laborables/l77lcompleto.png": "Cuadro Completo",
    "assets/imagenes/l77_agosto/l77la149_150.jpg":
        "L149/L150\nS205/S206\nD169/D170",
    "assets/imagenes/l77_agosto/l77la151_152.jpg":
        "L151/L152\nS207/S208\nD171/D172",
    "assets/imagenes/l77_agosto/l77la153_154.jpg":
        "L153/L154\nS209/S210\nD173/D174",
    "assets/imagenes/l77_agosto/l77la155_156.jpg":
        "L155/L156\nS211/S212\nD175/D176",
    "assets/imagenes/l77_agosto/l77la157_158.jpg":
        "L157/L158\nS213/S214\nD177/D178",
    "assets/imagenes/l77_agosto/l77la159_160.jpg":
        "L159/L160\nS215/S216\nD179/D180",
    "assets/imagenes/l77_agosto/l77la161_162.jpg":
        "L161/L162\nS217/S218\nD181/D182",
    "assets/imagenes/l77_agosto/l77la163_164.jpg":
        "L163/L164\nS219/S220\nD183/D184",
    "assets/imagenes/l77_agosto/l77la165_166.jpg":
        "L165/L166\nS221/S222\nD185/D186",
    "assets/imagenes/l77_agosto/l77lacompleto.png": "Cuadro Completo",
    "assets/pdfs/tira_parada_l78.pdf": "Tira Parada L78",
    "assets/imagenes/l78_laborables/l78l123_124.jpg": "L123/L124",
    "assets/imagenes/l78_laborables/l78l125_126.jpg": "L125/L126",
    "assets/imagenes/l78_laborables/l78l127_128.jpg": "L127/L128",
    "assets/imagenes/l78_laborables/l78l129_130.jpg": "L129/L130",
    "assets/imagenes/l78_laborables/l78l131_132.jpg": "L131/L132",
    "assets/imagenes/l78_laborables/l78l133_134.jpg": "L133/L134",
    "assets/imagenes/l78_laborables/l78lcompleto.png": "Cuadro Completo",
    "assets/imagenes/l78_sabados/l78s73_74.jpg": "S73/S74",
    "assets/imagenes/l78_sabados/l78s75_76.jpg": "S75/S76",
    "assets/imagenes/l78_sabados/l78s77_78.jpg": "S77/S78",
    "assets/imagenes/l78_sabados/l78s79_80.jpg": "S79/S80",
    "assets/imagenes/l78_sabados/l78scompleto.png": "Cuadro Completo",
    "assets/imagenes/l78_domingos/l78d57_58.jpg": "D57/D58",
    "assets/imagenes/l78_domingos/l78d59_60.jpg": "D59/D60",
    "assets/imagenes/l78_domingos/l78d61_62.jpg": "D61/D62",
    "assets/imagenes/l78_domingos/l78d63_64.jpg": "D63/D64",
    "assets/imagenes/l78_domingos/l78dcompleto.png": "Cuadro Completo",
    "assets/pdfs/tira_parada_m75.pdf": "Tira Parada M75",
    "assets/imagenes/m75_laborables/m75l289_290.jpg": "L289/L290",
    "assets/imagenes/m75_laborables/m75l291_292.jpg": "L291/L292",
    "assets/imagenes/m75_laborables/m75l293_294.jpg": "L293/L294",
    "assets/imagenes/m75_laborables/m75l295_296.jpg": "L295/L296",
    "assets/imagenes/m75_laborables/m75l297_298.jpg": "L297/L298",
    "assets/imagenes/m75_laborables/m75lcompleto.png": "Cuadro Completo",
    "assets/imagenes/m75_sabados/m75s81_82.jpg": "S81/S82",
    "assets/imagenes/m75_sabados/m75s83_84.jpg": "S83/S84",
    "assets/imagenes/m75_sabados/m75scompleto.png": "Cuadro Completo",
    "assets/imagenes/m75_domingos/m75d65_66.jpg": "D65/D66",
    "assets/imagenes/m75_domingos/m75d67_68.jpg": "D67/D68",
    "assets/imagenes/m75_domingos/m75dcompleto.png": "Cuadro Completo",
    "assets/pdfs/tira_parada_sb1.pdf": "Tira Parada SB1",
    "assets/imagenes/sb1_laborables/sb1l213_214.jpg": "L213/L214",
    "assets/imagenes/sb1_laborables/sb1l215_216.jpg": "L215/L216",
    "assets/imagenes/sb1_laborables/sb1l217_218.jpg": "L217/L218",
    "assets/imagenes/sb1_laborables/sb1l219_220.jpg": "L219/L220",
    "assets/imagenes/sb1_laborables/sb1l221_222.jpg": "L221/L222",
    "assets/imagenes/sb1_laborables/sb1l223_224.jpg": "L223/L224",
    "assets/imagenes/sb1_laborables/sb1l225_226.jpg": "L225/L226",
    "assets/imagenes/sb1_laborables/sb1l227_228.jpg": "L227/L228",
    "assets/imagenes/sb1_laborables/sb1l229_230.jpg": "L229/L230",
    "assets/imagenes/sb1_laborables/sb1l231_232.jpg": "L231/L232",
    "assets/imagenes/sb1_laborables/sb1lcompleto.png": "Cuadro Completo",
    "assets/imagenes/sb1_sabados/sb1s167_168.jpg": "S167/S168",
    "assets/imagenes/sb1_sabados/sb1s169_170.jpg": "S169/S170",
    "assets/imagenes/sb1_sabados/sb1s171_172.jpg": "S171/S172",
    "assets/imagenes/sb1_sabados/sb1s173_174.jpg": "S173/S174",
    "assets/imagenes/sb1_sabados/sb1s175_176.jpg": "S175/S176",
    "assets/imagenes/sb1_sabados/sb1s177_178.jpg": "S177/S178",
    "assets/imagenes/sb1_sabados/sb1scompleto.png": "Cuadro Completo",
    "assets/imagenes/sb1_domingos/sb1d147_148.jpg": "D147/D148",
    "assets/imagenes/sb1_domingos/sb1d149_150.jpg": "D149/D150",
    "assets/imagenes/sb1_domingos/sb1d151_152.jpg": "D151/D152",
    "assets/imagenes/sb1_domingos/sb1d153_154.jpg": "D153/D154",
    "assets/imagenes/sb1_domingos/sb1d155_156.jpg": "D155/D156",
    "assets/imagenes/sb1_domingos/sb1dcompleto.png": "Cuadro Completo",
    "assets/pdfs/tira_parada_sb2.pdf": "Tira Parada SB2",
    "assets/imagenes/sb2_laborables/sb2l161_162.jpg": "L161/L162",
    "assets/imagenes/sb2_laborables/sb2lsdcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/sb2_sabados/sb2sd95_96.jpg": "S95/S96\nD75/D76",
    "assets/imagenes/sb2_sabados/sb2lsdcompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_sb3.pdf": "Tira Parada SB3",
    "assets/imagenes/sb3_laborables/sb3l211_212.jpg": "L211/L212",
    "assets/imagenes/sb3_laborables/sb3lsdcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/sb3_sabados/sb3sd129_130.jpg": "S129/S130\nD109/D110",
    "assets/imagenes/sb3_sabados/sb3lsdcompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_x43.pdf": "Tira Parada X43",
    "assets/imagenes/x43_laborables/x43l01_02.jpg": "L01/L02",
    "assets/imagenes/x43_laborables/x43l03_04.jpg": "L03/L04",
    "assets/imagenes/x43_laborables/x43l05_06.jpg": "L05/L06",
    "assets/imagenes/x43_laborables/x43l445_08.png": "L445/L446",
    "assets/imagenes/x43_laborables/x43l09_10.jpg": "L09/L10",
    "assets/imagenes/x43_laborables/x43l383.jpg": "L383",
    "assets/imagenes/x43_laborables/x43lcompleto.png": "Cuadro Completo",
    "assets/imagenes/x43_sabados/x43s01_02.jpg": "S01/S02",
    "assets/imagenes/x43_sabados/x43s03_04.jpg": "S03/S04",
    "assets/imagenes/x43_sabados/x43scompleto.png": "Cuadro Completo",
    "assets/pdfs/tira_parada_x73.pdf": "Tira Parada X73",
    "assets/imagenes/x73_laborables/x73l413_414.png": "L413/L414",
    "assets/imagenes/x73_laborables/x73l415_416.png": "L415/L416",
    "assets/imagenes/x73_laborables/x73l417_418.png": "L417/L418",
    "assets/imagenes/x73_laborables/x73l419_420.png": "L419/L420",
    "assets/imagenes/x73_laborables/x73lcompleto.png": "Cuadro Completo",
    "assets/pdfs/tira_parada_x79.pdf": "Tira Parada X79",
    "assets/imagenes/x79_laborables/x79l421_422.png": "L421/L422",
    "assets/imagenes/x79_laborables/x79l423_424.png": "L423/L424",
    "assets/imagenes/x79_laborables/x79l425_426.png": "L425/L426",
    "assets/imagenes/x79_laborables/x79l427_428.png": "L427/L428",
    "assets/imagenes/x79_laborables/x79l429_430.png": "L429/L430",
    "assets/imagenes/x79_laborables/x79l431_432.png": "L431/L432",
    "assets/imagenes/x79_laborables/x79l433_434.png": "L433/L434",
    "assets/imagenes/x79_laborables/x79l435_436.png": "L435/L436",
    "assets/imagenes/x79_laborables/x79l437_438.png": "L437/L438",
    "assets/imagenes/x79_laborables/x79l439_440.png": "L439/L440",
    "assets/imagenes/x79_laborables/x79l441_442.png": "L441/L442",
    "assets/imagenes/x79_laborables/x79l443_444.png": "L443/L444",
    "assets/imagenes/x79_laborables/x79lcompleto.png": "Cuadro Completo",
    "assets/imagenes/x79_sabados/x79s05_06.jpg": "S05/S06",
    "assets/imagenes/x79_sabados/x79s123_124.jpg": "S123/S124",
    "assets/imagenes/x79_sabados/x79s125_126.jpg": "S125/S126",
    "assets/imagenes/x79_sabados/x79s11_12.jpg": "S11/S12",
    "assets/imagenes/x79_sabados/x79s13_14.jpg": "S13/S14",
    "assets/imagenes/x79_sabados/x79s15_16.jpg": "S15/S16",
    "assets/imagenes/x79_sabados/x79scompleto.png": "Cuadro Completo",
    "assets/imagenes/x79_domingos/x79d103_104.jpg": "D103/D104",
    "assets/imagenes/x79_domingos/x79d105_106.jpg": "D105/D106",
    "assets/imagenes/x79_domingos/x79d05_06.jpg": "D05/D06",
    "assets/imagenes/x79_domingos/x79d07_08.jpg": "D07/D08",
    "assets/imagenes/x79_domingos/x79dcompleto.png": "Cuadro Completo",
  };

  // ---------------- AppBar uniforme con línea naranja ----------------
  AppBar _buildAppBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: Container(
          height: 4,
          color: const Color.fromARGB(255, 233, 120, 28),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1️⃣ Pantalla principal
    if (pantalla == null && subpantalla == null) {
      return Scaffold(
        appBar: _buildAppBar("Turnos"),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Color.fromARGB(40, 233, 120, 28),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // ---------------- Líneas ----------------
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pantallasPrincipales.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return _iconoPantalla(context, pantallasPrincipales[index]);
                  },
                ),

                const SizedBox(height: 70),

                // ---------------- Índice Turnos ----------------
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const IndiceTurnos()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Índice Turnos",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // 2️⃣ Subpantallas
    if (pantalla != null && subpantalla == null) {
      final subpantallas = subPantallasPorPantalla[pantalla] ?? [];

      return Scaffold(
        appBar: _buildAppBar(pantalla!),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: subpantallas.map((sub) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: _botonSubpantalla(context, pantalla!, sub),
              );
            }).toList(),
          ),
        ),
      );
    }

    // 3️⃣ Contenido final o imágenes
    final key = "$pantalla-$subpantalla";
    final imagenes = imagenesPorPantalla[key];

    if (imagenes != null && imagenes.isNotEmpty) {
      return Scaffold(
        appBar: _buildAppBar("$pantalla - $subpantalla"),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,

              childAspectRatio: pantalla == "L77" ? 0.7 : 1.0,
            ),

            itemCount: imagenes.length,

            itemBuilder: (context, index) {
              final ruta = imagenes[index];

              return GestureDetector(
                onTap: () => _abrirImagenCompleta(context, ruta),

                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Icon(
                        Icons.insert_drive_file,
                        size: 40,
                        color: ruta.toLowerCase().endsWith('.pdf')
                            ? Colors.green
                            : ruta.toLowerCase().contains('completo')
                            ? const Color.fromARGB(255, 233, 120, 28)
                            : Colors.blueGrey,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      nombresIconos[ruta] ?? "Sin nombre",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13),
                      maxLines: 3,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    }

    // Si no hay imágenes, mostrar contenido de texto
    final contenido = contenidoSubPantalla[key] ?? "Pantalla sin contenido";

    return Scaffold(
      appBar: _buildAppBar("$pantalla - $subpantalla"),
      body: Center(
        child: Text(
          contenido,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // ---------------- Icono de línea ----------------
  Widget _iconoPantalla(BuildContext context, String nombrePantalla) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Turnos(pantalla: nombrePantalla)),
        );
      },

      child: CircleAvatar(
        radius: 50,
        backgroundColor: const Color.fromARGB(255, 233, 120, 28),

        child: Text(
          nombrePantalla,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  // ---------------- Botón de subpantalla ----------------
  Widget _botonSubpantalla(BuildContext context, String pantalla, String sub) {
    return SizedBox(
      width: 280,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 233, 120, 28),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Turnos(pantalla: pantalla, subpantalla: sub),
            ),
          );
        },

        child: Text(sub, textAlign: TextAlign.center),
      ),
    );
  }

  // ---------------- Abrir imagen / PDF ----------------
  void _abrirImagenCompleta(BuildContext context, String ruta) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          final esPdf = ruta.toLowerCase().endsWith('.pdf');

          return Scaffold(
            backgroundColor: Colors.white,

            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
            ),

            body: esPdf
                ? PdfViewPinch(
                    controller: PdfControllerPinch(
                      document: PdfDocument.openAsset(ruta),
                    ),
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      return InteractiveViewer(
                        panEnabled: true,
                        scaleEnabled: true,
                        minScale: 1.0,
                        maxScale: 8.0,

                        child: SizedBox(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,

                          child: Center(
                            child: Image.asset(
                              ruta,
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
