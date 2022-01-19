drop database `tweets`;
CREATE SCHEMA IF NOT EXISTS `tweets` ;
USE `tweets` ;
-- -----------------------------------------------------
-- Table `tweets`.`Sentimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tweets`.`Sentimientos` (
  `idSentimientos` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idSentimientos`))
ENGINE = MyISAM;
-- -----------------------------------------------------
-- Table `tweets`.`Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tweets`.`Modulo` (
  `idModulo` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL,
  `latitud` DOUBLE NULL,
  `longitud` DOUBLE NULL,
  PRIMARY KEY (`idModulo`))
ENGINE = MyISAM;
-- -----------------------------------------------------
-- Table `tweets`.`Tweets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tweets`.`Tweets` (
  `idTweets` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idTwitter` BIGINT UNSIGNED NOT NULL,
  `texto` VARCHAR(600) NULL,
  `fecha` DATE NULL,
  `Sentimientos_idSentimientos` TINYINT UNSIGNED NOT NULL,
  `Modulo_idModulo` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idTweets`),
  INDEX `fk_Tweets_Sentimientos_idx` (`Sentimientos_idSentimientos` ASC) VISIBLE,
  INDEX `fk_Tweets_Modulo1_idx` (`Modulo_idModulo` ASC) VISIBLE,
  UNIQUE INDEX `idTwitter_UNIQUE` (`idTwitter` ASC) VISIBLE)
ENGINE = MyISAM;

-- Registros correspondientes a los sentimientos
insert into `Sentimientos` values(null, "Positivo");
insert into `Sentimientos` values(null, "Neutro");
insert into `Sentimientos` values(null, "Negativo");

-- Modulos bajados del csv de la pagina
insert into Modulo values(null,'Escuela Superior de Educación Física',19.40792513,-99.10046371);
insert into Modulo values(null,'Palacio de los Deportes',19.40289458,-99.09764077);
insert into Modulo values(null,'Bosque de Tláhuac',19.28774575,-99.05204404);
insert into Modulo values(null,'Nuevo Hospital General del ISSSTE',19.27989101,-99.05044155);
insert into Modulo values(null,'Escuela Nacional Preparatoria No. 1 Gabino Barreda UNAM',19.27212039,-99.1213183);
insert into Modulo values(null,'Centro Deportivo Xochimilco',19.25450336,-99.10843636);
insert into Modulo values(null,'SITIO DE CUAUTLA',19.3551,-99.2871);
insert into Modulo values(null,'XOCHIQUETZAL',19.3699,-99.291);
insert into Modulo values(null,'CALMECAC',19.3701,-99.2846);
insert into Modulo values(null,'INVESTIGACION EDUCATIVA',19.3705,-99.2803);
insert into Modulo values(null,'CARLOS MARIA BUSTAMANTE',19.3726,-99.2883);
insert into Modulo values(null,'DR CONRADO MENENDEZ MENA',19.3825,-99.2553);
insert into Modulo values(null,'ESCUELA PRIMARIA MANUAL ACUÑA',19.37025179,-99.28532605);
insert into Modulo values(null,'JOSE RAMÓN MANTEROLA',19.35666692,-99.29822089);
insert into Modulo values(null,'BENITO JUAREZ',19.3285,-99.3306);
insert into Modulo values(null,'ESCUELA SECUNDARIA JOSÉ ANTONIO CARRILLO FLORES N°289',19.34821817,-99.31733734);
insert into Modulo values(null,'JOSE LUIS VIEYRA GONZALEZ',19.3533,-99.296);
insert into Modulo values(null,'KALPILLI',19.3604,-99.297);
insert into Modulo values(null,'MAESTRO JUSTO SIERRA',19.308,-99.3351);
insert into Modulo values(null,'MAESTROS DE MEXICO',19.3425,-99.2824);
insert into Modulo values(null,'VICENTE GUERRERO',19.3429,-99.2804);
insert into Modulo values(null,'NIQOS HEROES',19.3447,-99.3125);
insert into Modulo values(null,'ANTONIO CASTRO LEAL',19.3473,-99.2996);
insert into Modulo values(null,'ESCUELA SECUNDARIA TECNICA 48',19.37564499,-99.28731364);
insert into Modulo values(null,'Acopilco',19.333439,-99.326466);
insert into Modulo values(null,'Cuajimalpa',19.356861,-99.297495);
insert into Modulo values(null,'UMF-UMAA 42 Cuajimalpa',19.3645,-99.2933);
insert into Modulo values(null,'IEMS Plantel Josefa Ortiz de Domínguez',19.361908,-99.285902);
insert into Modulo values(null,'La Navidad',19.3751,-99.2834);
insert into Modulo values(null,'RUBEN DARIO',19.3164,-99.242);
insert into Modulo values(null,'JOSÉ MARÍA VELASCO',19.317,-99.2395);
insert into Modulo values(null,'JOSE GUADALUPE POSADA',19.3203,-99.2404);
insert into Modulo values(null,'PROFRA MA ADELINA FLORES MORALES',19.3251,-99.2496);
insert into Modulo values(null,'LIDICE',19.326,-99.2247);
insert into Modulo values(null,'JOSEFA ORTIZ DE DOMINGUEZ',19.3292,-99.2124);
insert into Modulo values(null,'PROCERES DE LA REVOLUCION',19.3345,-99.2098);
insert into Modulo values(null,'DR EDUARDO LICEAGA',19.3021,-99.2704);
insert into Modulo values(null,'ARQUIMEDES CABALLERO CABALLERO',19.3049,-99.2664);
insert into Modulo values(null,'PROFRA LEONOR LEAQOS NAVARRO',19.3093,-99.2651);
insert into Modulo values(null,'ALFONSO REYES',19.3134,-99.2567);
insert into Modulo values(null,'ENRIQUE RODRIGUEZ CANO',19.2979,-99.2451);
insert into Modulo values(null,'FRANCISCO NICODEMO',19.3052,-99.2381);
insert into Modulo values(null,'MARTÍN LUIS GUZMÁN',19.3009,-99.2573);
insert into Modulo values(null,'ALFREDO E URUCHURTU',19.3064,-99.2477);
insert into Modulo values(null,'JUVENTINO ROSAS',19.3067,-99.2335);
insert into Modulo values(null,'CORONEL NICOLAS ROMERO',19.3067,-99.2499);
insert into Modulo values(null,'LUIS DONALDO COLOSIO MURRIETA',19.3073,-99.2363);
insert into Modulo values(null,'CARLOS DE SIGUENZA Y GONGORA',19.3107,-99.2452);
insert into Modulo values(null,'PROFR RAFAEL HERNANDEZ LOPEZ',19.3122,-99.2546);
insert into Modulo values(null,'ESCUELA PRIMARIA HEROES DE PADIERNA',19.3153,-99.2264);
insert into Modulo values(null,'ITZJAK RABIN',19.3153,-99.249);
insert into Modulo values(null,'DR NABOR CARRILLO FLORES',19.317,-99.2492);
insert into Modulo values(null,'MAESTRO RAFAEL RAMIREZ',19.3179,-99.2291);
insert into Modulo values(null,'REPUBLICA DEL PERU',19.3207,-99.2238);
insert into Modulo values(null,'ESCUELA PRIMARIA XICOTENCATL',19.3132,-99.256);
insert into Modulo values(null,'C.S.T-I SAN NICOLÁS TOTOLAPAN',19.2983,-99.2434);
insert into Modulo values(null,'ESCUELA PRIMARIA PROFR. SIMITRIO RAMIREZ HERNANDEZ',19.3118,-99.2605);
insert into Modulo values(null,'UMF 140 La Teja',19.3042,-99.2485);
insert into Modulo values(null,'ESCUELA PRIMARIA ALFREDO E. URUCHURTU',19.3053,-99.241);
insert into Modulo values(null,'ESCUELA PRIMARIA MAESTROS MEXICANOS',19.3098,-99.2304);
insert into Modulo values(null,'ESCUELA PRIMARIA CUAUHTEMOC',19.3199,-99.2445);
insert into Modulo values(null,'UMF 22 Independecia',19.331,-99.2179);
insert into Modulo values(null,'ESCUELA PRIMARIA AGUSTIN LEGORRETA',19.2187876,-98.99539754);
insert into Modulo values(null,'SIERRA LEONA',19.193,-99.0073);
insert into Modulo values(null,'PRIMARIA PROGRESO CAMPESINO',19.17517536,-99.03423322);
insert into Modulo values(null,'CULTURA AZTECA',19.1879,-99.0216);
insert into Modulo values(null,'JARDIN DE NIÑOS CALNAHUATL',19.19043944,-99.02852908);
insert into Modulo values(null,'ESCUELA SECUNDARIA TECNICA 18',19.1832,-99.0712);
insert into Modulo values(null,'ESCUELA PRIMARIA PINTOR DIEGO RIVERA',19.19250365,-99.08954299);
insert into Modulo values(null,'ESCUELA PRIMARIA BENITO JUAREZ',19.20587658,-99.06915025);
insert into Modulo values(null,'San Salvador Cuauhtenco',19.191734,-99.091828);
insert into Modulo values(null,'San Pablo Oztotepec',19.1874,-99.0731);
insert into Modulo values(null,'Dr. Luis  Erosa León',19.2031,-99.0466);
insert into Modulo values(null,'Escuela Secundaria N°37 EMILIANO ZAPATA',19.188537,-99.024266);
insert into Modulo values(null,'Dr. Gastón Melo',19.22038,-98.99553);
insert into Modulo values(null,'Santa Ana Tlacotenco',19.17293,-98.99455);
insert into Modulo values(null,'Benemérita Escuela Nacional de Maestros',19.4468619868141,-99.1683351833857);
insert into Modulo values(null,'Campo Marte',19.4247637086059,-99.1972820177831);
insert into Modulo values(null,'Arena Ciudad de México',19.4978651129392,-99.1751012455615);
insert into Modulo values(null,'UAM Azcapotzalco',19.5040001259723,-99.1869685452568);
insert into Modulo values(null,'Antiguas instalaciones de la Primera Región Militar (colonia Aviación Civil)',19.4191443530711,-99.0762714602185);
insert into Modulo values(null,'Internado No. 17 de ña Secretaría de Educación Pública Francisco I. Madero',19.4435484358356,-99.1160660602181);
insert into Modulo values(null,'Centro de Estudios Superiores en Ciencias de la Salud (CENCIS-Marina)',19.3198028600395,-99.1171925663255);
insert into Modulo values(null,'Centro de Exposiciones de Ciudad Universitaria',19.31002726,-99.1769417);
insert into Modulo values(null,'Universidad Autónoma Metropolitana (UAM) Xochimilco',19.30435633,-99.10160295);
insert into Modulo values(null,'Escuela Nacional Preparatoria N° 5 "José Vasconcelos" UNAM',19.30794538,-99.13416566);
insert into Modulo values(null,'Plantel Otilio Montaño - Tlalpan 2 (Topilejo) del Instituto de Educación Media Superior de la Ciudad de México',19.20238464,-99.14930168);
insert into Modulo values(null,'Six Flags México',19.2958487,-99.21062957);
insert into Modulo values(null,'Universidad La Salle',19.40888893,-99.18086442);
insert into Modulo values(null,'Biblioteca Vasconcelos',19.44750555,-99.15065602);
insert into Modulo values(null,'Escuela Primaria Benito Juárez',19.40972598,-99.15915906);
insert into Modulo values(null,'Estadio Olímpico Universitario',19.33254018,-99.19119064);
insert into Modulo values(null,'Deportivo Plateros',19.36881565,-99.19495267);
insert into Modulo values(null,'Expo Santa Fe México',19.36336805,-99.26237597);
insert into Modulo values(null,'Universidad de la Policía de la CDMX (Acceso 1)',19.33704746,-99.24956968);
insert into Modulo values(null,'Pepsi Center / World Trade Center',19.39504623,-99.17429988);
insert into Modulo values(null,'Alberca Olímpica Francisco Márquez',19.35885138,-99.15370345);
insert into Modulo values(null,'Centro Universitario México',19.38972135,-99.16078623);
insert into Modulo values(null,'Deportivo Hermanos Galeana',19.4734245,-99.07499645);
insert into Modulo values(null,'Ciudad Deportiva Carmen Serdán',19.55311662,-99.14603505);
insert into Modulo values(null,'Escuela Nacional Preparatoria N° 9 "Pedro de Alba" UNAM',19.4838658,-99.12771386);
insert into Modulo values(null,'ENCB - Escuela Nacional de Ciencias Biológicas Unidad Zacatenco - IPN',19.49880124,-99.14571374);
insert into Modulo values(null,'Centro Cultural Jaime Torres Bodet / Zacatenco',19.49630693,-99.13511517);
insert into Modulo values(null,'Escuela Secundaria Diurna N° 85 "República de Francia"',19.45090853,-99.08128156);
insert into Modulo values(null,'Sede de Servicios de Transportes Electricos',19.36809263,-99.13280974);
insert into Modulo values(null,'Universidad Autónoma Metropolitana Unidad Iztapalapa',19.36201476539,-99.070944611888);
insert into Modulo values(null,'Deportivo Santa Cruz Meyehualco (Calle 71 esquina Av. 6)',19.36681146,-99.0594455);
insert into Modulo values(null,'Facultad de Estudios Superiores Zaragoza UNAM Campus I',19.38484447,-99.03634386);
insert into Modulo values(null,'Deportivo Santa Cruz Meyehualco / Campo Baseball',19.34977041,-99.04808653);
insert into Modulo values(null,'Centro de Estudios Científicos y Tecnológicos N° 7 "Cuauhtémoc" IPN / (Vocacional 7)',19.3450887,-99.02618418);
insert into Modulo values(null,'Unidad Habitacional Militar El Vergel',19.31396069,-99.08006432);
insert into Modulo values(null,'Palacio de los Deportes (Pabellones)',19.40575925,-99.09822871);
insert into Modulo values(null,'Deportivo Milpa Alta',19.2000606283582,-99.026650535165);
