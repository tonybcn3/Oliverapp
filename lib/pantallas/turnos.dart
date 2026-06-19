import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

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
    "X79": ["LABORABLES", "SÁBADOS", "DOMINGOS Y FESTIVOS"],
  };

  // ---------------- Contenido de subpantallas (texto si no hay imágenes) ----------------
  static final Map<String, String> contenidoSubPantalla = {};

  // Todas las imágenes por subpantalla
  static final Map<String, List<String>> imagenesPorPantalla = {
    "M5-LABORABLES": [
      "assets/imagenes/m5_laborables/m5l175_176.jpg",
      "assets/imagenes/m5_laborables/m5l177_178.jpg",
      "assets/imagenes/m5_laborables/m5l179_180.jpg",
      "assets/imagenes/m5_laborables/m5l181_182.jpg",
      "assets/imagenes/m5_laborables/m5l183_184.jpg",
      "assets/imagenes/m5_laborables/m5l185_186.jpg",
      "assets/imagenes/m5_laborables/m5l187_188.jpg",
      "assets/imagenes/m5_laborables/m5l189_190.jpg",
      "assets/imagenes/m5_laborables/m5l191_192.jpg",
      "assets/imagenes/m5_laborables/m5l193_194.jpg",
      "assets/imagenes/m5_laborables/m5lcompleto.jpg",
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
      "assets/imagenes/m5_sabados/m5scompleto.jpg",
      "assets/pdfs/tira_parada_m5.pdf",
    ],
    "M5-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/m5_domingos/m5d79_80.jpg",
      "assets/imagenes/m5_domingos/m5d81_82.jpg",
      "assets/imagenes/m5_domingos/m5d83_84.jpg",
      "assets/imagenes/m5_domingos/m5d85_86.jpg",
      "assets/imagenes/m5_domingos/m5d87_88.jpg",
      "assets/imagenes/m5_domingos/m5d89_90.jpg",
      "assets/imagenes/m5_domingos/m5dcompleto.jpg",
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
      "assets/imagenes/l46_laborables/l46lcompleto.jpg",
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
      "assets/imagenes/l46_laborablesvc/l46lvccompleto.jpg",
      "assets/pdfs/tira_parada_l46.pdf",
    ],
    "L46-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/l46_sabados/l46s17_18.jpg",
      "assets/imagenes/l46_sabados/l46s19_20.jpg",
      "assets/imagenes/l46_sabados/l46s21_22.jpg",
      "assets/imagenes/l46_sabados/l46s23_24.jpg",
      "assets/imagenes/l46_sabados/l46s25_26.jpg",
      "assets/imagenes/l46_sabados/l46scompleto.jpg",
      "assets/pdfs/tira_parada_l46.pdf",
    ],
    "L46-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/l46_domingos/l46d187_188.jpg",
      "assets/imagenes/l46_domingos/l46d189_190.jpg",
      "assets/imagenes/l46_domingos/l46d191_192.jpg",
      "assets/imagenes/l46_domingos/l46d193_194.jpg",
      "assets/imagenes/l46_domingos/l46dcompleto.jpg",
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
      "assets/imagenes/l52_laborables/l52lcompleto.jpg",
      "assets/pdfs/tira_parada_l52.pdf",
    ],
    "L52-SÁBADOS": [
      "assets/imagenes/l52_sabados/l52s27_28.jpg",
      "assets/imagenes/l52_sabados/l52s29_30.jpg",
      "assets/imagenes/l52_sabados/l52s31_32.jpg",
      "assets/imagenes/l52_sabados/l52s33_34.jpg",
      "assets/imagenes/l52_sabados/l52s35_36.jpg",
      "assets/imagenes/l52_sabados/l52scompleto.jpg",
      "assets/pdfs/tira_parada_l52.pdf",
    ],
    "L52-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/l52_domingos/l52d15_16.jpg",
      "assets/imagenes/l52_domingos/l52d17_18.jpg",
      "assets/imagenes/l52_domingos/l52d19_20.jpg",
      "assets/imagenes/l52_domingos/l52d21_22.jpg",
      "assets/imagenes/l52_domingos/l52dcompleto.jpg",
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
      "assets/imagenes/lx70_laborables/lx70lcompleto.jpg",
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
      "assets/imagenes/lx70_sabados/lx70scompleto.jpg",
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
      "assets/imagenes/lx70_domingos/lx70dcompleto.jpg",
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
      "assets/imagenes/l72_laborables/l72lcompleto.jpg",
      "assets/pdfs/tira_parada_l72.pdf",
    ],
    "L72-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/l72_sabados/l72s45_46.jpg",
      "assets/imagenes/l72_sabados/l72s47_48.jpg",
      "assets/imagenes/l72_sabados/l72s49_50.jpg",
      "assets/imagenes/l72_sabados/l72s51_52.jpg",
      "assets/imagenes/l72_sabados/l72scompleto.jpg",
      "assets/pdfs/tira_parada_l72.pdf",
    ],
    "L72-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/l72_domingos/l72d31_32.jpg",
      "assets/imagenes/l72_domingos/l72d33_34.jpg",
      "assets/imagenes/l72_domingos/l72d35_36.jpg",
      "assets/imagenes/l72_domingos/l72d37_38.jpg",
      "assets/imagenes/l72_domingos/l72dcompleto.jpg",
      "assets/pdfs/tira_parada_l72.pdf",
    ],
    "L74-LABORABLES": [
      "assets/imagenes/l74_laborables/l74l233_234.jpg",
      "assets/imagenes/l74_laborables/l74l235_236.jpg",
      "assets/imagenes/l74_laborables/l74l237_238.jpg",
      "assets/imagenes/l74_laborables/l74lcompleto.jpg",
      "assets/pdfs/tira_parada_l74.pdf",
    ],
    "L74-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/l74_sabados/l74s53_54.jpg",
      "assets/imagenes/l74_sabados/l74s55_56.jpg",
      "assets/imagenes/l74_sabados/l74scompleto.jpg",
      "assets/pdfs/tira_parada_l74.pdf",
    ],
    "L74-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/l74_domingos/l74d39_40.jpg",
      "assets/imagenes/l74_domingos/l74d41_42.jpg",
      "assets/imagenes/l74_domingos/l74dcompleto.jpg",
      "assets/pdfs/tira_parada_l74.pdf",
    ],
    "L76-LABORABLES": [
      "assets/imagenes/l76_laborables/l76l107_108.jpg",
      "assets/imagenes/l76_laborables/l76l345_110.jpg",
      "assets/imagenes/l76_laborables/l76l111_112.jpg",
      "assets/imagenes/l76_laborables/l76lcompleto.jpg",
      "assets/pdfs/tira_parada_l76.pdf",
    ],
    "L76-SÁBADOS": [
      "assets/imagenes/l76_sabados/l76s57_58.jpg",
      "assets/imagenes/l76_sabados/l76s59_60.jpg",
      "assets/imagenes/l76_sabados/l76s61_62.jpg",
      "assets/imagenes/l76_sabados/l76scompleto.jpg",
      "assets/pdfs/tira_parada_l76.pdf",
    ],
    "L76-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/l76_domingos/l76d43_44.jpg",
      "assets/imagenes/l76_domingos/l76d45_46.jpg",
      "assets/imagenes/l76_domingos/l76dcompleto.jpg",
      "assets/pdfs/tira_parada_l76.pdf",
    ],
    "L77-TODOS LOS DIAS": [
      "assets/imagenes/l77_laborables/l77l313_300.jpg",
      "assets/imagenes/l77_laborables/l77l301_302.jpg",
      "assets/imagenes/l77_laborables/l77l303_304.jpg",
      "assets/imagenes/l77_laborables/l77l305_306.jpg",
      "assets/imagenes/l77_laborables/l77l307_308.jpg",
      "assets/imagenes/l77_laborables/l77l309_310.jpg",
      "assets/imagenes/l77_laborables/l77lcompleto.jpg",
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
      "assets/imagenes/l77_agosto/l77lacompleto.jpg",
      "assets/pdfs/tira_parada_l77.pdf",
    ],
    "L78-LABORABLES": [
      "assets/imagenes/l78_laborables/l78l123_124.jpg",
      "assets/imagenes/l78_laborables/l78l125_126.jpg",
      "assets/imagenes/l78_laborables/l78l127_128.jpg",
      "assets/imagenes/l78_laborables/l78l129_130.jpg",
      "assets/imagenes/l78_laborables/l78l131_132.jpg",
      "assets/imagenes/l78_laborables/l78l133_134.jpg",
      "assets/imagenes/l78_laborables/l78lcompleto.jpg",
      "assets/pdfs/tira_parada_l78.pdf",
    ],
    "L78-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/l78_sabados/l78s73_74.jpg",
      "assets/imagenes/l78_sabados/l78s75_76.jpg",
      "assets/imagenes/l78_sabados/l78s77_78.jpg",
      "assets/imagenes/l78_sabados/l78s79_80.jpg",
      "assets/imagenes/l78_sabados/l78scompleto.jpg",
      "assets/pdfs/tira_parada_l78.pdf",
    ],
    "L78-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/l78_domingos/l78d57_58.jpg",
      "assets/imagenes/l78_domingos/l78d59_60.jpg",
      "assets/imagenes/l78_domingos/l78d61_62.jpg",
      "assets/imagenes/l78_domingos/l78d63_64.jpg",
      "assets/imagenes/l78_domingos/l78dcompleto.jpg",
      "assets/pdfs/tira_parada_l78.pdf",
    ],
    "M75-LABORABLES": [
      "assets/imagenes/m75_laborables/m75l289_290.jpg",
      "assets/imagenes/m75_laborables/m75l291_292.jpg",
      "assets/imagenes/m75_laborables/m75l293_294.jpg",
      "assets/imagenes/m75_laborables/m75l295_296.jpg",
      "assets/imagenes/m75_laborables/m75l297_298.jpg",
      "assets/imagenes/m75_laborables/m75lcompleto.jpg",
      "assets/pdfs/tira_parada_m75.pdf",
    ],
    "M75-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/m75_sabados/m75s81_82.jpg",
      "assets/imagenes/m75_sabados/m75s83_84.jpg",
      "assets/imagenes/m75_sabados/m75scompleto.jpg",
      "assets/pdfs/tira_parada_m75.pdf",
    ],
    "M75-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/m75_domingos/m75d65_66.jpg",
      "assets/imagenes/m75_domingos/m75d67_68.jpg",
      "assets/imagenes/m75_domingos/m75dcompleto.jpg",
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
      "assets/imagenes/sb1_laborables/sb1lcompleto.jpg",
      "assets/pdfs/tira_parada_sb1.pdf",
    ],
    "SB1-SÁBADOS Y LABORABLES AGOSTO": [
      "assets/imagenes/sb1_sabados/sb1s167_168.jpg",
      "assets/imagenes/sb1_sabados/sb1s169_170.jpg",
      "assets/imagenes/sb1_sabados/sb1s171_172.jpg",
      "assets/imagenes/sb1_sabados/sb1s173_174.jpg",
      "assets/imagenes/sb1_sabados/sb1s175_176.jpg",
      "assets/imagenes/sb1_sabados/sb1s177_178.jpg",
      "assets/imagenes/sb1_sabados/sb1scompleto.jpg",
      "assets/pdfs/tira_parada_sb1.pdf",
    ],
    "SB1-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/sb1_domingos/sb1d147_148.jpg",
      "assets/imagenes/sb1_domingos/sb1d149_150.jpg",
      "assets/imagenes/sb1_domingos/sb1d151_152.jpg",
      "assets/imagenes/sb1_domingos/sb1d153_154.jpg",
      "assets/imagenes/sb1_domingos/sb1d155_156.jpg",
      "assets/imagenes/sb1_domingos/sb1dcompleto.jpg",
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
      "assets/imagenes/x43_laborables/x43l07_08.jpg",
      "assets/imagenes/x43_laborables/x43l09_10.jpg",
      "assets/imagenes/x43_laborables/x43l383.jpg",
      "assets/imagenes/x43_laborables/x43lcompleto.jpg",
      "assets/pdfs/tira_parada_x43.pdf",
    ],
    "X43-SÁBADOS": [
      "assets/imagenes/x43_sabados/x43s01_02.jpg",
      "assets/imagenes/x43_sabados/x43s03_04.jpg",
      "assets/imagenes/x43_sabados/x43scompleto.jpg",
      "assets/pdfs/tira_parada_x43.pdf",
    ],
    "X79-LABORABLES": [
      "assets/imagenes/x79_laborables/x79l315_316.jpg",
      "assets/imagenes/x79_laborables/x79l317_318.jpg",
      "assets/imagenes/x79_laborables/x79l319_320.jpg",
      "assets/imagenes/x79_laborables/x79l321_322.jpg",
      "assets/imagenes/x79_laborables/x79l323_324.jpg",
      "assets/imagenes/x79_laborables/x79l325_326.jpg",
      "assets/imagenes/x79_laborables/x79l327_328.jpg",
      "assets/imagenes/x79_laborables/x79l329_330.jpg",
      "assets/imagenes/x79_laborables/x79l331_332.jpg",
      "assets/imagenes/x79_laborables/x79l333_334.jpg",
      "assets/imagenes/x79_laborables/x79l335_336.jpg",
      "assets/imagenes/x79_laborables/x79l337_338.jpg",
      "assets/imagenes/x79_laborables/x79l339_340.jpg",
      "assets/imagenes/x79_laborables/x79l341_342.jpg",
      "assets/imagenes/x79_laborables/x79l343_344.jpg",
      "assets/imagenes/x79_laborables/x79lcompleto.jpg",
      "assets/pdfs/tira_parada_x79.pdf",
    ],
    "X79-SÁBADOS": [
      "assets/imagenes/x79_sabados/x79s05_06.jpg",
      "assets/imagenes/x79_sabados/x79s123_124.jpg",
      "assets/imagenes/x79_sabados/x79s125_126.jpg",
      "assets/imagenes/x79_sabados/x79s11_12.jpg",
      "assets/imagenes/x79_sabados/x79s13_14.jpg",
      "assets/imagenes/x79_sabados/x79s15_16.jpg",
      "assets/imagenes/x79_sabados/x79scompleto.jpg",
      "assets/pdfs/tira_parada_x79.pdf",
    ],
    "X79-DOMINGOS Y FESTIVOS": [
      "assets/imagenes/x79_domingos/x79d103_104.jpg",
      "assets/imagenes/x79_domingos/x79d105_106.jpg",
      "assets/imagenes/x79_domingos/x79d05_06.jpg",
      "assets/imagenes/x79_domingos/x79d07_08.jpg",
      "assets/imagenes/x79_domingos/x79dcompleto.jpg",
      "assets/pdfs/tira_parada_x79.pdf",
    ],
  };

  // Nombres personalizados para mostrar debajo de los iconos
  static final Map<String, String> nombresIconos = {
    "assets/pdfs/tira_parada_m5.pdf": "Tira Parada M5",
    "assets/imagenes/m5_laborables/m5l175_176.jpg": "L-175/L-176",
    "assets/imagenes/m5_laborables/m5l177_178.jpg": "L-177/L-178",
    "assets/imagenes/m5_laborables/m5l179_180.jpg": "L-179/L-180",
    "assets/imagenes/m5_laborables/m5l181_182.jpg": "L-181/L-182",
    "assets/imagenes/m5_laborables/m5l183_184.jpg": "L-183/L-184",
    "assets/imagenes/m5_laborables/m5l185_186.jpg": "L-185/L-186",
    "assets/imagenes/m5_laborables/m5l187_188.jpg": "L-187/L-188",
    "assets/imagenes/m5_laborables/m5l189_190.jpg": "L-189/L-190",
    "assets/imagenes/m5_laborables/m5l191_192.jpg": "L-191/L-192",
    "assets/imagenes/m5_laborables/m5l193_194.jpg": "L-193/L-194",
    "assets/imagenes/m5_laborables/m5lcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/m5_sabados/m5s191_192.jpg": "S-191/S-192",
    "assets/imagenes/m5_sabados/m5s193_194.jpg": "S-193/S-194",
    "assets/imagenes/m5_sabados/m5s195_196.jpg": "S-195/S-196",
    "assets/imagenes/m5_sabados/m5s197_198.jpg": "S-197/S-198",
    "assets/imagenes/m5_sabados/m5s199_200.jpg": "S-199/S-200",
    "assets/imagenes/m5_sabados/m5s201_202.jpg": "S-201/S-202",
    "assets/imagenes/m5_sabados/m5s203_204.jpg": "S-203/S-204",
    "assets/imagenes/m5_sabados/m5scompleto.jpg": "Cuadro Completo",
    "assets/imagenes/m5_domingos/m5d79_80.jpg": "D-79/D-80",
    "assets/imagenes/m5_domingos/m5d81_82.jpg": "D-81/D-82",
    "assets/imagenes/m5_domingos/m5d83_84.jpg": "D-83/D-84",
    "assets/imagenes/m5_domingos/m5d85_86.jpg": "D-85/D-86",
    "assets/imagenes/m5_domingos/m5d87_88.jpg": "D-87/D-88",
    "assets/imagenes/m5_domingos/m5d89_90.jpg": "D-89/D-90",
    "assets/imagenes/m5_domingos/m5dcompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_l46.pdf": "Tira Parada L46",
    "assets/imagenes/l46_laborables/l46l367_368.jpg": "L-367/L-368",
    "assets/imagenes/l46_laborables/l46l369_370.jpg": "L-369/L-370",
    "assets/imagenes/l46_laborables/l46l371_372.jpg": "L-371/L-372",
    "assets/imagenes/l46_laborables/l46l373_374.jpg": "L-373/L-374",
    "assets/imagenes/l46_laborables/l46l375_376.jpg": "L-375/L-376",
    "assets/imagenes/l46_laborables/l46l377_378.jpg": "L-377/L-378",
    "assets/imagenes/l46_laborables/l46l379_380.jpg": "L-379/L-380",
    "assets/imagenes/l46_laborables/l46l381_382.jpg": "L-381/L-382",
    "assets/imagenes/l46_laborables/l46lcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l46_laborablesvc/l46lvc49_50.jpg": "L-49/L-50",
    "assets/imagenes/l46_laborablesvc/l46lvc51_52.jpg": "L-51/L-52",
    "assets/imagenes/l46_laborablesvc/l46lvc53_54.jpg": "L-53/L-54",
    "assets/imagenes/l46_laborablesvc/l46lvc55_56.jpg": "L-55/L-56",
    "assets/imagenes/l46_laborablesvc/l46lvc57_58.jpg": "L-57/L-58",
    "assets/imagenes/l46_laborablesvc/l46lvc59_60.jpg": "L-59/L-60",
    "assets/imagenes/l46_laborablesvc/l46lvc61_62.jpg": "L-61/L-62",
    "assets/imagenes/l46_laborablesvc/l46lvccompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l46_sabados/l46s17_18.jpg": "S-17/S-18",
    "assets/imagenes/l46_sabados/l46s19_20.jpg": "S-19/S-20",
    "assets/imagenes/l46_sabados/l46s21_22.jpg": "S-21/S-22",
    "assets/imagenes/l46_sabados/l46s23_24.jpg": "S-23/S-24",
    "assets/imagenes/l46_sabados/l46s25_26.jpg": "S-25/S-26",
    "assets/imagenes/l46_sabados/l46scompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l46_domingos/l46d187_188.jpg": "D-187/D-188",
    "assets/imagenes/l46_domingos/l46d189_190.jpg": "D-189/D-190",
    "assets/imagenes/l46_domingos/l46d191_192.jpg": "D-191/D-192",
    "assets/imagenes/l46_domingos/l46d193_194.jpg": "D-193/D-194",
    "assets/imagenes/l46_domingos/l46dcompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_l52.pdf": "Tira Parada L52",
    "assets/imagenes/l52_laborables/l52l63_64.jpg": "L-63/L-64",
    "assets/imagenes/l52_laborables/l52l65_66.jpg": "L-65/L-66",
    "assets/imagenes/l52_laborables/l52l67_68.jpg": "L-67/L-68",
    "assets/imagenes/l52_laborables/l52l69_70.jpg": "L-69/L-70",
    "assets/imagenes/l52_laborables/l52l71_72.jpg": "L-71/L-72",
    "assets/imagenes/l52_laborables/l52l73_74.jpg": "L-73/L-74",
    "assets/imagenes/l52_laborables/l52l75_76.jpg": "L-75/L-76",
    "assets/imagenes/l52_laborables/l52lcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l52_sabados/l52s27_28.jpg": "S-27/S-28",
    "assets/imagenes/l52_sabados/l52s29_30.jpg": "S-29/S-30",
    "assets/imagenes/l52_sabados/l52s31_32.jpg": "S-31/S-32",
    "assets/imagenes/l52_sabados/l52s33_34.jpg": "S-33/S-34",
    "assets/imagenes/l52_sabados/l52s35_36.jpg": "S-35/S-36",
    "assets/imagenes/l52_sabados/l52scompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l52_domingos/l52d15_16.jpg": "D-15/D-16",
    "assets/imagenes/l52_domingos/l52d17_18.jpg": "D-17/D-18",
    "assets/imagenes/l52_domingos/l52d19_20.jpg": "D-19/D-20",
    "assets/imagenes/l52_domingos/l52d21_22.jpg": "D-21/D-22",
    "assets/imagenes/l52_domingos/l52dcompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_l70.pdf": "Tira Parada L70",
    "assets/pdfs/tira_parada_x70.pdf": "Tira Parada X70",
    "assets/imagenes/lx70_laborables/lx70l239_240.jpg": "L-239/L-240",
    "assets/imagenes/lx70_laborables/lx70l241_242.jpg": "L-241/L-242",
    "assets/imagenes/lx70_laborables/lx70l243_244.jpg": "L-243/L-244",
    "assets/imagenes/lx70_laborables/lx70l245_246.jpg": "L-245/L-246",
    "assets/imagenes/lx70_laborables/lx70l247_248.jpg": "L-247/L-248",
    "assets/imagenes/lx70_laborables/lx70l249_250.jpg": "L-249/L-250",
    "assets/imagenes/lx70_laborables/lx70l251_252.jpg": "L-251/L-252",
    "assets/imagenes/lx70_laborables/lx70l253_254.jpg": "L-253/L-254",
    "assets/imagenes/lx70_laborables/lx70l255_256.jpg": "L-255/L-256",
    "assets/imagenes/lx70_laborables/lx70l257_258.jpg": "L-257/L-258",
    "assets/imagenes/lx70_laborables/lx70l259_260.jpg": "L-259/L-260",
    "assets/imagenes/lx70_laborables/lx70l261_262.jpg": "L-261/L-262",
    "assets/imagenes/lx70_laborables/lx70lcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/lx70_sabados/lx70s223_224.jpg": "S-223/S-224",
    "assets/imagenes/lx70_sabados/lx70s225_226.jpg": "S-225/S-226",
    "assets/imagenes/lx70_sabados/lx70s227_228.jpg": "S-227/S-228",
    "assets/imagenes/lx70_sabados/lx70s229_230.jpg": "S-229/S-230",
    "assets/imagenes/lx70_sabados/lx70s231_232.jpg": "S-231/S-232",
    "assets/imagenes/lx70_sabados/lx70s233_234.jpg": "S-233/S-234",
    "assets/imagenes/lx70_sabados/lx70scompleto.jpg": "Cuadro Completo",
    "assets/imagenes/lx70_domingos/lx70d157_158.jpg": "D-157/D-158",
    "assets/imagenes/lx70_domingos/lx70d159_160.jpg": "D-159/D-160",
    "assets/imagenes/lx70_domingos/lx70d161_162.jpg": "D-161/D-162",
    "assets/imagenes/lx70_domingos/lx70d163_164.jpg": "D-163/D-164",
    "assets/imagenes/lx70_domingos/lx70d165_166.jpg": "D-165/D-166",
    "assets/imagenes/lx70_domingos/lx70d167_168.jpg": "D-167/D-168",
    "assets/imagenes/lx70_domingos/lx70dcompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_l72.pdf": "Tira Parada L72",
    "assets/imagenes/l72_laborables/l72l89_90.jpg": "L-89/L-90",
    "assets/imagenes/l72_laborables/l72l91_92.jpg": "L-91/L-92",
    "assets/imagenes/l72_laborables/l72l93_94.jpg": "L-93/L-94",
    "assets/imagenes/l72_laborables/l72l95_96.jpg": "L-95/L-96",
    "assets/imagenes/l72_laborables/l72l97_98.jpg": "L-97/L-98",
    "assets/imagenes/l72_laborables/l72l99_100.jpg": "L-99/L-100",
    "assets/imagenes/l72_laborables/l72lcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l72_sabados/l72s45_46.jpg": "S-45/S-46",
    "assets/imagenes/l72_sabados/l72s47_48.jpg": "S-47/S-48",
    "assets/imagenes/l72_sabados/l72s49_50.jpg": "S-49/S-50",
    "assets/imagenes/l72_sabados/l72s51_52.jpg": "S-51/S-52",
    "assets/imagenes/l72_sabados/l72scompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l72_domingos/l72d31_32.jpg": "D-31/D-32",
    "assets/imagenes/l72_domingos/l72d33_34.jpg": "D-33/D-34",
    "assets/imagenes/l72_domingos/l72d35_36.jpg": "D-35/D-36",
    "assets/imagenes/l72_domingos/l72d37_38.jpg": "D-37/D-38",
    "assets/imagenes/l72_domingos/l72dcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l74_laborables/l74l233_234.jpg": "L-233/L-234",
    "assets/pdfs/tira_parada_l74.pdf": "Tira Parada L74",
    "assets/imagenes/l74_laborables/l74l235_236.jpg": "L-235/L-236",
    "assets/imagenes/l74_laborables/l74l237_238.jpg": "L-237/L-238",
    "assets/imagenes/l74_laborables/l74lcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l74_sabados/l74s53_54.jpg": "S-53/S-54",
    "assets/imagenes/l74_sabados/l74s55_56.jpg": "S-55/S-56",
    "assets/imagenes/l74_sabados/l74scompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l74_domingos/l74d39_40.jpg": "D-39/D-40",
    "assets/imagenes/l74_domingos/l74d41_42.jpg": "D-41/D-42",
    "assets/imagenes/l74_domingos/l74dcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l76_laborables/l76l107_108.jpg": "L-107/L-108",
    "assets/pdfs/tira_parada_l76.pdf": "Tira Parada L76",
    "assets/imagenes/l76_laborables/l76l345_110.jpg": "L-345/L-110",
    "assets/imagenes/l76_laborables/l76l111_112.jpg": "L-111/L-112",
    "assets/imagenes/l76_laborables/l76lcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l76_sabados/l76s57_58.jpg": "S-57/S-58",
    "assets/imagenes/l76_sabados/l76s59_60.jpg": "S-59/S-60",
    "assets/imagenes/l76_sabados/l76s61_62.jpg": "S-61/S-62",
    "assets/imagenes/l76_sabados/l76scompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l76_domingos/l76d43_44.jpg": "D-43/D-44",
    "assets/imagenes/l76_domingos/l76d45_46.jpg": "D-45/D-46",
    "assets/imagenes/l76_domingos/l76dcompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_l77.pdf": "Tira Parada L77",
    "assets/imagenes/l77_laborables/l77l313_300.jpg":
        "L-313/L-300\nS-165/S-152\nD-145/D-132",
    "assets/imagenes/l77_laborables/l77l301_302.jpg":
        "L-301/L-302\nS-153/S-154\nD-133/D-134",
    "assets/imagenes/l77_laborables/l77l303_304.jpg":
        "L-303/L-304\nS-155/S-156\nD-135/D-136",
    "assets/imagenes/l77_laborables/l77l305_306.jpg":
        "L-305/L-306\nS-157/S-158\nD-137/D-138",
    "assets/imagenes/l77_laborables/l77l307_308.jpg":
        "L-307/L-308\nS-159/S-160\nD-139/D-140",
    "assets/imagenes/l77_laborables/l77l309_310.jpg":
        "L-309/L-310\nS-161/S-162\nD-141/D-142",
    "assets/imagenes/l77_laborables/l77lcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l77_agosto/l77la149_150.jpg":
        "L-149/L-150\nS-205/S-206\nD-169/D-170",
    "assets/imagenes/l77_agosto/l77la151_152.jpg":
        "L-151/L-152\nS-207/S-208\nD-171/D-172",
    "assets/imagenes/l77_agosto/l77la153_154.jpg":
        "L-153/L-154\nS-209/S-210\nD-173/D-174",
    "assets/imagenes/l77_agosto/l77la155_156.jpg":
        "L-155/L-156\nS-211/S-212\nD-175/D-176",
    "assets/imagenes/l77_agosto/l77la157_158.jpg":
        "L-157/L-158\nS-213/S-214\nD-177/D-178",
    "assets/imagenes/l77_agosto/l77la159_160.jpg":
        "L-159/L-160\nS-215/S-216\nD-179/D-180",
    "assets/imagenes/l77_agosto/l77la161_162.jpg":
        "L-161/L-162\nS-217/S-218\nD-181/D-182",
    "assets/imagenes/l77_agosto/l77la163_164.jpg":
        "L-163/L-164\nS-219/S-220\nD-183/D-184",
    "assets/imagenes/l77_agosto/l77la165_166.jpg":
        "L-165/L-166\nS-221/S-222\nD-185/D-186",
    "assets/imagenes/l77_agosto/l77lacompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_l78.pdf": "Tira Parada L78",
    "assets/imagenes/l78_laborables/l78l123_124.jpg": "L-123/L-124",
    "assets/imagenes/l78_laborables/l78l125_126.jpg": "L-125/L-126",
    "assets/imagenes/l78_laborables/l78l127_128.jpg": "L-127/L-128",
    "assets/imagenes/l78_laborables/l78l129_130.jpg": "L-129/L-130",
    "assets/imagenes/l78_laborables/l78l131_132.jpg": "L-131/L-132",
    "assets/imagenes/l78_laborables/l78l133_134.jpg": "L-133/L-134",
    "assets/imagenes/l78_laborables/l78lcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l78_sabados/l78s73_74.jpg": "S-73/S-74",
    "assets/imagenes/l78_sabados/l78s75_76.jpg": "S-75/S-76",
    "assets/imagenes/l78_sabados/l78s77_78.jpg": "S-77/S-78",
    "assets/imagenes/l78_sabados/l78s79_80.jpg": "S-79/S-80",
    "assets/imagenes/l78_sabados/l78scompleto.jpg": "Cuadro Completo",
    "assets/imagenes/l78_domingos/l78d57_58.jpg": "D-57/D-58",
    "assets/imagenes/l78_domingos/l78d59_60.jpg": "D-59/D-60",
    "assets/imagenes/l78_domingos/l78d61_62.jpg": "D-61/D-62",
    "assets/imagenes/l78_domingos/l78d63_64.jpg": "D-63/D-64",
    "assets/imagenes/l78_domingos/l78dcompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_m75.pdf": "Tira Parada M75",
    "assets/imagenes/m75_laborables/m75l289_290.jpg": "L-289/L-290",
    "assets/imagenes/m75_laborables/m75l291_292.jpg": "L-291/L-292",
    "assets/imagenes/m75_laborables/m75l293_294.jpg": "L-293/L-294",
    "assets/imagenes/m75_laborables/m75l295_296.jpg": "L-295/L-296",
    "assets/imagenes/m75_laborables/m75l297_298.jpg": "L-297/L-298",
    "assets/imagenes/m75_laborables/m75lcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/m75_sabados/m75s81_82.jpg": "S-81/S-82",
    "assets/imagenes/m75_sabados/m75s83_84.jpg": "S-83/S-84",
    "assets/imagenes/m75_sabados/m75scompleto.jpg": "Cuadro Completo",
    "assets/imagenes/m75_domingos/m75d65_66.jpg": "D-65/D-66",
    "assets/imagenes/m75_domingos/m75d67_68.jpg": "D-67/D-68",
    "assets/imagenes/m75_domingos/m75dcompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_sb1.pdf": "Tira Parada SB1",
    "assets/imagenes/sb1_laborables/sb1l213_214.jpg": "L-213/L-214",
    "assets/imagenes/sb1_laborables/sb1l215_216.jpg": "L-215/L-216",
    "assets/imagenes/sb1_laborables/sb1l217_218.jpg": "L-217/L-218",
    "assets/imagenes/sb1_laborables/sb1l219_220.jpg": "L-219/L-220",
    "assets/imagenes/sb1_laborables/sb1l221_222.jpg": "L-221/L-222",
    "assets/imagenes/sb1_laborables/sb1l223_224.jpg": "L-223/L-224",
    "assets/imagenes/sb1_laborables/sb1l225_226.jpg": "L-225/L-226",
    "assets/imagenes/sb1_laborables/sb1l227_228.jpg": "L-227/L-228",
    "assets/imagenes/sb1_laborables/sb1l229_230.jpg": "L-229/L-230",
    "assets/imagenes/sb1_laborables/sb1l231_232.jpg": "L-231/L-232",
    "assets/imagenes/sb1_laborables/sb1lcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/sb1_sabados/sb1s167_168.jpg": "S-167/S-168",
    "assets/imagenes/sb1_sabados/sb1s169_170.jpg": "S-169/S-170",
    "assets/imagenes/sb1_sabados/sb1s171_172.jpg": "S-171/S-172",
    "assets/imagenes/sb1_sabados/sb1s173_174.jpg": "S-173/S-174",
    "assets/imagenes/sb1_sabados/sb1s175_176.jpg": "S-175/S-176",
    "assets/imagenes/sb1_sabados/sb1s177_178.jpg": "S-177/S-178",
    "assets/imagenes/sb1_sabados/sb1scompleto.jpg": "Cuadro Completo",
    "assets/imagenes/sb1_domingos/sb1d147_148.jpg": "D-147/D-148",
    "assets/imagenes/sb1_domingos/sb1d149_150.jpg": "D-149/D-150",
    "assets/imagenes/sb1_domingos/sb1d151_152.jpg": "D-151/D-152",
    "assets/imagenes/sb1_domingos/sb1d153_154.jpg": "D-153/D-154",
    "assets/imagenes/sb1_domingos/sb1d155_156.jpg": "D-155/D-156",
    "assets/imagenes/sb1_domingos/sb1dcompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_sb2.pdf": "Tira Parada SB2",
    "assets/imagenes/sb2_laborables/sb2l161_162.jpg": "L-161/L-162",
    "assets/imagenes/sb2_laborables/sb2lsdcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/sb2_sabados/sb2sd95_96.jpg": "S-95/S-96\nD-75/D-76",
    "assets/imagenes/sb2_sabados/sb2lsdcompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_sb3.pdf": "Tira Parada SB3",
    "assets/imagenes/sb3_laborables/sb3l211_212.jpg": "L-211/L-212",
    "assets/imagenes/sb3_laborables/sb3lsdcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/sb3_sabados/sb3sd129_130.jpg": "S-129/S-130\nD-109/D-110",
    "assets/imagenes/sb3_sabados/sb3lsdcompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_x43.pdf": "Tira Parada X43",
    "assets/imagenes/x43_laborables/x43l01_02.jpg": "L-01/L-02",
    "assets/imagenes/x43_laborables/x43l03_04.jpg": "L-03/L-04",
    "assets/imagenes/x43_laborables/x43l05_06.jpg": "L-05/L-06",
    "assets/imagenes/x43_laborables/x43l07_08.jpg": "L-07/L-08",
    "assets/imagenes/x43_laborables/x43l09_10.jpg": "L-09/L-10",
    "assets/imagenes/x43_laborables/x43l383.jpg": "L-383",
    "assets/imagenes/x43_laborables/x43lcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/x43_sabados/x43s01_02.jpg": "S-01/S-02",
    "assets/imagenes/x43_sabados/x43s03_04.jpg": "S-03/S-04",
    "assets/imagenes/x43_sabados/x43scompleto.jpg": "Cuadro Completo",
    "assets/pdfs/tira_parada_x79.pdf": "Tira Parada X79",
    "assets/imagenes/x79_laborables/x79l315_316.jpg": "L-315/L-316",
    "assets/imagenes/x79_laborables/x79l317_318.jpg": "L-317/L-318",
    "assets/imagenes/x79_laborables/x79l319_320.jpg": "L-319/L-320",
    "assets/imagenes/x79_laborables/x79l321_322.jpg": "L-321/L-322",
    "assets/imagenes/x79_laborables/x79l323_324.jpg": "L-323/L-324",
    "assets/imagenes/x79_laborables/x79l325_326.jpg": "L-325/L-326",
    "assets/imagenes/x79_laborables/x79l327_328.jpg": "L-327/L-328",
    "assets/imagenes/x79_laborables/x79l329_330.jpg": "L-329/L-330",
    "assets/imagenes/x79_laborables/x79l331_332.jpg": "L-331/L-332",
    "assets/imagenes/x79_laborables/x79l333_334.jpg": "L-333/L-334",
    "assets/imagenes/x79_laborables/x79l335_336.jpg": "L-335/L-336",
    "assets/imagenes/x79_laborables/x79l337_338.jpg": "L-337/L-338",
    "assets/imagenes/x79_laborables/x79l339_340.jpg": "L-339/L-340",
    "assets/imagenes/x79_laborables/x79l341_342.jpg": "L-341/L-342",
    "assets/imagenes/x79_laborables/x79l343_344.jpg": "L-343/L-344",
    "assets/imagenes/x79_laborables/x79lcompleto.jpg": "Cuadro Completo",
    "assets/imagenes/x79_sabados/x79s05_06.jpg": "S-05/S-06",
    "assets/imagenes/x79_sabados/x79s123_124.jpg": "S-123/S-124",
    "assets/imagenes/x79_sabados/x79s125_126.jpg": "S-125/S-126",
    "assets/imagenes/x79_sabados/x79s11_12.jpg": "S-11/S-12",
    "assets/imagenes/x79_sabados/x79s13_14.jpg": "S-13/S-14",
    "assets/imagenes/x79_sabados/x79s15_16.jpg": "S-15/S-16",
    "assets/imagenes/x79_sabados/x79scompleto.jpg": "Cuadro Completo",
    "assets/imagenes/x79_domingos/x79d103_104.jpg": "D-103/D-104",
    "assets/imagenes/x79_domingos/x79d105_106.jpg": "D-105/D-106",
    "assets/imagenes/x79_domingos/x79d05_06.jpg": "D-05/D-06",
    "assets/imagenes/x79_domingos/x79d07_08.jpg": "D-07/D-08",
    "assets/imagenes/x79_domingos/x79dcompleto.jpg": "Cuadro Completo",
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
          color: const Color.fromARGB(255, 233, 120, 28), // línea naranja
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1️⃣ Pantalla principal con fondo degradado
    if (pantalla == null && subpantalla == null) {
      return Scaffold(
        appBar: _buildAppBar("Turnos"),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Color.fromARGB(40, 233, 120, 28), // naranja muy suave
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: pantallasPrincipales.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return _iconoPantalla(context, pantallasPrincipales[index]);
              },
            ),
          ),
        ),
      );
    }

    // 2️⃣ Subpantallas (sin fondo degradado)
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

    // 3️⃣ Contenido final o imágenes (sin fondo degradado)
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

              // ✔ SOLO para L-77 los items serán más altos
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
                      maxLines: 3, // Permite las 3 líneas
                      overflow: TextOverflow.visible, // O remove esta línea
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

  // ---------------- Métodos auxiliares ----------------
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
                : Center(
                    child: InteractiveViewer(
                      panEnabled: true,
                      minScale: 0.5,
                      maxScale: 4,
                      child: Image.asset(ruta),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
