SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE activitecompl (
  id int(11) NOT NULL,
  ac_num int(11) NOT NULL,
  ac_date datetime DEFAULT NULL,
  ac_lieu varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  ac_theme varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  ac_motif varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE activitecompl_praticien (
  activitecompl_id int(11) NOT NULL,
  praticien_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE composant (
  id int(11) NOT NULL,
  cmp_code varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  cmp_libelle varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE constitution (
  id int(11) NOT NULL,
  quantit int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO constitution (id, quantit) VALUES
(1, 0);

CREATE TABLE constitution_composant (
  constitution_id int(11) NOT NULL,
  composant_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE doctrine_migration_versions (
  version varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  executed_at datetime DEFAULT NULL,
  execution_time int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO doctrine_migration_versions (`version`, executed_at, execution_time) VALUES
('DoctrineMigrations\\Version20210322120320', '2021-03-22 13:32:12', 2721),
('DoctrineMigrations\\Version20210322141256', '2021-03-22 14:13:05', 74),
('DoctrineMigrations\\Version20210322143326', '2021-03-22 14:33:34', 59);

CREATE TABLE dosage (
  id int(11) NOT NULL,
  dos_code varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  dos_quantite varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  dos_unite varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE famille (
  id int(11) NOT NULL,
  fam_code varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  fam_libelle varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO famille (id, fam_code, fam_libelle) VALUES
(1, 'AA', 'Antalgiques en association'),
(2, 'AAA', 'Antalgiques antipyr??tiques en association'),
(3, 'AAC', 'Antid??presseur d\'action centrale'),
(4, 'AAH', 'Antivertigineux antihistaminique H1'),
(5, 'ABA', 'Antibiotique antituberculeux'),
(6, 'ABC', 'Antibiotique antiacn??ique local'),
(7, 'ABP', 'Antibiotique de la famille des b??ta-lactamines (p??nicilline A)'),
(8, 'AFC', 'Antibiotique de la famille des cyclines'),
(9, 'AFM', 'Antibiotique de la famille des macrolides'),
(10, 'AH', 'Antihistaminique H1 local'),
(11, 'AIM', 'Antid??presseur imipraminique (tricyclique)'),
(12, 'AIN', 'Antid??presseur inhibiteur s??lectif de la recapture de la s??rotonine'),
(13, 'ALO', 'Antibiotique local (ORL)'),
(14, 'ANS', 'Antid??presseur IMAO non s??lectif'),
(15, 'AO', 'Antibiotique ophtalmique'),
(16, 'AP', 'Antipsychotique normothymique'),
(17, 'AUM', 'Antibiotique urinaire minute'),
(18, 'CRT', 'Cortico??de, antibiotique et antifongique ??  usage local'),
(19, 'HYP', 'Hypnotique antihistaminique'),
(20, 'PSA', 'Psychostimulant, antiasth??nique');

CREATE TABLE labo (
  id int(11) NOT NULL,
  lab_code varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  lab_nom varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  lab_chefvente varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE medicament (
  id int(11) NOT NULL,
  famille_id int(11) DEFAULT NULL,
  constitution_id int(11) NOT NULL,
  med_depotlegal varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  med_nomcommercial varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  med_composition varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  med_contreindic varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  med_prixechantillon double DEFAULT NULL,
  med_effets varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO medicament (id, famille_id, constitution_id, med_depotlegal, med_nomcommercial, med_composition, med_contreindic, med_prixechantillon, med_effets) VALUES
(57, 18, 1, '3MYC7', 'TRIMYCINE', 'Triamcinolone (ac??tonide) + N??omycine + Nystatine', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie ??  l\'un des constituants, d\'infections de la peau ou de parasitisme non trait??s, d\'acn??. Ne pas appliquer sur une plaie, ni sous un pansement occlusif.', NULL, 'Ce m??dicament est un cortico??de ??  activit?? forte ou tr??s forte associ?? ??  un antibiotique et un antifongique, utilis?? en application locale dans certaines atteintes cutan??es surinfect??es.'),
(58, 7, 1, 'ADIMOL9', 'ADIMOL', 'Amoxicilline + Acide clavulanique', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie aux p??nicillines ou aux c??phalosporines.', NULL, 'Ce m??dicament, plus puissant que les p??nicillines simples, est utilis?? pour traiter des infections bact??riennes sp??cifiques.'),
(59, 7, 1, 'AMOPIL7', 'AMOPIL', 'Amoxicilline', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie aux p??nicillines. Il doit ??tre administr?? avec prudence en cas d\'allergie aux c??phalosporines.', NULL, 'Ce m??dicament, plus puissant que les p??nicillines simples, est utilis?? pour traiter des infections bact??riennes sp??cifiques.'),
(60, 7, 1, 'AMOX45', 'AMOXAR', 'Amoxicilline', 'La prise de ce m??dicament peut rendre positifs les tests de d??pistage du dopage.', NULL, 'Ce m??dicament, plus puissant que les p??nicillines simples, est utilis?? pour traiter des infections bact??riennes sp??cifiques.'),
(61, 7, 1, 'AMOXIG12', 'AMOXI G??', 'Amoxicilline', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie aux p??nicillines. Il doit ??tre administr?? avec prudence en cas d\'allergie aux c??phalosporines.', NULL, 'Ce m??dicament, plus puissant que les p??nicillines simples, est utilis?? pour traiter des infections bact??riennes sp??cifiques.'),
(62, 13, 1, 'APATOUX22', 'APATOUX Vitamine C', 'Tyrothricine + T??traca??ne + Acide ascorbique (Vitamine C)', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie ??  l\'un des constituants, en cas de ph??nylc??tonurie et chez l\'enfant de moins de 6 ans.', NULL, 'Ce m??dicament est utilis?? pour traiter les affections de la bouche et de la gorge.'),
(63, 6, 1, 'BACTIG10', 'BACTIGEL', 'Erythromycine', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie aux antibiotiques de la famille des macrolides ou des lincosanides.', NULL, 'Ce m??dicament est utilis?? en application locale pour traiter l\'acn?? et les infections cutan??es bact??riennes associ??es.'),
(64, 9, 1, 'BACTIV13', 'BACTIVIL', 'Erythromycine', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie aux macrolides (dont le chef de file est l\'??rythromycine).', NULL, 'Ce m??dicament est utilis?? pour traiter des infections bact??riennes sp??cifiques.'),
(65, 2, 1, 'BITALV', 'BIVALIC', 'Dextropropoxyph??ne + Parac??tamol', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie aux m??dicaments de cette famille, d\'insuffisance h??patique ou d\'insuffisance r??nale.', NULL, 'Ce m??dicament est utilis?? pour traiter les douleurs d\'intensit?? mod??r??e ou intense.'),
(66, 2, 1, 'CARTION6', 'CARTION', 'Acide ac??tylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Parac??tamol', 'Ce m??dicament est contre-indiqu?? en cas de troubles de la coagulation (tendances aux h??morragies), d\'ulc??re gastroduod??nal, maladies graves du foie.', NULL, 'Ce m??dicament est utilis?? dans le traitement symptomatique de la douleur ou de la fi??vre.'),
(67, 9, 1, 'CLAZER6', 'CLAZER', 'Clarithromycine', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie aux macrolides (dont le chef de file est l\'??rythromycine).', NULL, 'Ce m??dicament est utilis?? pour traiter des infections bact??riennes sp??cifiques. Il est ??galement utilis?? dans le traitement de l\'ulc??re gastro-duod??nal, en association avec d\'autres m??dicaments.'),
(68, 11, 1, 'DEPRIL9', 'DEPRAMIL', 'Clomipramine', 'Ce m??dicament est contre-indiqu?? en cas de glaucome ou d\'ad??nome de la prostate, d\'infarctus r??cent, ou si vous avez re????u un traitement par IMAO durant les 2 semaines pr??c??dentes ou en cas d\'allergie aux antid??presseurs imipraminiques.', NULL, 'Ce m??dicament est utilis?? pour traiter les ??pisodes d??pressifs s??v??res, certaines douleurs rebelles, les troubles obsessionnels compulsifs et certaines ??nur??sies chez l\'enfant.'),
(69, 3, 1, 'DIMIRTAM6', 'DIMIRTAM', 'Mirtazapine', 'La prise de ce produit est contre-indiqu??e en cas de d\'allergie ??  l\'un des constituants.', NULL, 'Ce m??dicament est utilis?? pour traiter les ??pisodes d??pressifs s??v??res.'),
(70, 2, 1, 'DOLRIL7', 'DOLORIL', 'Acide ac??tylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Parac??tamol', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie au parac??tamol ou aux salicylates.', NULL, 'Ce m??dicament est utilis?? dans le traitement symptomatique de la douleur ou de la fi??vre.'),
(71, 19, 1, 'DORNOM8', 'NORMADOR', 'Doxylamine', 'Ce m??dicament est contre-indiqu?? en cas de glaucome, de certains troubles urinaires (r??tention urinaire) et chez l\'enfant de moins de 15 ans.', NULL, 'Ce m??dicament est utilis?? pour traiter l\'insomnie chez l\'adulte.'),
(72, 4, 1, 'EQUILARX6', 'EQUILAR', 'M??clozine', 'Ce m??dicament ne doit pas ??tre utilis?? en cas d\'allergie au produit, en cas de glaucome ou de r??tention urinaire.', NULL, 'Ce m??dicament est utilis?? pour traiter les vertiges et pour pr??venir le mal des transports.'),
(73, 20, 1, 'EVILR7', 'EVEILLOR', 'Adrafinil', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie ??  l\'un des constituants.', NULL, 'Ce m??dicament est utilis?? pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet ag??.'),
(74, 10, 1, 'INSXT5', 'INSECTIL', 'Diph??nydramine', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie aux antihistaminiques.', NULL, 'Ce m??dicament est utilis?? en application locale sur les piq??res d\'insecte et l\'urticaire.'),
(75, 9, 1, 'JOVAI8', 'JOVENIL', 'Josamycine', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie aux macrolides (dont le chef de file est l\'??rythromycine).', NULL, 'Ce m??dicament est utilis?? pour traiter des infections bact??riennes sp??cifiques.'),
(76, 8, 1, 'LIDOXY23', 'LIDOXYTRACINE', 'Oxyt??tracycline +Lidoca??ne', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie ??  l\'un des constituants. Il ne doit pas ??tre associ?? aux r??tino??des.', NULL, 'Ce m??dicament est utilis?? en injection intramusculaire pour traiter certaines infections sp??cifiques.'),
(77, 16, 1, 'LITHOR12', 'LITHORINE', 'Lithium', 'Ce m??dicament ne doit pas ??tre utilis?? si vous ??tes allergique au lithium. Avant de prendre ce traitement, signalez ??  votre m??decin traitant si vous souffrez d\'insuffisance r??nale, ou si vous avez un r??gime sans sel.', NULL, 'Ce m??dicament est indiqu?? dans la pr??vention des psychoses maniaco-d??pressives ou pour traiter les ??tats maniaques.'),
(78, 1, 1, 'PARMOL16', 'PARMOCODEINE', 'Cod??ine + Parac??tamol', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie ??  l\'un des constituants, chez l\'enfant de moins de 15 Kg, en cas d\'insuffisance h??patique ou respiratoire, d\'asthme, de ph??nylc??tonurie et chez la femme qui allaite.', NULL, 'Ce m??dicament est utilis?? pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.'),
(79, 20, 1, 'PHYSOI8', 'PHYSICOR', 'Sulbutiamine', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie ??  l\'un des constituants.', NULL, 'Ce m??dicament est utilis?? pour traiter les baisses d\'activit?? physique ou psychique, souvent dans un contexte de d??pression.'),
(80, 5, 1, 'PIRIZ8', 'PIRIZAN', 'Pyrazinamide', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie ??  l\'un des constituants, d\'insuffisance r??nale ou h??patique, d\'hyperuric??mie ou de porphyrie.', NULL, 'Ce m??dicament est utilis??, en association ??  d\'autres antibiotiques, pour traiter la tuberculose.'),
(81, 15, 1, 'POMDI20', 'POMADINE', 'Bacitracine', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie aux antibiotiques appliqu??s localement.', NULL, 'Ce m??dicament est utilis?? pour traiter les infections oculaires de la surface de l\'oeil.'),
(82, 12, 1, 'TROXT21', 'TROXADET', 'Parox??tine', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie au produit.', NULL, 'Ce m??dicament est utilis?? pour traiter la d??pression et les troubles obsessionnels compulsifs. Il peut ??galement ??tre utilis?? en pr??vention des crises de panique avec ou sans agoraphobie.'),
(83, 13, 1, 'TXISOL22', 'TOUXISOL Vitamine C', 'Tyrothricine + Acide ascorbique (Vitamine C)', 'Ce m??dicament est contre-indiqu?? en cas d\'allergie ??  l\'un des constituants et chez l\'enfant de moins de 6 ans.', NULL, 'Ce m??dicament est utilis?? pour traiter les affections de la bouche et de la gorge.'),
(84, 17, 1, 'URIEG6', 'URIREGUL', 'Fosfomycine trom??tamol', 'La prise de ce m??dicament est contre-indiqu??e en cas d\'allergie ??  l\'un des constituants et d\'insuffisance r??nale.', NULL, 'Ce m??dicament est utilis?? pour traiter les infections urinaires simples chez la femme de moins de 65 ans.');

CREATE TABLE medicament_composant (
  medicament_id int(11) NOT NULL,
  composant_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE medicament_medicament (
  medicament_source int(11) NOT NULL,
  medicament_target int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE medicament_presentation (
  medicament_id int(11) NOT NULL,
  presentation_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE offre (
  id int(11) NOT NULL,
  rapport_id int(11) NOT NULL,
  quantite int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO offre (id, rapport_id, quantite) VALUES
(3, 2, 3),
(4, 2, 12);

CREATE TABLE offre_medicament (
  offre_id int(11) NOT NULL,
  medicament_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO offre_medicament (offre_id, medicament_id) VALUES
(3, 57),
(4, 60);

CREATE TABLE posseder (
  id int(11) NOT NULL,
  specialite_id int(11) DEFAULT NULL,
  diplome varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  coeff_prescription double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE praticien (
  id int(11) NOT NULL,
  type_id int(11) NOT NULL,
  displomes_id int(11) DEFAULT NULL,
  pra_num int(11) NOT NULL,
  pra_nom varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  pra_adresse varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  pra_cp varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  pra_ville varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  pra_coefnotoriete double DEFAULT NULL,
  pra_prenom varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO praticien (id, type_id, displomes_id, pra_num, pra_nom, pra_adresse, pra_cp, pra_ville, pra_coefnotoriete, pra_prenom) VALUES
(1, 1, NULL, 1, 'Notini', '114 r Authie', '85000', 'LA ROCHE SUR YON', 290.03, 'Alain'),
(2, 2, NULL, 2, 'Gosselin', '13 r Devon', '41000', 'BLOIS', 307.49, 'Albert'),
(3, 5, NULL, 3, 'Delahaye', '36 av 6 Juin', '25000', 'BESANCON', 185.79, 'Andr??'),
(4, 3, NULL, 4, 'Leroux', '47 av Robert Schuman', '60000', 'BEAUVAIS', 172.04, 'Andr??'),
(5, 4, NULL, 5, 'Desmoulins', '31 r St Jean', '30000', 'NIMES', 94.75, 'Anne'),
(6, 1, NULL, 6, 'Mouel', '27 r Auvergne', '80000', 'AMIENS', 45.2, 'Anne'),
(7, 2, NULL, 7, 'Desgranges-Lentz', '1 r Albert de Mun', '29000', 'MORLAIX', 20.07, 'Antoine'),
(8, 5, NULL, 8, 'Marcouiller', '31 r St Jean', '68000', 'MULHOUSE', 396.52, 'Arnaud'),
(9, 3, NULL, 9, 'Dupuy', '9 r Demolombe', '34000', 'MONTPELLIER', 395.66, 'Benoit'),
(10, 4, NULL, 10, 'Lerat', '31 r St Jean', '59000', 'LILLE', 257.79, 'Bernard'),
(11, 1, NULL, 11, 'Mar??ais-Lefebvre', '86Bis r Basse', '67000', 'STRASBOURG', 450.96, 'Bertrand'),
(12, 2, NULL, 12, 'Boscher', '94 r Falaise', '10000', 'TROYES', 356.14, 'Bruno'),
(13, 5, NULL, 13, 'Morel', '21 r Chateaubriand', '75000', 'PARIS', 379.57, 'Catherine'),
(14, 3, NULL, 14, 'Guivarch', '4 av G??n Laperrine', '45000', 'ORLEANS', 114.56, 'Chantal'),
(15, 4, NULL, 15, 'Bessin-Grosdoit', '92 r Falaise', '6000', 'NICE', 222.06, 'Christo3e'),
(16, 1, NULL, 16, 'Rossa', '14 av Thi??s', '6000', 'NICE', 529.78, 'Claire'),
(17, 2, NULL, 17, 'Cauchy', '5 av Ste Th??r??se', '11000', 'NARBONNE', 458.82, 'Denis'),
(18, 5, NULL, 18, 'Gaff??', '9 av 1??re Arm??e Fran??aise', '35000', 'RENNES', 213.4, 'Dominique'),
(19, 3, NULL, 19, 'Guenon', '98 bd Mar Lyautey', '44000', 'NANTES', 175.89, 'Dominique'),
(20, 4, NULL, 20, 'Pr??vot', '29 r Lucien Nelle', '87000', 'LIMOGES', 151.36, 'Dominique'),
(21, 1, NULL, 21, 'Houchard', '9 r Demolombe', '49100', 'ANGERS', 436.96, 'Eliane'),
(22, 2, NULL, 22, 'Desmons', '51 r Berni??res', '29000', 'QUIMPER', 281.17, 'Elisabeth'),
(23, 5, NULL, 23, 'Flament', '11 r Pasteur', '35000', 'RENNES', 315.6, 'Elisabeth'),
(24, 3, NULL, 24, 'Goussard', '9 r Demolombe', '41000', 'BLOIS', 40.72, 'Emmanuel'),
(25, 4, NULL, 25, 'Desprez', '9 r Vaucelles', '33000', 'BORDEAUX', 406.85, 'Eric'),
(26, 1, NULL, 26, 'Coste', '29 r Lucien Nelle', '19000', 'TULLE', 441.87, 'Evelyne'),
(27, 2, NULL, 27, 'Lefebvre', '2 pl Wurzburg', '55000', 'VERDUN', 573.63, 'Fr??d??ric'),
(28, 5, NULL, 28, 'Lem??e', '29 av 6 Juin', '56000', 'VANNES', 326.4, 'Fr??d??ric'),
(29, 3, NULL, 29, 'Martin', 'B??t A 90 r Bayeux', '70000', 'VESOUL', 506.06, 'Fr??d??ric'),
(30, 4, NULL, 30, 'Marie', '172 r Ca4ni??re', '70000', 'VESOUL', 313.31, 'Fr??d??rique'),
(31, 1, NULL, 31, 'Rosenstech', '27 r Auvergne', '75000', 'PARIS', 366.82, 'Genevi??ve'),
(32, 2, NULL, 32, '4ntavice', '8 r Gaillon', '86000', '4ITIERS', 265.58, 'Ghislaine'),
(33, 5, NULL, 33, 'Leveneur-Mosquet', '47 av Robert Schuman', '64000', 'PAU', 184.97, 'Guillaume'),
(34, 3, NULL, 34, 'Blanchais', '30 r Authie', '8000', 'SEDAN', 502.48, 'Guy'),
(35, 4, NULL, 35, 'Leveneur', '7 pl St Gilles', '62000', 'ARRAS', 7.39, 'Hugues'),
(36, 1, NULL, 36, 'Mosquet', '22 r Jules Verne', '76000', 'ROUEN', 77.1, 'Isabelle'),
(37, 2, NULL, 37, 'Giraudon', '1 r Albert de Mun', '38100', 'VIENNE', 92.62, 'Jean-Christo3e'),
(38, 5, NULL, 38, 'Marie', '26 r H??rouville', '69000', 'LYON', 120.1, 'Jean-Claude'),
(39, 3, NULL, 39, 'Maury', '5 r Pierre Girard', '71000', 'CHALON SUR SAONE', 13.73, 'Jean-Fran??ois'),
(40, 4, NULL, 40, 'Dennel', '7 pl St Gilles', '28000', 'CHARTRES', 550.69, 'Jean-Louis'),
(41, 1, NULL, 41, 'Ain', '4 r??sid Olympia', '2000', 'LAON', 5.59, 'Jean-Pierre'),
(42, 2, NULL, 42, 'Chemery', '51 pl Ancienne Boucherie', '14000', 'CAEN', 396.58, 'Jean-Pierre'),
(43, 5, NULL, 43, 'Comoz', '35 r Auguste Lechesne', '18000', 'BOURGES', 340.35, 'Jean-Pierre'),
(44, 3, NULL, 44, 'Desfaudais', '7 pl St Gilles', '29000', 'BREST', 71.76, 'Jean-Pierre'),
(45, 4, NULL, 45, '3an', '9 r Clos Caillet', '79000', 'NIORT', 451.61, 'J??r????me'),
(46, 1, NULL, 46, 'Riou', '43 bd G??n Vanier', '77000', 'MARNE LA VALLEE', 193.25, 'Line'),
(47, 2, NULL, 47, 'Chubilleau', '46 r Eglise', '17000', 'SAINTES', 202.07, 'Louis'),
(48, 5, NULL, 48, 'Lebrun', '178 r Auge', '54000', 'NANCY', 410.41, 'Lucette'),
(49, 3, NULL, 49, 'Goessens', '6 av 6 Juin', '39000', 'DOLE', 548.57, 'Marc'),
(50, 4, NULL, 50, 'Laforge', '5 r??sid Prairie', '50000', 'SAINT LO', 265.05, 'Marc'),
(51, 1, NULL, 51, 'Millereau', '36 av 6 Juin', '72000', 'LA FERTE BERNARD', 430.42, 'Marc'),
(52, 2, NULL, 52, 'Dauverne', '69 av Charlemagne', '21000', 'DIJON', 281.05, 'Marie-Christine'),
(53, 5, NULL, 53, 'Vittorio', '3 pl Champlain', '94000', 'BOISSY SAINT LEGER', 356.23, 'Myriam'),
(54, 3, NULL, 54, 'Lapasset', '31 av 6 Juin', '52000', 'CHAUMONT', 107, 'Nhieu'),
(55, 4, NULL, 55, 'Plantet-Besnier', '10 av 1??re Arm??e Fran??aise', '86000', 'CHATELLEREAULT', 369.94, 'Nicole'),
(56, 1, NULL, 56, 'Chubilleau', '3 r Hastings', '15000', 'AURRILLAC', 290.75, 'Pascal'),
(57, 2, NULL, 57, 'Robert', '31 r St Jean', '93000', 'BOBIGNY', 162.41, 'Pascal'),
(58, 5, NULL, 58, 'Jean', '114 r Authie', '49100', 'SAUMUR', 375.52, 'Pascale'),
(59, 3, NULL, 59, 'Chanteloube', '14 av Thi??s', '13000', 'MARSEILLE', 478.01, 'Patrice'),
(60, 4, NULL, 60, 'Lecuirot', 'r??sid St P??res 55 r Pigaci??re', '54000', 'NANCY', 239.66, 'Patrice'),
(61, 1, NULL, 61, 'Gandon', '47 av Robert Schuman', '37000', 'TOURS', 599.06, 'Patrick'),
(62, 2, NULL, 62, 'Mirouf', '22 r Puits Picard', '74000', 'ANNECY', 458.42, 'Patrick'),
(63, 5, NULL, 63, 'Boireaux', '14 av Thi??s', '10000', 'CHALON EN CHAMPAGNE', 454.48, '3ilippe'),
(64, 3, NULL, 64, 'Cendrier', '7 pl St Gilles', '12000', 'RODEZ', 164.16, '3ilippe'),
(65, 4, NULL, 65, 'Duhamel', '114 r Authie', '34000', 'MONTPELLIER', 98.62, '3ilippe'),
(66, 1, NULL, 66, 'Grigy', '15 r M??lingue', '44000', 'CLISSON', 285.1, '3ilippe'),
(67, 2, NULL, 67, 'Linard', '1 r Albert de Mun', '81000', 'ALBI', 486.3, '3ilippe'),
(68, 5, NULL, 68, 'Lozier', '8 r Gaillon', '31000', 'TOULOUSE', 48.4, '3ilippe'),
(69, 3, NULL, 69, 'Dech??tre', '63 av Thi??s', '23000', 'MONTLUCON', 253.75, 'Pierre'),
(70, 4, NULL, 70, 'Goessens', '22 r Jean Romain', '40000', 'MONT DE MARSAN', 426.19, 'Pierre'),
(71, 1, NULL, 71, 'Lem??nager', '39 av 6 Juin', '57000', 'METZ', 118.7, 'Pierre'),
(72, 2, NULL, 72, 'N??e', '39 av 6 Juin', '82000', 'MONTAUBAN', 72.54, 'Pierre'),
(73, 5, NULL, 73, 'Guyot', '43 bd G??n Vanier', '48000', 'MENDE', 352.31, 'Pierre-Laurent'),
(74, 3, NULL, 74, 'Chauchard', '9 r Vaucelles', '13000', 'MARSEILLE', 552.19, 'Roger'),
(75, 4, NULL, 75, 'Mabire', '11 r Boutiques', '67000', 'STRASBOURG', 422.39, 'Roland'),
(76, 1, NULL, 76, 'Leroy', '45 r Boutiques', '61000', 'ALENCON', 570.67, 'Soazig'),
(77, 2, NULL, 77, 'Guyot', '26 r H??rouville', '46000', 'FIGEAC', 28.85, 'St??3ane'),
(78, 5, NULL, 78, 'Del4sen', '39 av 6 Juin', '27000', 'DREUX', 292.01, 'Sylvain'),
(79, 3, NULL, 79, 'Rault', '15 bd Richemond', '2000', 'SOISSON', 526.6, 'Sylvie'),
(80, 4, NULL, 80, 'Renouf', '98 bd Mar Lyautey', '88000', 'EPINAL', 425.24, 'Sylvie'),
(81, 1, NULL, 81, 'Alliet-Grach', '14 av Thi??s', '7000', 'PRIVAS', 451.31, 'Thierry'),
(82, 2, NULL, 82, 'Bayard', '92 r Falaise', '42000', 'SAINT ETIENNE', 271.71, 'Thierry'),
(83, 5, NULL, 83, 'Gauchet', '7 r Desmoueux', '38100', 'GRENOBLE', 406.1, 'Thierry'),
(84, 3, NULL, 84, 'Bobichon', '219 r Ca4ni??re', '9000', 'FOIX', 218.36, 'Tristan'),
(85, 4, NULL, 85, 'Duchemin-Laniel', '130 r St Jean', '33000', 'LIBOURNE', 265.61, 'V??ronique'),
(86, 1, NULL, 86, 'Laurent', '34 r Demolombe', '53000', 'MAYENNE', 496.1, 'Youn??s');

CREATE TABLE prescription (
  id int(11) NOT NULL,
  medicaments_id int(11) DEFAULT NULL,
  type_individu_id int(11) DEFAULT NULL,
  dosage_id int(11) DEFAULT NULL,
  posologie varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE presentation (
  id int(11) NOT NULL,
  pre_code varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  pre_libelle varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE rapport_visite (
  id int(11) NOT NULL,
  visiteur_id int(11) DEFAULT NULL,
  praticien_id int(11) NOT NULL,
  rap_num int(11) NOT NULL,
  rap_date datetime DEFAULT NULL,
  rap_bilan varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  rap_motif varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO rapport_visite (id, visiteur_id, praticien_id, rap_num, rap_date, rap_bilan, rap_motif) VALUES
(1, 1, 23, 3, '2002-04-18 00:00:00', 'M??decin curieux, ?? recontacer en d??cembre pour r??union', 'Actualisation annuelle'),
(2, 2, 4, 4, '2003-05-21 00:00:00', 'Changement de direction, red??finition de la politique m??dicamenteuse, recours au g??n??rique', 'Baisse activit??'),
(3, 1, 41, 7, '2003-03-23 00:00:00', 'RAS\r\nChangement de tel : 05 89 89 89 89', 'Rapport Annuel');

CREATE TABLE region (
  id int(11) NOT NULL,
  secteur_id int(11) NOT NULL,
  reg_code varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  reg_nom varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO region (id, secteur_id, reg_code, reg_nom) VALUES
(1, 1, 'AL', 'Alsace Lorraine'),
(2, 5, 'AQ', 'Aquitaine'),
(3, 4, 'AU', 'Auvergne'),
(4, 3, 'BG', 'Bretagne'),
(5, 3, 'BN', 'Basse Normandie'),
(6, 1, 'BO', 'Bourgogne'),
(7, 2, 'CA', 'Champagne Ardennes'),
(8, 4, 'CE', 'Centre'),
(9, 1, 'FC', 'Franche Comt??'),
(10, 2, 'HN', 'Haute Normandie'),
(11, 4, 'IF', 'Ile de France'),
(12, 5, 'LG', 'Languedoc'),
(13, 4, 'LI', 'Limousin'),
(14, 5, 'MP', 'Midi Pyr??n??e'),
(15, 2, 'NP', 'Nord Pas de Calais'),
(16, 5, 'PA', 'Provence Alpes Cote d\'Azur'),
(17, 3, 'PC', 'Poitou Charente'),
(18, 2, 'PI', 'Picardie'),
(19, 3, 'PL', 'Pays de Loire'),
(20, 1, 'RA', 'Rhone Alpes'),
(21, 5, 'RO', 'Roussilon'),
(22, 3, 'VD', 'Vend??e');

CREATE TABLE secteur (
  id int(11) NOT NULL,
  sec_code varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  sec_libelle varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO secteur (id, sec_code, sec_libelle) VALUES
(1, 'E', 'Est'),
(2, 'N', 'Nord'),
(3, 'O', 'Ouest'),
(4, 'P', 'Paris centre'),
(5, 'S', 'Sud');

CREATE TABLE specialite (
  id int(11) NOT NULL,
  spe_code varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  spe_libelle varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO specialite (id, spe_code, spe_libelle) VALUES
(1, 'ACP', 'anatomie et cytologie pathologiques'),
(2, 'AMV', 'ang??iologie, m??decine vasculaire'),
(3, 'ARC', 'anesth??siologie et r??animation chirurgicale'),
(4, 'BM', 'biologie m??dicale'),
(5, 'CAC', 'cardiologie et affections cardio-vasculaires'),
(6, 'CCT', 'chirurgie cardio-vasculaire et thoracique'),
(7, 'CG', 'chirurgie g??n??rale'),
(8, 'CMF', 'chirurgie maxillo-faciale'),
(9, 'COM', 'canc??rologie, oncologie m??dicale'),
(10, 'COT', 'chirurgie orthop??dique et traumatologie'),
(11, 'CPR', 'chirurgie plastique reconstructrice et esth??tique'),
(12, 'CU', 'chirurgie urologique'),
(13, 'CV', 'chirurgie vasculaire'),
(14, 'DN', 'diab??tologie-nutrition, nutrition'),
(15, 'DV', 'dermatologie et v??n??r??ologie'),
(16, 'EM', 'endocrinologie et m??tabolismes'),
(17, 'ETD', '??valuation et traitement de la douleur'),
(18, 'GEH', 'gastro-ent??rologie et h??patologie (appareil digestif)'),
(19, 'GMO', 'gyn??cologie m??dicale, obst??trique'),
(20, 'GO', 'gyn??cologie-obst??trique'),
(21, 'HEM', 'maladies du sang (h??matologie)'),
(22, 'MBS', 'm??decine et biologie du sport'),
(23, 'MDT', 'm??decine du travail'),
(24, 'MMO', 'm??decine manuelle - ost??opathie'),
(25, 'MN', 'm??decine nucl??aire'),
(26, 'MPR', 'm??decine physique et de r??adaptation'),
(27, 'MTR', 'm??decine tropicale, pathologie infectieuse et tropicale'),
(28, 'NEP', 'n??phrologie'),
(29, 'NRC', 'neurochirurgie'),
(30, 'NRL', 'neurologie'),
(31, 'ODM', 'orthop??die dento maxillo-faciale'),
(32, 'OPH', 'ophtalmologie'),
(33, 'ORL', 'oto-rhino-laryngologie'),
(34, 'PEA', 'psychiatrie de l\'enfant et de l\'adolescent'),
(35, 'PME', 'p??diatrie maladies des enfants'),
(36, 'PNM', 'pneumologie'),
(37, 'PSC', 'psychiatrie'),
(38, 'RAD', 'radiologie (radiodiagnostic et imagerie m??dicale)'),
(39, 'RDT', 'radioth??rapie (oncologie option radioth??rapie)'),
(40, 'RGM', 'reproduction et gyn??cologie m??dicale'),
(41, 'RHU', 'rhumatologie'),
(42, 'STO', 'stomatologie'),
(43, 'SXL', 'sexologie'),
(44, 'TXA', 'toxicomanie et alcoologie');

CREATE TABLE type_individu (
  id int(11) NOT NULL,
  tin_code varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  tin_libelle varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE type_praticien (
  id int(11) NOT NULL,
  typ_code varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  typ_libelle varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  typ_lieu varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO type_praticien (id, typ_code, typ_libelle, typ_lieu) VALUES
(1, 'MH', 'M??decin Hospitalier', 'Hopital ou clinique'),
(2, 'MV', 'M??decine de Ville', 'Cabinet'),
(3, 'PH', 'Pharmacien Hospitalier', 'Hopital ou clinique'),
(4, 'PO', 'Pharmacien Officine', 'Pharmacie'),
(5, 'PS', 'Personnel de sant??', 'Centre param??dical');

CREATE TABLE visiteur (
  id int(11) NOT NULL,
  secteur_id int(11) DEFAULT NULL,
  departement_id int(11) DEFAULT NULL,
  vis_matricule varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  vis_nom varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  vis_prenom varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  vis_adresse varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  vis_cp varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  vis_dateembauche datetime DEFAULT NULL,
  vis_ville varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO visiteur (id, secteur_id, departement_id, vis_matricule, vis_nom, vis_prenom, vis_adresse, vis_cp, vis_dateembauche, vis_ville) VALUES
(1, NULL, NULL, 'a131', 'Villechalane', 'Louis', '8 cours Lafontaine', '29000', '1992-12-11 00:00:00', 'BREST'),
(2, NULL, NULL, 'a17', 'Andre', 'David', '1 r 11on de Chiss??e', '38100', '1991-08-26 00:00:00', 'GRENOBLE'),
(3, NULL, NULL, 'a55', 'Bedos', 'Christian', '1 r B??n??dictins', '65000', '1987-07-17 00:00:00', 'TARBES'),
(4, NULL, NULL, 'a93', 'Tusseau', 'Louis', '22 r Renou', '86000', '1999-01-02 00:00:00', 'POITIERS'),
(5, NULL, NULL, 'b13', 'Bentot', 'Pascal', '11 av 6 Juin', '67000', '1996-03-11 00:00:00', 'STRASBOURG'),
(6, NULL, NULL, 'b16', 'Bioret', 'Luc', '1 r Linne', '35000', '1997-03-21 00:00:00', 'RENNES'),
(7, NULL, NULL, 'b19', 'Bunisset', 'Francis', '10 r Nicolas Chorier', '85000', '1999-01-31 00:00:00', 'LA ROCHE SUR YON'),
(8, NULL, NULL, 'b25', 'Bunisset', 'Denise', '1 r Lionne', '49100', '1994-07-03 00:00:00', 'ANGERS'),
(9, NULL, NULL, 'b28', 'Cacheux', 'Bernard', '114 r Authie', '34000', '2000-08-02 00:00:00', 'MONTPELLIER'),
(10, NULL, NULL, 'b34', 'Cadic', 'Eric', '123 r Caponi??re', '41000', '1993-12-06 00:00:00', 'BLOIS'),
(11, NULL, NULL, 'b4', 'Charoze', 'Catherine', '100 pl G??ants', '33000', '1997-09-25 00:00:00', 'BORDEAUX'),
(12, NULL, NULL, 'b50', 'Clepkens', 'Christophe', '12 r F??d??rico Garcia Lorca', '13000', '1998-01-18 00:00:00', 'MARSEILLE'),
(13, NULL, NULL, 'b59', 'Cottin', 'Vincenne', '36 sq Capucins', '5000', '1995-10-21 00:00:00', 'GAP'),
(14, NULL, NULL, 'c14', 'Daburon', 'Fran??ois', '13 r Champs Elys??es', '6000', '1989-02-01 00:00:00', 'NICE'),
(15, NULL, NULL, 'c3', 'De', 'Philippe', '13 r Charles Peguy', '10000', '1992-05-05 00:00:00', 'TROYES'),
(16, NULL, NULL, 'c54', 'Debelle', 'Michel', '181 r Caponi??re', '88000', '1991-04-09 00:00:00', 'EPINAL'),
(17, NULL, NULL, 'd13', 'Debelle', 'Jeanne', '134 r Stalingrad', '44000', '1991-12-05 00:00:00', 'NANTES'),
(18, NULL, NULL, 'd51', 'Debroise', 'Michel', '2 av 6 Juin', '70000', '1997-11-18 00:00:00', 'VESOUL'),
(19, NULL, NULL, 'e22', 'Desmarquest', 'Nathalie', '14 r F??d??rico Garcia Lorca', '54000', '1989-03-24 00:00:00', 'NANCY'),
(20, NULL, NULL, 'e24', 'Desnost', 'Pierre', '16 r Barral de Montferrat', '55000', '1993-05-17 00:00:00', 'VERDUN'),
(21, NULL, NULL, 'e39', 'Dudouit', 'Fr??d??ric', '18 quai Xavier Jouvin', '75000', '1988-04-26 00:00:00', 'PARIS'),
(22, NULL, NULL, 'e49', 'Duncombe', 'Claude', '19 av Alsace Lorraine', '9000', '1996-02-19 00:00:00', 'FOIX'),
(23, NULL, NULL, 'e5', 'Enault-Pascreau', 'C??line', '25B r Stalingrad', '40000', '1990-11-27 00:00:00', 'MONT DE MARSAN'),
(24, NULL, NULL, 'e52', 'Eynde', 'Val??rie', '3 r Henri Moissan', '76000', '1991-10-31 00:00:00', 'ROUEN'),
(25, NULL, NULL, 'f21', 'Finck', 'Jacques', 'rte Montreuil Bellay', '74000', '1993-06-08 00:00:00', 'ANNECY'),
(26, NULL, NULL, 'f39', 'Fr??mont', 'Fernande', '4 r Jean Giono', '69000', '1997-02-15 00:00:00', 'LYON'),
(27, NULL, NULL, 'f4', 'Gest', 'Alain', '30 r Authie', '46000', '1994-05-03 00:00:00', 'FIGEAC'),
(28, NULL, NULL, 'g19', 'Gheysen', 'Galassus', '32 bd Mar Foch', '75000', '1996-01-18 00:00:00', 'PARIS'),
(29, NULL, NULL, 'g30', 'Girard', 'Yvon', '31 av 6 Juin', '80000', '1999-03-27 00:00:00', 'AMIENS'),
(30, NULL, NULL, 'g53', 'Gombert', 'Luc', '32 r Emile Gueymard', '56000', '1985-10-02 00:00:00', 'VANNES'),
(31, NULL, NULL, 'g7', 'Guindon', 'Caroline', '40 r Mar Montgomery', '87000', '1996-01-13 00:00:00', 'LIMOGES'),
(32, NULL, NULL, 'h13', 'Guindon', 'Fran??ois', '44 r Picoti??re', '19000', '1993-05-08 00:00:00', 'TULLE'),
(33, NULL, NULL, 'h30', 'Igigabel', 'Guy', '33 gal Arlequin', '94000', '1998-04-26 00:00:00', 'CRETEIL'),
(34, NULL, NULL, 'h35', 'Jourdren', 'Pierre', '34 av Jean Perrot', '15000', '1993-08-26 00:00:00', 'AURRILLAC'),
(35, NULL, NULL, 'h40', 'Juttard', 'Pierre-Raoul', '34 cours Jean Jaur??s', '8000', '1992-11-01 00:00:00', 'SEDAN'),
(36, NULL, NULL, 'j45', 'Labour??-Morel', 'Saout', '38 cours Berriat', '52000', '1998-02-25 00:00:00', 'CHAUMONT'),
(37, NULL, NULL, 'j50', 'Landr??', 'Philippe', '4 av G??n Laperrine', '59000', '1992-12-16 00:00:00', 'LILLE'),
(38, NULL, NULL, 'j8', 'Langeard', 'Hugues', '39 av Jean Perrot', '93000', '1998-06-18 00:00:00', 'BAGNOLET'),
(39, NULL, NULL, 'k4', 'Lanne', 'Bernard', '4 r Bayeux', '30000', '1996-11-21 00:00:00', 'NIMES'),
(40, NULL, NULL, 'k53', 'Le', 'No??l', '4 av Beauvert', '68000', '1983-03-23 00:00:00', 'MULHOUSE'),
(41, NULL, NULL, 'l14', 'Le', 'Jean', '39 r Raspail', '53000', '1995-02-02 00:00:00', 'LAVAL'),
(42, NULL, NULL, 'l23', 'Leclercq', 'Servane', '11 r Quinconce', '18000', '1995-06-05 00:00:00', 'BOURGES'),
(43, NULL, NULL, 'l46', 'Lecornu', 'Jean-Bernard', '4 bd Mar Foch', '72000', '1997-01-24 00:00:00', 'LA FERTE BERNARD'),
(44, NULL, NULL, 'l56', 'Lecornu', 'Ludovic', '4 r Abel Servien', '25000', '1996-02-27 00:00:00', 'BESANCON'),
(45, NULL, NULL, 'm35', 'Lejard', 'Agn??s', '4 r Anthoard', '82000', '1987-10-06 00:00:00', 'MONTAUBAN'),
(46, NULL, NULL, 'm45', 'Lesaulnier', 'Pascal', '47 r Thiers', '57000', '1990-10-13 00:00:00', 'METZ'),
(47, NULL, NULL, 'n42', 'Letessier', 'St??phane', '5 chem Capuche', '27000', '1996-03-06 00:00:00', 'EVREUX'),
(48, NULL, NULL, 'n58', 'Loirat', 'Didier', 'Les P??chers cit?? Bourg la Croix', '45000', '1992-08-30 00:00:00', 'ORLEANS'),
(49, NULL, NULL, 'n59', 'Maffezzoli', 'Thibaud', '5 r Chateaubriand', '2000', '1994-12-19 00:00:00', 'LAON'),
(50, NULL, NULL, 'o26', 'Mancini', 'Anne', '5 r D\'Agier', '48000', '1995-01-05 00:00:00', 'MENDE'),
(51, NULL, NULL, 'p32', 'Marcouiller', 'G??rard', '7 pl St Gilles', '91000', '1992-12-24 00:00:00', 'ISSY LES MOULINEAUX'),
(52, NULL, NULL, 'p40', 'Michel', 'Jean-Claude', '5 r Gabriel P??ri', '61000', '1992-12-14 00:00:00', 'FLERS'),
(53, NULL, NULL, 'p41', 'Montecot', 'Fran??oise', '6 r Paul Val??ry', '17000', '1998-07-27 00:00:00', 'SAINTES'),
(54, NULL, NULL, 'p42', 'Notini', 'Veronique', '5 r Lieut Chabal', '60000', '1994-12-12 00:00:00', 'BEAUVAIS'),
(55, NULL, NULL, 'p49', 'Onfroy', 'Den', '5 r Sidonie Jacolin', '37000', '1977-10-03 00:00:00', 'TOURS'),
(56, NULL, NULL, 'p6', 'Pascreau', 'Charles', '57 bd Mar Foch', '64000', '1997-03-30 00:00:00', 'PAU'),
(57, NULL, NULL, 'p7', 'Pernot', 'Claude-No??l', '6 r Alexandre 1 de Yougoslavie', '11000', '1990-03-01 00:00:00', 'NARBONNE'),
(58, NULL, NULL, 'p8', 'Perrier', 'Ma??tre', '6 r Aubert Dubayet', '71000', '1991-06-23 00:00:00', 'CHALON SUR SAONE'),
(59, NULL, NULL, 'q17', 'Petit', 'Jean-Louis', '7 r Ernest Renan', '50000', '1997-09-06 00:00:00', 'SAINT LO'),
(60, NULL, NULL, 'r24', 'Piquery', 'Patrick', '9 r Vaucelles', '14000', '1984-07-29 00:00:00', 'CAEN'),
(61, NULL, NULL, 'r58', 'Quiquandon', 'Jo??l', '7 r Ernest Renan', '29000', '1990-06-30 00:00:00', 'QUIMPER'),
(62, NULL, NULL, 's10', 'Retailleau', 'Josselin', '88Bis r Saumuroise', '39000', '1995-11-14 00:00:00', 'DOLE'),
(63, NULL, NULL, 's21', 'Retailleau', 'Pascal', '32 bd Ayrault', '23000', '1992-09-25 00:00:00', 'MONTLUCON'),
(64, NULL, NULL, 't43', 'Souron', 'Maryse', '7B r Gay Lussac', '21000', '1995-03-09 00:00:00', 'DIJON'),
(65, NULL, NULL, 't47', 'Tiphagne', 'Patrick', '7B r Gay Lussac', '62000', '1997-08-29 00:00:00', 'ARRAS'),
(66, NULL, NULL, 't55', 'Tr??het', 'Alain', '7D chem Barral', '12000', '1994-11-29 00:00:00', 'RODEZ'),
(67, NULL, NULL, 't60', 'Tusseau', 'Josselin', '63 r Bon Repos', '28000', '1991-03-29 00:00:00', 'CHARTRES'),
(68, NULL, NULL, 'zzz', 'swiss', 'bourdin', NULL, NULL, '2003-06-18 00:00:00', NULL);

CREATE TABLE visiteur_activitecompl (
  visiteur_id int(11) NOT NULL,
  activitecompl_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE activitecompl
  ADD PRIMARY KEY (id);

ALTER TABLE activitecompl_praticien
  ADD PRIMARY KEY (activitecompl_id,praticien_id),
  ADD KEY IDX_CB7AA288DD1ECA17 (activitecompl_id),
  ADD KEY IDX_CB7AA2882391866B (praticien_id);

ALTER TABLE composant
  ADD PRIMARY KEY (id);

ALTER TABLE constitution
  ADD PRIMARY KEY (id);

ALTER TABLE constitution_composant
  ADD PRIMARY KEY (constitution_id,composant_id),
  ADD KEY IDX_9F94306FBDA9478A (constitution_id),
  ADD KEY IDX_9F94306F7F3310E7 (composant_id);

ALTER TABLE doctrine_migration_versions
  ADD PRIMARY KEY (version);

ALTER TABLE dosage
  ADD PRIMARY KEY (id);

ALTER TABLE famille
  ADD PRIMARY KEY (id);

ALTER TABLE labo
  ADD PRIMARY KEY (id);

ALTER TABLE medicament
  ADD PRIMARY KEY (id),
  ADD KEY IDX_9A9C723A97A77B84 (famille_id),
  ADD KEY IDX_9A9C723ABDA9478A (constitution_id);

ALTER TABLE medicament_composant
  ADD PRIMARY KEY (medicament_id,composant_id),
  ADD KEY IDX_330B56BAAB0D61F7 (medicament_id),
  ADD KEY IDX_330B56BA7F3310E7 (composant_id);

ALTER TABLE medicament_medicament
  ADD PRIMARY KEY (medicament_source,medicament_target),
  ADD KEY IDX_534FDD6C2A4B05F7 (medicament_source),
  ADD KEY IDX_534FDD6C33AE5578 (medicament_target);

ALTER TABLE medicament_presentation
  ADD PRIMARY KEY (medicament_id,presentation_id),
  ADD KEY IDX_31EE65EBAB0D61F7 (medicament_id),
  ADD KEY IDX_31EE65EBAB627E8B (presentation_id);

ALTER TABLE offre
  ADD PRIMARY KEY (id),
  ADD KEY IDX_AF86866F1DFBCC46 (rapport_id);

ALTER TABLE offre_medicament
  ADD PRIMARY KEY (offre_id,medicament_id),
  ADD KEY IDX_B7C2151F4CC8505A (offre_id),
  ADD KEY IDX_B7C2151FAB0D61F7 (medicament_id);

ALTER TABLE posseder
  ADD PRIMARY KEY (id),
  ADD KEY IDX_62EF7CBA2195E0F0 (specialite_id);

ALTER TABLE praticien
  ADD PRIMARY KEY (id),
  ADD KEY IDX_D9A27D3C54C8C93 (type_id),
  ADD KEY IDX_D9A27D3694DBAFA (displomes_id);

ALTER TABLE prescription
  ADD PRIMARY KEY (id),
  ADD KEY IDX_1FBFB8D9C403D7FB (medicaments_id),
  ADD KEY IDX_1FBFB8D9312B7B9 (type_individu_id),
  ADD KEY IDX_1FBFB8D94E8FD016 (dosage_id);

ALTER TABLE presentation
  ADD PRIMARY KEY (id);

ALTER TABLE rapport_visite
  ADD PRIMARY KEY (id),
  ADD KEY IDX_1A9679F97F72333D (visiteur_id),
  ADD KEY IDX_1A9679F92391866B (praticien_id);

ALTER TABLE region
  ADD PRIMARY KEY (id),
  ADD KEY IDX_F62F1769F7E4405 (secteur_id);

ALTER TABLE secteur
  ADD PRIMARY KEY (id);

ALTER TABLE specialite
  ADD PRIMARY KEY (id);

ALTER TABLE type_individu
  ADD PRIMARY KEY (id);

ALTER TABLE type_praticien
  ADD PRIMARY KEY (id);

ALTER TABLE visiteur
  ADD PRIMARY KEY (id),
  ADD KEY IDX_4EA587B89F7E4405 (secteur_id),
  ADD KEY IDX_4EA587B8CCF9E01E (departement_id);

ALTER TABLE visiteur_activitecompl
  ADD PRIMARY KEY (visiteur_id,activitecompl_id),
  ADD KEY IDX_77EA5FAA7F72333D (visiteur_id),
  ADD KEY IDX_77EA5FAADD1ECA17 (activitecompl_id);


ALTER TABLE activitecompl
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE composant
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE constitution
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE dosage
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE famille
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE labo
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE medicament
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

ALTER TABLE offre
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE posseder
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE praticien
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

ALTER TABLE prescription
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE presentation
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE rapport_visite
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE region
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

ALTER TABLE secteur
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE specialite
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

ALTER TABLE type_individu
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE type_praticien
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE visiteur
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;


ALTER TABLE activitecompl_praticien
  ADD CONSTRAINT FK_CB7AA2882391866B FOREIGN KEY (praticien_id) REFERENCES praticien (id) ON DELETE CASCADE,
  ADD CONSTRAINT FK_CB7AA288DD1ECA17 FOREIGN KEY (activitecompl_id) REFERENCES activitecompl (id) ON DELETE CASCADE;

ALTER TABLE constitution_composant
  ADD CONSTRAINT FK_9F94306F7F3310E7 FOREIGN KEY (composant_id) REFERENCES composant (id) ON DELETE CASCADE,
  ADD CONSTRAINT FK_9F94306FBDA9478A FOREIGN KEY (constitution_id) REFERENCES constitution (id) ON DELETE CASCADE;

ALTER TABLE medicament
  ADD CONSTRAINT FK_9A9C723A97A77B84 FOREIGN KEY (famille_id) REFERENCES famille (id),
  ADD CONSTRAINT FK_9A9C723ABDA9478A FOREIGN KEY (constitution_id) REFERENCES constitution (id);

ALTER TABLE medicament_composant
  ADD CONSTRAINT FK_330B56BA7F3310E7 FOREIGN KEY (composant_id) REFERENCES composant (id) ON DELETE CASCADE,
  ADD CONSTRAINT FK_330B56BAAB0D61F7 FOREIGN KEY (medicament_id) REFERENCES medicament (id) ON DELETE CASCADE;

ALTER TABLE medicament_medicament
  ADD CONSTRAINT FK_534FDD6C2A4B05F7 FOREIGN KEY (medicament_source) REFERENCES medicament (id) ON DELETE CASCADE,
  ADD CONSTRAINT FK_534FDD6C33AE5578 FOREIGN KEY (medicament_target) REFERENCES medicament (id) ON DELETE CASCADE;

ALTER TABLE medicament_presentation
  ADD CONSTRAINT FK_31EE65EBAB0D61F7 FOREIGN KEY (medicament_id) REFERENCES medicament (id) ON DELETE CASCADE,
  ADD CONSTRAINT FK_31EE65EBAB627E8B FOREIGN KEY (presentation_id) REFERENCES presentation (id) ON DELETE CASCADE;

ALTER TABLE offre
  ADD CONSTRAINT FK_AF86866F1DFBCC46 FOREIGN KEY (rapport_id) REFERENCES rapport_visite (id);

ALTER TABLE offre_medicament
  ADD CONSTRAINT FK_B7C2151F4CC8505A FOREIGN KEY (offre_id) REFERENCES offre (id) ON DELETE CASCADE,
  ADD CONSTRAINT FK_B7C2151FAB0D61F7 FOREIGN KEY (medicament_id) REFERENCES medicament (id) ON DELETE CASCADE;

ALTER TABLE posseder
  ADD CONSTRAINT FK_62EF7CBA2195E0F0 FOREIGN KEY (specialite_id) REFERENCES specialite (id);

ALTER TABLE praticien
  ADD CONSTRAINT FK_D9A27D3694DBAFA FOREIGN KEY (displomes_id) REFERENCES posseder (id),
  ADD CONSTRAINT FK_D9A27D3C54C8C93 FOREIGN KEY (type_id) REFERENCES type_praticien (id);

ALTER TABLE prescription
  ADD CONSTRAINT FK_1FBFB8D9312B7B9 FOREIGN KEY (type_individu_id) REFERENCES type_individu (id),
  ADD CONSTRAINT FK_1FBFB8D94E8FD016 FOREIGN KEY (dosage_id) REFERENCES dosage (id),
  ADD CONSTRAINT FK_1FBFB8D9C403D7FB FOREIGN KEY (medicaments_id) REFERENCES medicament (id);

ALTER TABLE rapport_visite
  ADD CONSTRAINT FK_1A9679F92391866B FOREIGN KEY (praticien_id) REFERENCES praticien (id),
  ADD CONSTRAINT FK_1A9679F97F72333D FOREIGN KEY (visiteur_id) REFERENCES visiteur (id);

ALTER TABLE region
  ADD CONSTRAINT FK_F62F1769F7E4405 FOREIGN KEY (secteur_id) REFERENCES secteur (id);

ALTER TABLE visiteur
  ADD CONSTRAINT FK_4EA587B89F7E4405 FOREIGN KEY (secteur_id) REFERENCES secteur (id),
  ADD CONSTRAINT FK_4EA587B8CCF9E01E FOREIGN KEY (departement_id) REFERENCES labo (id);

ALTER TABLE visiteur_activitecompl
  ADD CONSTRAINT FK_77EA5FAA7F72333D FOREIGN KEY (visiteur_id) REFERENCES visiteur (id) ON DELETE CASCADE,
  ADD CONSTRAINT FK_77EA5FAADD1ECA17 FOREIGN KEY (activitecompl_id) REFERENCES activitecompl (id) ON DELETE CASCADE;
COMMIT;
