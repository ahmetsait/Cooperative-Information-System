--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2021-01-03 19:45:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3165 (class 0 OID 25272)
-- Dependencies: 207
-- Data for Name: crops; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.crops VALUES (1, 'Acur', 'Sebze', 11.10, 2.50, 1);
INSERT INTO public.crops VALUES (2, 'Ananas', 'Meyve', 11.80, 11.00, 7);
INSERT INTO public.crops VALUES (3, 'Armut', 'Meyve', 8.30, 6.50, 3);
INSERT INTO public.crops VALUES (4, 'Avakado', 'Meyve', 13.80, 10.00, 5);
INSERT INTO public.crops VALUES (5, 'Ayva', 'Meyve', 9.50, 6.50, 3);
INSERT INTO public.crops VALUES (6, 'Barbunya', 'Sebze', 10.30, 11.00, 4);
INSERT INTO public.crops VALUES (7, 'Biber', 'Sebze', 13.30, 5.50, 2);
INSERT INTO public.crops VALUES (8, 'Brokoli', 'Sebze', 14.00, 4.30, 2);
INSERT INTO public.crops VALUES (9, 'Börulce', 'Sebze', 7.00, 10.00, 5);
INSERT INTO public.crops VALUES (10, 'Çilek', 'Meyve', 5.30, 15.00, 10);
INSERT INTO public.crops VALUES (11, 'Dereotu', 'Sebze', 3.10, 0.50, 1);
INSERT INTO public.crops VALUES (12, 'Domates', 'Sebze', 12.50, 5.20, 3);
INSERT INTO public.crops VALUES (13, 'Elma', 'Meyve', 2.10, 7.00, 4);
INSERT INTO public.crops VALUES (14, 'Enginar', 'Sebze', 6.30, 5.00, 3);
INSERT INTO public.crops VALUES (15, 'Fasulye', 'Sebze', 5.10, 10.00, 4);
INSERT INTO public.crops VALUES (16, 'Greyfurt', 'Meyve', 5.20, 4.00, 1);
INSERT INTO public.crops VALUES (17, 'Havuç', 'Sebze', 10.90, 2.00, 1);
INSERT INTO public.crops VALUES (18, 'Ispanak', 'Sebze', 10.70, 3.60, 1);
INSERT INTO public.crops VALUES (19, 'İncir', 'Meyve', 9.90, 4.28, 4);
INSERT INTO public.crops VALUES (20, 'Kabak', 'Sebze', 7.40, 2.30, 1);
INSERT INTO public.crops VALUES (21, 'Karnabahar', 'Sebze', 5.60, 3.50, 1);
INSERT INTO public.crops VALUES (22, 'Kavun', 'Sebze', 12.20, 5.00, 2);
INSERT INTO public.crops VALUES (23, 'Kereviz', 'Sebze', 12.30, 4.20, 2);
INSERT INTO public.crops VALUES (24, 'Kestane', 'Meyve', 2.20, 27.00, 14);
INSERT INTO public.crops VALUES (25, 'Kivi', 'Meyve', 2.70, 23.00, 10);
INSERT INTO public.crops VALUES (26, 'Kuru Soğan', 'Sebze', 5.70, 1.80, 1);
INSERT INTO public.crops VALUES (27, 'Lahana', 'Sebze', 11.20, 2.30, 1);
INSERT INTO public.crops VALUES (28, 'Limon', 'Meyve', 5.50, 2.00, 1);
INSERT INTO public.crops VALUES (29, 'Mandalina', 'Meyve', 3.90, 3.80, 1);
INSERT INTO public.crops VALUES (30, 'Mantar', 'Sebze', 2.50, 11.00, 5);
INSERT INTO public.crops VALUES (31, 'Marul', 'Sebze', 13.60, 3.30, 1);
INSERT INTO public.crops VALUES (32, 'Maydonoz', 'Sebze', 6.70, 0.50, 1);
INSERT INTO public.crops VALUES (33, 'Muz', 'Meyve', 7.40, 9.00, 4);
INSERT INTO public.crops VALUES (34, 'Muşmula', 'Meyve', 13.30, 6.00, 4);
INSERT INTO public.crops VALUES (35, 'Mısır', 'Meyve', 3.10, 1.00, 1);
INSERT INTO public.crops VALUES (36, 'Nane', 'Sebze', 5.60, 0.75, 1);
INSERT INTO public.crops VALUES (37, 'Nar', 'Meyve', 8.50, 5.00, 2);
INSERT INTO public.crops VALUES (38, 'Pancar', 'Sebze', 10.30, 2.00, 1);
INSERT INTO public.crops VALUES (39, 'Patates', 'Sebze', 9.60, 1.80, 1);
INSERT INTO public.crops VALUES (40, 'Patlıcan', 'Sebze', 9.10, 5.50, 2);
INSERT INTO public.crops VALUES (41, 'Pazı', 'Sebze', 8.20, 2.00, 1);
INSERT INTO public.crops VALUES (42, 'Portakal', 'Meyve', 14.40, 6.00, 3);
INSERT INTO public.crops VALUES (43, 'Pırasa', 'Sebze', 11.50, 3.00, 1);
INSERT INTO public.crops VALUES (44, 'Roka', 'Sebze', 6.40, 0.50, 1);
INSERT INTO public.crops VALUES (45, 'Salatalık', 'Sebze', 11.30, 4.00, 1);
INSERT INTO public.crops VALUES (46, 'Sarımsak', 'Sebze', 13.50, 24.00, 10);
INSERT INTO public.crops VALUES (47, 'Taze Soğan', 'Sebze', 14.30, 7.00, 3);
INSERT INTO public.crops VALUES (48, 'Tere', 'Sebze', 2.10, 0.50, 1);
INSERT INTO public.crops VALUES (49, 'Turp Kırmızı', 'Sebze', 1.50, 2.25, 1);
INSERT INTO public.crops VALUES (50, 'Üzüm', 'Meyve', 7.80, 4.00, 5);
INSERT INTO public.crops VALUES (51, 'Yerelması', 'Sebze', 8.10, 2.50, 1);


--
-- TOC entry 3161 (class 0 OID 25232)
-- Dependencies: 203
-- Data for Name: soiltypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.soiltypes VALUES (1, 'Laterit');
INSERT INTO public.soiltypes VALUES (2, 'Kırmızı Akdeniz');
INSERT INTO public.soiltypes VALUES (3, 'Kahverengi Orman');
INSERT INTO public.soiltypes VALUES (4, 'Kahverengi ve Kestane Rengi Bozkır');
INSERT INTO public.soiltypes VALUES (5, 'Podzol');
INSERT INTO public.soiltypes VALUES (6, 'Çernezyom');
INSERT INTO public.soiltypes VALUES (7, 'Çöl');
INSERT INTO public.soiltypes VALUES (8, 'Tundra');
INSERT INTO public.soiltypes VALUES (9, 'Alüvyal');
INSERT INTO public.soiltypes VALUES (10, 'Kolüvyal');
INSERT INTO public.soiltypes VALUES (11, 'Litosol');
INSERT INTO public.soiltypes VALUES (12, 'Regasol');
INSERT INTO public.soiltypes VALUES (13, 'Lös');
INSERT INTO public.soiltypes VALUES (14, 'Moren');
INSERT INTO public.soiltypes VALUES (15, 'Halomorfik');
INSERT INTO public.soiltypes VALUES (16, 'Hidromorfik');
INSERT INTO public.soiltypes VALUES (17, 'Kalsimorfik');


--
-- TOC entry 3159 (class 0 OID 25220)
-- Dependencies: 201
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cities VALUES (1, 'Adana', 13844.000);
INSERT INTO public.cities VALUES (2, 'Adıyaman', 7337.000);
INSERT INTO public.cities VALUES (3, 'Afyonkarahisar', 14016.000);
INSERT INTO public.cities VALUES (4, 'Ağrı', 11099.000);
INSERT INTO public.cities VALUES (5, 'Amasya', 5628.000);
INSERT INTO public.cities VALUES (6, 'Ankara', 25632.000);
INSERT INTO public.cities VALUES (7, 'Antalya', 20177.000);
INSERT INTO public.cities VALUES (8, 'Artvin', 7393.000);
INSERT INTO public.cities VALUES (9, 'Aydın', 8116.000);
INSERT INTO public.cities VALUES (10, 'Balıkesir', 14583.000);
INSERT INTO public.cities VALUES (11, 'Bilecik', 4179.000);
INSERT INTO public.cities VALUES (12, 'Bingöl', 8004.000);
INSERT INTO public.cities VALUES (13, 'Bitlis', 8294.000);
INSERT INTO public.cities VALUES (14, 'Bolu', 8313.000);
INSERT INTO public.cities VALUES (15, 'Burdur', 7175.000);
INSERT INTO public.cities VALUES (16, 'Bursa', 10813.000);
INSERT INTO public.cities VALUES (17, 'Çanakkale', 9817.000);
INSERT INTO public.cities VALUES (18, 'Çankırı', 7542.000);
INSERT INTO public.cities VALUES (19, 'Çorum', 12428.000);
INSERT INTO public.cities VALUES (20, 'Denizli', 12134.000);
INSERT INTO public.cities VALUES (21, 'Diyarbakır', 15168.000);
INSERT INTO public.cities VALUES (22, 'Edirne', 6145.000);
INSERT INTO public.cities VALUES (23, 'Elazığ', 9383.000);
INSERT INTO public.cities VALUES (24, 'Erzincan', 11815.000);
INSERT INTO public.cities VALUES (25, 'Erzurum', 25006.000);
INSERT INTO public.cities VALUES (26, 'Eskişehir', 13960.000);
INSERT INTO public.cities VALUES (27, 'Gaziantep', 6803.000);
INSERT INTO public.cities VALUES (28, 'Giresun', 7025.000);
INSERT INTO public.cities VALUES (29, 'Gümüşhane', 6668.000);
INSERT INTO public.cities VALUES (30, 'Hakkari', 7095.000);
INSERT INTO public.cities VALUES (31, 'Hatay', 5524.000);
INSERT INTO public.cities VALUES (32, 'Isparta', 8946.000);
INSERT INTO public.cities VALUES (33, 'Mersin', 16010.000);
INSERT INTO public.cities VALUES (34, 'İstanbul', 5461.000);
INSERT INTO public.cities VALUES (35, 'İzmir', 11891.000);
INSERT INTO public.cities VALUES (36, 'Kars', 10193.000);
INSERT INTO public.cities VALUES (37, 'Kastamonu', 13064.000);
INSERT INTO public.cities VALUES (38, 'Kayseri', 16970.000);
INSERT INTO public.cities VALUES (39, 'Kırklareli', 6459.000);
INSERT INTO public.cities VALUES (40, 'Kırşehir', 6584.000);
INSERT INTO public.cities VALUES (41, 'Kocaeli', 3397.000);
INSERT INTO public.cities VALUES (42, 'Konya', 40838.000);
INSERT INTO public.cities VALUES (43, 'Kütahya', 11634.000);
INSERT INTO public.cities VALUES (44, 'Malatya', 12259.000);
INSERT INTO public.cities VALUES (45, 'Manisa', 13339.000);
INSERT INTO public.cities VALUES (46, 'Kahramanmaraş', 14520.000);
INSERT INTO public.cities VALUES (47, 'Mardin', 8780.000);
INSERT INTO public.cities VALUES (48, 'Muğla', 12654.000);
INSERT INTO public.cities VALUES (49, 'Muş', 8650.000);
INSERT INTO public.cities VALUES (50, 'Nevşehir', 5485.000);
INSERT INTO public.cities VALUES (51, 'Niğde', 7234.000);
INSERT INTO public.cities VALUES (52, 'Ordu', 5861.000);
INSERT INTO public.cities VALUES (53, 'Rize', 3835.000);
INSERT INTO public.cities VALUES (54, 'Sakarya', 4824.000);
INSERT INTO public.cities VALUES (55, 'Samsun', 9725.000);
INSERT INTO public.cities VALUES (56, 'Siirt', 5717.000);
INSERT INTO public.cities VALUES (57, 'Sinop', 5717.000);
INSERT INTO public.cities VALUES (58, 'Sivas', 28164.000);
INSERT INTO public.cities VALUES (59, 'Tekirdağ', 6190.000);
INSERT INTO public.cities VALUES (60, 'Tokat', 10042.000);
INSERT INTO public.cities VALUES (61, 'Trabzon', 4628.000);
INSERT INTO public.cities VALUES (62, 'Tunceli', 7582.000);
INSERT INTO public.cities VALUES (63, 'Şanlıurfa', 19242.000);
INSERT INTO public.cities VALUES (64, 'Uşak', 5555.000);
INSERT INTO public.cities VALUES (65, 'Van', 20921.000);
INSERT INTO public.cities VALUES (66, 'Yozgat', 13690.000);
INSERT INTO public.cities VALUES (67, 'Zonguldak', 3342.000);
INSERT INTO public.cities VALUES (68, 'Aksaray', 7659.000);
INSERT INTO public.cities VALUES (69, 'Bayburt', 3746.000);
INSERT INTO public.cities VALUES (70, 'Karaman', 8678.000);
INSERT INTO public.cities VALUES (71, 'Kırıkkale', 4791.000);
INSERT INTO public.cities VALUES (72, 'Batman', 4477.000);
INSERT INTO public.cities VALUES (73, 'Şırnak', 7078.000);
INSERT INTO public.cities VALUES (74, 'Bartın', 2330.000);
INSERT INTO public.cities VALUES (75, 'Ardahan', 4934.000);
INSERT INTO public.cities VALUES (76, 'Iğdır', 3664.000);
INSERT INTO public.cities VALUES (77, 'Yalova', 798.000);
INSERT INTO public.cities VALUES (78, 'Karabük', 4142.000);
INSERT INTO public.cities VALUES (79, 'Kilis', 1412.000);
INSERT INTO public.cities VALUES (80, 'Osmaniye', 3320.000);
INSERT INTO public.cities VALUES (81, 'Düzce', 2492.000);


--
-- TOC entry 3158 (class 0 OID 25200)
-- Dependencies: 200
-- Data for Name: farmers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.farmers VALUES ('74367001340', '1976-06-29 00:00:00', 'Claudia', 'Dickens', '2000-01-11', '(447) 825-3488', 'kcronin@yahoo.com', '37207 Doyle Port Suite 200
West Marielle, SC 81126-8762', 0);
INSERT INTO public.farmers VALUES ('96584822073', '2008-02-07 00:00:00', 'Vidal', 'Rippin', '2007-09-29', '420.440.2596', 'terrance63@yahoo.com', '83044 Marcos Crest
Ankundington, MI 07393', 0);
INSERT INTO public.farmers VALUES ('22116099026', '2014-01-11 00:00:00', 'Vernie', 'Anderson', '1981-10-15', '+16935619626', 'kameron03@langworth.com', '4270 Effertz Motorway
Reynoldmouth, TX 59424-9263', 0);
INSERT INTO public.farmers VALUES ('92860264330', '1975-06-29 00:00:00', 'Tiara', 'Langosh', '1984-03-11', '1-926-343-2011', 'adell32@gmail.com', '196 Darion Island
Bernardton, AZ 46803', 0);
INSERT INTO public.farmers VALUES ('69342156715', '1994-09-01 00:00:00', 'Mackenzie', 'Renner', '1990-09-25', '753-243-0474', 'keaton56@gmail.com', '9619 Raynor Grove
Port Colinshire, WV 04038-9366', 0);
INSERT INTO public.farmers VALUES ('22795221300', '2010-12-15 00:00:00', 'Bridget', 'Cremin', '2016-06-14', '1-725-284-7701', 'samir23@yahoo.com', '53319 Emanuel Branch
New Heloise, IA 53295-9919', 0);
INSERT INTO public.farmers VALUES ('87853562125', '1984-05-18 00:00:00', 'Constance', 'O''Hara', '2002-07-23', '+16877150710', 'ritchie.rose@hotmail.com', '2858 Cruickshank Square
Murphyside, IL 54032-4085', 0);
INSERT INTO public.farmers VALUES ('40527213111', '1971-08-27 00:00:00', 'Estella', 'Hansen', '1982-11-10', '+1-214-942-2500', 'murphy.paul@hotmail.com', '11161 Edd Fords Apt. 728
North Agnesstad, IA 19402', 0);
INSERT INTO public.farmers VALUES ('24290617015', '1995-07-05 00:00:00', 'Bertram', 'McLaughlin', '1998-08-12', '697.467.9395', 'lurline59@mills.org', '153 Hyatt View
East Alfredoview, CO 01463', 0);
INSERT INTO public.farmers VALUES ('63553153086', '1988-05-28 00:00:00', 'Demond', 'Heathcote', '1975-12-29', '(409) 215-1516', 'lubowitz.patricia@yahoo.com', '99603 Christelle Trafficway Apt. 285
Schummfort, AZ 21051-6792', 0);
INSERT INTO public.farmers VALUES ('23603329767', '1981-01-22 00:00:00', 'Olaf', 'Wyman', '1988-10-15', '+1.958.606.8921', 'rhermann@gmail.com', '491 Parker Station
North Alessandra, NM 26817-6318', 0);
INSERT INTO public.farmers VALUES ('86397722079', '1991-01-03 00:00:00', 'Perry', 'Hand', '2010-10-22', '+1.502.447.1518', 'phowell@spinka.org', '24398 Orland Island Apt. 730
North Brandt, MA 00145', 0);
INSERT INTO public.farmers VALUES ('95383426584', '1991-06-28 00:00:00', 'Amparo', 'Kub', '1978-02-15', '228.383.7707', 'bernier.ciara@bergstrom.com', '75722 Raven Views
Icieview, NC 41332', 0);
INSERT INTO public.farmers VALUES ('73924540163', '2008-04-26 00:00:00', 'Barton', 'Koch', '1980-02-05', '768.959.3942', 'kbruen@sipes.biz', '7256 Erdman Creek Apt. 315
New Dillon, IA 47436-3456', 0);
INSERT INTO public.farmers VALUES ('40742943107', '1998-10-04 00:00:00', 'Joel', 'Olson', '1976-12-23', '+1-578-302-3830', 'skertzmann@gmail.com', '9853 Price Rue Suite 077
South Zenatown, MS 43437-5805', 0);
INSERT INTO public.farmers VALUES ('95282728223', '1988-01-20 00:00:00', 'Gail', 'Ruecker', '1995-07-20', '(757) 483-3880', 'qoberbrunner@renner.com', '98243 Jacobi Locks Apt. 635
West Emeliashire, AL 85010', 13095);
INSERT INTO public.farmers VALUES ('96702621249', '2002-09-13 00:00:00', 'Samantha', 'Murphy', '1978-07-28', '1-695-575-3506', 'chance52@okeefe.net', '5956 Jaime Camp Apt. 137
Goldenland, SD 57409', 3204);
INSERT INTO public.farmers VALUES ('73577588852', '1982-04-02 00:00:00', 'Rowena', 'Nikolaus', '2004-06-18', '649-637-6693', 'dmonahan@fahey.com', '98851 Alexys Roads Apt. 878
West Hassiebury, SD 64510', 8650);
INSERT INTO public.farmers VALUES ('37106016524', '2005-10-08 00:00:00', 'Pierce', 'Lindgren', '2000-12-24', '(945) 241-2238', 'wcole@gmail.com', '42452 Goldner Shore Suite 476
Kubland, VA 47543', 13700);
INSERT INTO public.farmers VALUES ('66504027620', '1979-08-21 00:00:00', 'Pansy', 'Grant', '1996-03-04', '+1 (354) 853-5245', 'aimee92@rosenbaum.net', '90653 Cruickshank Estate
Salliebury, AK 88603', 960);
INSERT INTO public.farmers VALUES ('82029664067', '1983-01-30 00:00:00', 'Dayana', 'Ledner', '2007-08-02', '824-432-2238', 'kunze.vilma@hotmail.com', '74244 Armstrong Orchard Suite 797
West Vernonburgh, ID 11915-8734', 8776);
INSERT INTO public.farmers VALUES ('36679707479', '1982-07-15 00:00:00', 'Archibald', 'Fisher', '1980-07-25', '+13487821612', 'joy.ullrich@hotmail.com', '317 Kerluke Vista Apt. 836
New Jerroldtown, CA 01881', 29868);
INSERT INTO public.farmers VALUES ('81122136337', '2012-01-08 00:00:00', 'Allen', 'Hoppe', '1996-04-16', '+1.585.669.8676', 'lavern86@schneider.com', '334 Mann Land Apt. 371
Rathburgh, OR 18239', 1840);
INSERT INTO public.farmers VALUES ('78270111708', '2016-10-12 00:00:00', 'Melisa', 'Schroeder', '2017-11-30', '+1 (204) 556-8890', 'clemke@mueller.org', '68240 Blick Ranch Suite 797
South Khalil, WY 19496-0213', 4475);
INSERT INTO public.farmers VALUES ('83090447335', '2011-10-22 00:00:00', 'Janice', 'Dicki', '2005-02-19', '+1 (329) 472-5000', 'runolfsson.alison@yahoo.com', '98156 Ratke Courts
Ankundinghaven, SC 31564-2473', 23177);
INSERT INTO public.farmers VALUES ('86152020692', '1976-06-15 00:00:00', 'Tressie', 'Abbott', '2016-07-10', '1-919-688-4267', 'rice.karl@gmail.com', '6598 Clara Burg Suite 178
Port Marionchester, AR 22864-5744', 2924);
INSERT INTO public.farmers VALUES ('59297982714', '1990-07-06 00:00:00', 'Faustino', 'McLaughlin', '2012-01-07', '+19205705531', 'phirthe@gmail.com', '7577 Deckow Keys Suite 924
Raymondberg, CT 89117', 1665);
INSERT INTO public.farmers VALUES ('73755195243', '2018-08-29 00:00:00', 'Earl', 'Dietrich', '2009-12-03', '1-476-854-8279', 'cjenkins@satterfield.net', '755 Isaiah Hills Suite 001
Hollisport, ND 54830', 7223);
INSERT INTO public.farmers VALUES ('39039628605', '2004-06-28 00:00:00', 'Isabelle', 'Morar', '1978-05-09', '+1.212.690.6555', 'cartwright.kadin@considine.com', '89136 Jessika Plaza Apt. 042
Rohanstad, VT 67971', 3039);
INSERT INTO public.farmers VALUES ('13531648642', '2019-03-28 00:00:00', 'Nickolas', 'Feeney', '2003-02-16', '+1.942.550.6477', 'velma82@yahoo.com', '57441 Beer Forges
Lake Wallaceview, KY 51441-6939', 3336);
INSERT INTO public.farmers VALUES ('97681467391', '1986-02-11 00:00:00', 'Sherman', 'D''Amore', '2009-04-01', '949.201.4853', 'brian31@gmail.com', '942 Santino Parks Suite 092
Naderview, SC 30088', 2340);
INSERT INTO public.farmers VALUES ('80387273551', '2005-07-12 00:00:00', 'Kaitlin', 'Kozey', '2020-07-13', '+1-641-509-9884', 'zelda66@yahoo.com', '908 Mariano Causeway Suite 472
Rempelport, OH 32455-3353', 467);
INSERT INTO public.farmers VALUES ('54053014136', '1988-04-11 00:00:00', 'Nash', 'Kuvalis', '2016-01-26', '1-397-543-0846', 'njenkins@barrows.com', '58351 Bode Run Suite 030
Blandafurt, AR 53736-4119', 677);
INSERT INTO public.farmers VALUES ('36425537800', '1980-12-16 00:00:00', 'Colby', 'Veum', '1981-03-16', '+16147274403', 'alessandra37@yahoo.com', '7931 Hayes Squares
West Corrineborough, LA 76768', 1006);
INSERT INTO public.farmers VALUES ('29471955016', '2016-08-29 00:00:00', 'Emile', 'Rohan', '1989-01-09', '1-801-980-5323', 'delphia.will@kulas.com', '763 Vicente Walks Suite 530
Karlside, AR 05118-6044', 28168);
INSERT INTO public.farmers VALUES ('41887714070', '1990-10-14 00:00:00', 'Horacio', 'Deckow', '2002-04-03', '1-376-220-3976', 'spencer.mclaughlin@hotmail.com', '5451 Willms Shoals Suite 358
South Alenemouth, OH 85084-1249', 5061);
INSERT INTO public.farmers VALUES ('41275937582', '1984-10-30 00:00:00', 'Rae', 'Brekke', '2008-09-03', '445-675-5097', 'wendy68@yahoo.com', '72121 Wiza Spring Suite 824
Mullerborough, WY 56851-0151', 4515);
INSERT INTO public.farmers VALUES ('64886890839', '1985-01-25 00:00:00', 'Hallie', 'Nienow', '2005-08-24', '(863) 466-0715', 'treinger@gmail.com', '98676 Bruen Vista
Schimmelview, AZ 10928-9643', 2986);
INSERT INTO public.farmers VALUES ('93121166415', '1972-07-08 00:00:00', 'Federico', 'Konopelski', '2005-02-16', '626-226-5954', 'zbecker@harber.com', '317 Ewell Inlet Suite 912
North Karl, MI 69290-1123', 2642);
INSERT INTO public.farmers VALUES ('68237311969', '1988-03-29 00:00:00', 'Freddy', 'Carter', '2008-08-05', '883-593-1421', 'carter.ollie@ryan.info', '306 Russ Gardens Suite 051
North Katelin, CT 10149-9605', 827);
INSERT INTO public.farmers VALUES ('47783337538', '2013-09-13 00:00:00', 'Itzel', 'Lind', '2019-05-12', '(764) 383-2160', 'ardith.little@hotmail.com', '9550 Lacy Turnpike
Mellietown, NV 79746-8510', 4658);
INSERT INTO public.farmers VALUES ('76926646269', '1980-01-07 00:00:00', 'Agnes', 'Parisian', '2001-08-30', '954.316.4547', 'conn.shanny@hotmail.com', '4768 Efrain Coves
East Kennethside, MD 85032', 746);
INSERT INTO public.farmers VALUES ('20700549211', '2010-06-26 00:00:00', 'Henry', 'Ryan', '2001-09-06', '+1-461-410-8796', 'fkuhlman@hotmail.com', '4661 Ratke Track Suite 864
West Maybelle, MI 31120-3328', 1143);
INSERT INTO public.farmers VALUES ('49453113216', '1983-05-22 00:00:00', 'Larry', 'Hahn', '1992-04-17', '+1-971-470-3981', 'zondricka@yahoo.com', '90015 Schaefer Centers Suite 775
Ricemouth, IN 91940', 1086);
INSERT INTO public.farmers VALUES ('85400243518', '1995-03-10 00:00:00', 'Nora', 'Bode', '1979-03-11', '1-819-746-5595', 'stark.mckenzie@howell.com', '7684 Alf Cape
New Peggietown, SD 42681-5718', 6218);
INSERT INTO public.farmers VALUES ('14095189739', '2019-01-16 00:00:00', 'Rhea', 'Funk', '1987-12-29', '+1-876-471-6630', 'vgraham@gmail.com', '40922 Jacobi Locks Apt. 064
Terrancefurt, OK 20448-2710', 8064);
INSERT INTO public.farmers VALUES ('52332702854', '1990-11-10 00:00:00', 'Grayson', 'Zieme', '2015-06-11', '+1 (551) 367-2664', 'devyn.shields@gmail.com', '91434 Gislason Mountain Apt. 278
Port Lesly, SC 64775-1848', 14696);
INSERT INTO public.farmers VALUES ('48661190166', '1977-04-03 00:00:00', 'Cora', 'Kub', '2006-07-05', '(991) 782-0037', 'djacobi@gmail.com', '2994 Bertrand Tunnel
New Ledamouth, SD 73293-5240', 0);
INSERT INTO public.farmers VALUES ('12349174928', '2019-09-10 00:00:00', 'Grayson', 'Williamson', '1978-04-05', '327.994.2836', 'eparker@yahoo.com', '9980 Morar Wall Suite 788
West Winnifred, TN 21079-8589', 0);
INSERT INTO public.farmers VALUES ('33578403048', '2020-06-16 00:00:00', 'Agustin', 'Turner', '2006-01-09', '1-294-444-7001', 'ludwig.herman@gmail.com', '913 Tromp Coves
East Randallchester, LA 20105-8644', 0);
INSERT INTO public.farmers VALUES ('29433372715', '2011-03-25 00:00:00', 'Bret', 'Marquardt', '1995-08-09', '1-345-427-7842', 'serenity.hahn@hotmail.com', '13928 Murl Wall
Port Madisen, MO 33049', 0);
INSERT INTO public.farmers VALUES ('85162708170', '1976-05-12 00:00:00', 'Zackary', 'Reinger', '1981-10-22', '+1-638-235-1586', 'mae29@hotmail.com', '65122 Nannie Shores
Howellport, GA 13814-7361', 0);
INSERT INTO public.farmers VALUES ('76615927303', '2019-10-02 00:00:00', 'Jaunita', 'Ullrich', '2004-04-17', '+14626274744', 'edmond.vandervort@hotmail.com', '13292 Thaddeus Mount Suite 707
West Theresia, WY 85575-2152', 1523);
INSERT INTO public.farmers VALUES ('90366643479', '1983-11-01 00:00:00', 'Johan', 'Hane', '1993-02-07', '+1-464-813-4472', 'xdurgan@hotmail.com', '435 Kirlin Path
South Gwen, CA 52553', 4254);
INSERT INTO public.farmers VALUES ('89982265785', '1990-12-05 00:00:00', 'Randi', 'Rath', '1990-10-28', '+12357887662', 'aondricka@carroll.com', '7267 Runolfsson Neck
McKenzieton, MA 82551-2526', 2172);
INSERT INTO public.farmers VALUES ('92055203659', '2011-03-12 00:00:00', 'Kaylee', 'Marvin', '1998-01-26', '706-500-5590', 'delmer.wunsch@trantow.com', '73200 Little Summit Suite 972
Rohanchester, ID 12602', 5220);
INSERT INTO public.farmers VALUES ('40152106929', '2009-03-23 00:00:00', 'Ransom', 'Koelpin', '1991-04-29', '+1 (634) 515-2379', 'abagail.satterfield@wisoky.com', '36338 Weldon Brooks
Emmieton, NH 96626-0099', 9427);
INSERT INTO public.farmers VALUES ('75341613403', '1976-01-24 00:00:00', 'Juliet', 'Hayes', '1978-02-02', '392-756-7729', 'dusty63@yahoo.com', '57258 Camila Forge Apt. 866
Terrancemouth, PA 91092', 2106);
INSERT INTO public.farmers VALUES ('13661320700', '1995-06-19 00:00:00', 'Jayda', 'Mitchell', '2013-02-15', '+1.567.207.5924', 'viva67@hamill.com', '1939 Jasen Coves
North Howellhaven, LA 44866', 9296);
INSERT INTO public.farmers VALUES ('47482140970', '1985-08-08 00:00:00', 'Vivian', 'Wunsch', '2011-10-15', '(545) 788-4476', 'lily25@lakin.com', '30938 Maritza Trafficway Apt. 503
Breitenbergshire, TX 19350', 1666);


--
-- TOC entry 3168 (class 0 OID 25301)
-- Dependencies: 210
-- Data for Name: cooperatives; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cooperatives VALUES (1, 'Morissette-Yundt', '2011-12-05', '96702621249', '59297982714', 31, '6025 Gibson Keys Suite 971
Donnietown, RI 82278-0890', 'maude76@hotmail.com', 0);
INSERT INTO public.cooperatives VALUES (11, 'Dach-Bosco', '2006-09-12', '92055203659', '40527213111', 21, '41559 Larissa Harbors Suite 015
O''Connerchester, SC 90998', 'vernice.rau@ruecker.com', 0);
INSERT INTO public.cooperatives VALUES (16, 'Jacobson, Trantow and Volkman', '1988-12-07', '97681467391', '47482140970', 28, '7039 Hayes Alley
Kamronville, CA 37084-0555', 'botsford.paolo@wisozk.com', 0);
INSERT INTO public.cooperatives VALUES (18, 'Halvorson-Thompson', '1988-01-28', '13531648642', '75341613403', 5, '91724 Javonte Fort
Lake Adahland, CO 99444', 'nathaniel64@padberg.com', 0);
INSERT INTO public.cooperatives VALUES (20, 'Skiles Inc', '1992-12-07', '49453113216', '54053014136', 30, '9254 Kshlerin Springs Apt. 488
Port Kole, NM 91224-9394', 'anika.stoltenberg@mcglynn.info', 0);
INSERT INTO public.cooperatives VALUES (22, 'Smitham Group', '1994-12-06', '92055203659', '90366643479', 15, '46260 Veum Rapid
North Birdie, DC 73572-6468', 'hailee.mraz@bins.com', 0);
INSERT INTO public.cooperatives VALUES (23, 'Greenfelder, Witting and Willms', '2002-05-02', '75341613403', '76926646269', 36, '1634 Douglas Spur Suite 506
West Holly, OH 57426-6498', 'nina.parisian@rogahn.com', 0);
INSERT INTO public.cooperatives VALUES (24, 'Bahringer Ltd', '1976-05-07', '76926646269', '93121166415', 28, '99410 Bartell Roads
West Lorenashire, GA 82681', 'shad.kirlin@gmail.com', 0);
INSERT INTO public.cooperatives VALUES (25, 'Ullrich, Metz and Bartell', '2002-04-08', '83090447335', '47783337538', 5, '98423 Kohler Tunnel
Lizashire, ND 49908', 'kade.waelchi@hotmail.com', 0);
INSERT INTO public.cooperatives VALUES (28, 'King, Schmeler and Grady', '2010-10-07', '40527213111', '73577588852', 55, '107 Ada Land
North Nathanialberg, MS 09008', 'vgaylord@gaylord.com', 0);
INSERT INTO public.cooperatives VALUES (29, 'Swaniawski Inc', '1985-05-20', '39039628605', '86152020692', 40, '41813 Lang Lock Suite 066
Adolphusberg, ME 64335-0037', 'wuckert.giovanny@klocko.info', 0);
INSERT INTO public.cooperatives VALUES (30, 'Lesch-Conn', '2012-12-12', '40152106929', '63553153086', 4, '270 Nelson Lakes
Eltonton, MO 88167', 'stanton.walton@brown.biz', 0);
INSERT INTO public.cooperatives VALUES (34, 'Steuber, Effertz and Leffler', '2003-10-16', '39039628605', '47482140970', 22, '3020 Kade Parkway
Lake Jacquesberg, TX 32696', 'mboyle@lebsack.com', 0);
INSERT INTO public.cooperatives VALUES (35, 'Lang, Williamson and Kling', '2016-10-22', '69342156715', '22795221300', 57, '3458 Mertz Drive Apt. 012
South Tommiemouth, OH 67575-1210', 'daugherty.maida@bauch.com', 0);
INSERT INTO public.cooperatives VALUES (38, 'Roob, Mohr and Rodriguez', '2002-08-12', '12349174928', '41275937582', 50, '6259 Brandyn Islands Apt. 828
Coymouth, OH 79604', 'luettgen.keeley@gmail.com', 0);
INSERT INTO public.cooperatives VALUES (17, 'Gerlach-Bosco', '1987-06-21', '41275937582', '54053014136', 18, '97918 Alexa Prairie
Jedidiahview, OR 41224', 'hoyt32@johnston.org', 3);
INSERT INTO public.cooperatives VALUES (2, 'Gislason Ltd', '1989-10-04', '29433372715', '33578403048', 42, '6150 Lucas Street
Ellisland, CO 18253-3487', 'cicero99@hill.biz', 1);
INSERT INTO public.cooperatives VALUES (39, 'Lesch-Abbott', '1976-08-20', '73755195243', '73924540163', 75, '765 Carole Expressway Suite 216
Lake Leoraland, SC 50344', 'candida57@gmail.com', 3);
INSERT INTO public.cooperatives VALUES (26, 'Graham, Schmitt and Pagac', '1997-07-09', '64886890839', '89982265785', 6, '751 Upton Fords
Feilfurt, CA 41609', 'dorris74@hotmail.com', 1);
INSERT INTO public.cooperatives VALUES (37, 'Leannon, Green and Bogan', '1980-01-10', '66504027620', '95282728223', 21, '277 Ken River Apt. 731
Port Idellstad, VA 67846-7991', 'casper.hannah@zemlak.com', 1);
INSERT INTO public.cooperatives VALUES (13, 'Cremin, Hickle and Kreiger', '1999-10-15', '95282728223', '89982265785', 20, '837 Wehner Lake
Tellymouth, IA 74561-5080', 'williamson.leilani@mayert.com', 1);
INSERT INTO public.cooperatives VALUES (6, 'Adams, Bartoletti and Abernathy', '1980-09-21', '82029664067', '36425537800', 6, '740 Jackeline Pine Apt. 726
Earlbury, WV 54382-6646', 'lura98@gmail.com', 1);
INSERT INTO public.cooperatives VALUES (7, 'Cormier-Jakubowski', '2020-01-09', '22795221300', '29471955016', 37, '892 Homenick Stream
Eichmannmouth, MN 86072', 'nadia83@gmail.com', 2);
INSERT INTO public.cooperatives VALUES (3, 'Zulauf Ltd', '1973-02-11', '90366643479', '92860264330', 61, '7791 Beatty Summit
Hoppeberg, NJ 67212', 'harber.nikolas@stark.com', 2);
INSERT INTO public.cooperatives VALUES (8, 'Doyle and Sons', '1970-03-26', '36425537800', '86152020692', 51, '508 Rippin Turnpike
Lake Raina, NE 90716-8899', 'lonie.mertz@yahoo.com', 1);
INSERT INTO public.cooperatives VALUES (19, 'Howell-Barton', '1982-10-12', '36679707479', '68237311969', 43, '796 Tito Cliffs
West Viviane, PA 16527-6461', 'mwilliamson@gmail.com', 2);
INSERT INTO public.cooperatives VALUES (21, 'Miller-Mayert', '1977-03-02', '78270111708', '29433372715', 21, '124 Keely Locks Suite 542
North Moshechester, TN 91380-1213', 'marcel58@yahoo.com', 1);
INSERT INTO public.cooperatives VALUES (15, 'Crist, Hintz and Stamm', '1990-04-24', '76615927303', '89982265785', 36, '787 Brielle Field Apt. 705
West Elliottburgh, NV 41668', 'piper98@hotmail.com', 2);
INSERT INTO public.cooperatives VALUES (12, 'Langosh-Swaniawski', '2015-01-13', '66504027620', '93121166415', 32, '883 Alanna Neck Apt. 810
Peggieborough, CO 32369', 'madelyn.schumm@hotmail.com', 1);
INSERT INTO public.cooperatives VALUES (4, 'Hoppe, Bashirian and Durgan', '1986-09-30', '80387273551', '73755195243', 59, '1939 Mark Branch Suite 686
Brianneport, DE 07687-6670', 'bobby.streich@jakubowski.com', 1);
INSERT INTO public.cooperatives VALUES (36, 'Predovic-Balistreri', '1977-10-01', '63553153086', '73755195243', 79, '27090 Harris Isle
O''Konfort, MS 01015-1099', 'dave08@yahoo.com', 3);
INSERT INTO public.cooperatives VALUES (40, 'Olson Inc', '2004-04-18', '37106016524', '33578403048', 75, '682 Ledner Cove Apt. 782
O''Connerburgh, SC 40760', 'pollich.delpha@kutch.biz', 1);
INSERT INTO public.cooperatives VALUES (9, 'Mohr-Pacocha', '1985-10-01', '20700549211', '22795221300', 4, '3690 Lorenzo Bridge Apt. 909
Jeanneburgh, PA 25431-1735', 'euna.shanahan@hotmail.com', 1);
INSERT INTO public.cooperatives VALUES (27, 'Howe, Raynor and Schoen', '2015-12-21', '23603329767', '29471955016', 3, '90000 Howard Islands Suite 952
South Kameron, WV 91425-0046', 'annabell38@hotmail.com', 2);
INSERT INTO public.cooperatives VALUES (5, 'Johnson, Dicki and Cole', '2008-09-27', '92055203659', '89982265785', 41, '6909 Flatley Trace Suite 308
Lake Henry, WA 83795', 'merlin87@waters.com', 1);
INSERT INTO public.cooperatives VALUES (10, 'Hahn-Gutkowski', '1970-03-03', '86397722079', '82029664067', 27, '9757 Graham Dam
East Kylastad, MT 26226', 'jake04@abshire.com', 1);
INSERT INTO public.cooperatives VALUES (31, 'Collier, Gleason and Boyer', '2017-03-02', '40527213111', '29471955016', 66, '9993 Mac Bypass
Orlofort, WY 05631-2854', 'noemy09@macejkovic.com', 2);
INSERT INTO public.cooperatives VALUES (33, 'Dickens-Sanford', '1978-10-20', '39039628605', '96584822073', 56, '8965 Ryan Isle Apt. 761
North Axelborough, MD 60253-5092', 'letha.mitchell@gmail.com', 2);
INSERT INTO public.cooperatives VALUES (32, 'Upton Group', '2012-01-28', '37106016524', '29433372715', 8, '50272 Noah Point
Brandynbury, PA 67748-9632', 'eleazar33@shanahan.com', 2);
INSERT INTO public.cooperatives VALUES (14, 'Murazik-Dickens', '1997-06-26', '23603329767', '22116099026', 52, '437 Aron Village Suite 294
West Thalia, SD 18398', 'joey.auer@yahoo.com', 1);


--
-- TOC entry 3169 (class 0 OID 25332)
-- Dependencies: 211
-- Data for Name: cooperativemember; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cooperativemember VALUES (15, '37106016524', '1979-02-23 02:17:07');
INSERT INTO public.cooperativemember VALUES (2, '39039628605', '1993-07-04 19:54:36');
INSERT INTO public.cooperativemember VALUES (7, '80387273551', '1976-04-21 06:59:38');
INSERT INTO public.cooperativemember VALUES (36, '96702621249', '1971-09-17 05:31:10');
INSERT INTO public.cooperativemember VALUES (37, '95282728223', '1975-09-28 09:21:01');
INSERT INTO public.cooperativemember VALUES (39, '82029664067', '2007-12-03 18:32:54');
INSERT INTO public.cooperativemember VALUES (3, '64886890839', '2005-08-17 07:25:20');
INSERT INTO public.cooperativemember VALUES (6, '69342156715', '1980-01-06 09:21:13');
INSERT INTO public.cooperativemember VALUES (19, '40152106929', '2001-09-26 00:26:17');
INSERT INTO public.cooperativemember VALUES (3, '93121166415', '1992-12-30 01:58:47');
INSERT INTO public.cooperativemember VALUES (8, '49453113216', '2015-04-24 19:31:23');
INSERT INTO public.cooperativemember VALUES (39, '37106016524', '1979-09-28 16:19:55');
INSERT INTO public.cooperativemember VALUES (19, '47783337538', '1972-04-18 11:35:59');
INSERT INTO public.cooperativemember VALUES (32, '80387273551', '2020-01-24 23:18:16');
INSERT INTO public.cooperativemember VALUES (15, '29471955016', '1983-05-15 09:06:32');
INSERT INTO public.cooperativemember VALUES (13, '59297982714', '2019-03-31 08:53:03');
INSERT INTO public.cooperativemember VALUES (17, '69342156715', '1977-02-11 10:58:03');
INSERT INTO public.cooperativemember VALUES (12, '83090447335', '1987-06-27 05:22:23');
INSERT INTO public.cooperativemember VALUES (4, '22795221300', '2005-01-27 18:17:06');
INSERT INTO public.cooperativemember VALUES (36, '29471955016', '2006-04-22 21:07:36');
INSERT INTO public.cooperativemember VALUES (31, '89982265785', '2019-07-14 05:34:47');
INSERT INTO public.cooperativemember VALUES (33, '36425537800', '1986-07-12 05:12:47');
INSERT INTO public.cooperativemember VALUES (9, '47783337538', '1977-08-14 17:55:23');
INSERT INTO public.cooperativemember VALUES (27, '59297982714', '1975-08-29 18:39:29');
INSERT INTO public.cooperativemember VALUES (27, '75341613403', '2014-12-24 07:36:56');
INSERT INTO public.cooperativemember VALUES (5, '40742943107', '2001-08-30 01:51:31');
INSERT INTO public.cooperativemember VALUES (17, '76926646269', '2014-02-09 11:53:52');
INSERT INTO public.cooperativemember VALUES (26, '29471955016', '1972-06-27 09:06:27');
INSERT INTO public.cooperativemember VALUES (10, '75341613403', '1981-06-09 17:13:24');
INSERT INTO public.cooperativemember VALUES (31, '14095189739', '2020-08-07 20:43:26');
INSERT INTO public.cooperativemember VALUES (33, '22795221300', '1982-09-21 17:35:50');
INSERT INTO public.cooperativemember VALUES (7, '93121166415', '1971-06-03 09:40:19');
INSERT INTO public.cooperativemember VALUES (36, '69342156715', '2002-04-08 18:35:57');
INSERT INTO public.cooperativemember VALUES (32, '78270111708', '1989-08-16 23:29:01');
INSERT INTO public.cooperativemember VALUES (14, '82029664067', '1972-06-08 01:20:29');
INSERT INTO public.cooperativemember VALUES (17, '14095189739', '2000-09-08 00:01:46');
INSERT INTO public.cooperativemember VALUES (39, '40527213111', '2014-03-27 10:06:02');
INSERT INTO public.cooperativemember VALUES (21, '40152106929', '1991-05-09 21:02:06');
INSERT INTO public.cooperativemember VALUES (40, '13531648642', '2008-02-02 21:15:23');


--
-- TOC entry 3176 (class 0 OID 25411)
-- Dependencies: 219
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3163 (class 0 OID 25244)
-- Dependencies: 205
-- Data for Name: farms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.farms VALUES (1, '2012-06-26 00:00:00', '75341613403', 69, -64.31, -79.98, 1523.00, 7, 9140.00);
INSERT INTO public.farms VALUES (2, '1971-10-22 00:00:00', '64886890839', 78, 76.21, 179.55, 1243.00, 2, 17076.00);
INSERT INTO public.farms VALUES (3, '1973-12-21 00:00:00', '95282728223', 64, -5.81, -27.94, 629.00, 12, 15430.00);
INSERT INTO public.farms VALUES (4, '2007-04-30 00:00:00', '76926646269', 75, -28.69, 165.5, 96.00, 2, 10078.00);
INSERT INTO public.farms VALUES (5, '1988-09-11 00:00:00', '13531648642', 30, 77.68, -0.95, 143.00, 16, 15979.00);
INSERT INTO public.farms VALUES (6, '1985-01-20 00:00:00', '89982265785', 81, 5.82, -142.93, 1887.00, 13, 3312.00);
INSERT INTO public.farms VALUES (7, '2017-10-31 00:00:00', '12349174928', 20, 88.24, -108.31, 179.00, 9, 7484.00);
INSERT INTO public.farms VALUES (8, '2014-08-29 00:00:00', '73577588852', 23, 23.99, -94.57, 279.00, 14, 10742.00);
INSERT INTO public.farms VALUES (9, '1976-11-11 00:00:00', '64886890839', 50, 5.22, 145.55, 1965.00, 12, 2713.00);
INSERT INTO public.farms VALUES (10, '2007-05-20 00:00:00', '82029664067', 32, 28.21, -9.04, 1896.00, 4, 6753.00);
INSERT INTO public.farms VALUES (11, '1986-02-19 00:00:00', '36679707479', 76, -71.61, 67.64, 381.00, 4, 14290.00);
INSERT INTO public.farms VALUES (12, '1987-12-29 00:00:00', '33578403048', 79, 6.43, -149.9, 4.00, 7, 15910.00);
INSERT INTO public.farms VALUES (13, '1975-04-28 00:00:00', '39039628605', 81, -76.6, -91.44, 1911.00, 2, 11955.00);
INSERT INTO public.farms VALUES (14, '1984-06-14 00:00:00', '82029664067', 24, -84.19, 68.07, 664.00, 3, 6335.00);
INSERT INTO public.farms VALUES (15, '1981-04-19 00:00:00', '59297982714', 4, -56.56, -65.86, 1337.00, 6, 19714.00);
INSERT INTO public.farms VALUES (16, '2007-04-19 00:00:00', '78270111708', 55, -13.24, -47.71, 749.00, 7, 9095.00);
INSERT INTO public.farms VALUES (17, '2014-05-01 00:00:00', '47783337538', 25, 26.11, 10.19, 1582.00, 14, 19455.00);
INSERT INTO public.farms VALUES (18, '1998-07-15 00:00:00', '41275937582', 66, 55.77, 69.85, 1921.00, 2, 9549.00);
INSERT INTO public.farms VALUES (19, '1989-06-08 00:00:00', '13661320700', 81, 47.1, 140.98, 1025.00, 6, 13907.00);
INSERT INTO public.farms VALUES (20, '1993-11-15 00:00:00', '73924540163', 16, -86.58, 49.86, 954.00, 15, 13218.00);
INSERT INTO public.farms VALUES (21, '2015-03-24 00:00:00', '83090447335', 67, -74.28, 125.52, 1372.00, 17, 19275.00);
INSERT INTO public.farms VALUES (22, '1998-11-11 00:00:00', '75341613403', 4, -44.03, 94.02, 109.00, 16, 8827.00);
INSERT INTO public.farms VALUES (23, '1974-01-20 00:00:00', '86152020692', 18, -4.48, 161.75, 158.00, 16, 6831.00);
INSERT INTO public.farms VALUES (24, '2007-10-06 00:00:00', '24290617015', 54, 53.53, 90.61, 1947.00, 7, 1189.00);
INSERT INTO public.farms VALUES (25, '1978-11-29 00:00:00', '29471955016', 56, -68.53, 77.13, 1582.00, 7, 11459.00);
INSERT INTO public.farms VALUES (26, '2020-06-22 00:00:00', '95282728223', 32, 9.65, -68.26, 1548.00, 15, 2002.00);
INSERT INTO public.farms VALUES (27, '2017-07-13 00:00:00', '82029664067', 48, -83.3, -168.98, 1118.00, 14, 18425.00);
INSERT INTO public.farms VALUES (28, '1988-11-05 00:00:00', '93121166415', 5, -2.64, 88, 1667.00, 12, 8242.00);
INSERT INTO public.farms VALUES (29, '2018-03-24 00:00:00', '73577588852', 7, 5.17, 52.47, 1179.00, 10, 8130.00);
INSERT INTO public.farms VALUES (30, '1996-06-10 00:00:00', '95282728223', 48, 57.34, 174.96, 1320.00, 3, 18947.00);
INSERT INTO public.farms VALUES (31, '1989-04-11 00:00:00', '85162708170', 76, 37.99, -101.61, 1976.00, 9, 1344.00);
INSERT INTO public.farms VALUES (32, '2019-11-20 00:00:00', '95383426584', 53, -17.16, -170.01, 1139.00, 12, 16554.00);
INSERT INTO public.farms VALUES (33, '1977-03-05 00:00:00', '73755195243', 9, 28.37, 84.39, 1105.00, 10, 12970.00);
INSERT INTO public.farms VALUES (34, '2001-04-22 00:00:00', '90366643479', 36, 53.84, 61.61, 1900.00, 6, 15248.00);
INSERT INTO public.farms VALUES (35, '2019-08-10 00:00:00', '54053014136', 20, -6.77, 44.54, 567.00, 11, 19185.00);
INSERT INTO public.farms VALUES (36, '1982-03-02 00:00:00', '13661320700', 34, 72.94, -131.16, 1917.00, 10, 11678.00);
INSERT INTO public.farms VALUES (37, '1999-07-29 00:00:00', '81122136337', 76, 75.21, 69.58, 14.00, 14, 2642.00);
INSERT INTO public.farms VALUES (38, '2000-09-14 00:00:00', '37106016524', 71, 24.66, 11.24, 203.00, 3, 9075.00);
INSERT INTO public.farms VALUES (39, '1982-02-08 00:00:00', '52332702854', 12, 41.62, 18.93, 808.00, 5, 10414.00);
INSERT INTO public.farms VALUES (40, '1999-06-17 00:00:00', '68237311969', 70, 87.49, 41.45, 1967.00, 8, 753.00);
INSERT INTO public.farms VALUES (41, '1970-06-06 00:00:00', '97681467391', 74, -89.15, 172.89, 1228.00, 2, 15719.00);
INSERT INTO public.farms VALUES (42, '2016-08-13 00:00:00', '47482140970', 46, -59.5, 94.44, 1752.00, 12, 16757.00);
INSERT INTO public.farms VALUES (43, '2008-11-22 00:00:00', '80387273551', 58, -19.86, -104.01, 924.00, 10, 12545.00);
INSERT INTO public.farms VALUES (44, '1975-05-05 00:00:00', '86152020692', 36, -34.79, -100.16, 685.00, 6, 16422.00);
INSERT INTO public.farms VALUES (45, '1993-03-06 00:00:00', '86397722079', 15, 31.58, -54.24, 1387.00, 13, 15229.00);
INSERT INTO public.farms VALUES (46, '1971-03-17 00:00:00', '85400243518', 27, 13.31, 9.89, 1354.00, 14, 10254.00);
INSERT INTO public.farms VALUES (47, '2008-05-21 00:00:00', '36679707479', 66, 40.17, 6.55, 1458.00, 13, 14387.00);
INSERT INTO public.farms VALUES (48, '1978-10-06 00:00:00', '82029664067', 15, 87.73, 124.99, 1344.00, 16, 11441.00);
INSERT INTO public.farms VALUES (49, '1974-04-14 00:00:00', '63553153086', 26, -38.34, 67.21, 673.00, 13, 9751.00);
INSERT INTO public.farms VALUES (50, '2015-12-03 00:00:00', '81122136337', 38, 70.93, -88.02, 652.00, 5, 2884.00);
INSERT INTO public.farms VALUES (51, '2017-04-24 00:00:00', '73577588852', 8, 41.31, 139.34, 617.00, 15, 17182.00);
INSERT INTO public.farms VALUES (52, '1970-08-22 00:00:00', '40527213111', 31, 47.07, -105.1, 192.00, 6, 15390.00);
INSERT INTO public.farms VALUES (53, '1980-11-29 00:00:00', '85400243518', 14, -70.8, -82.62, 1478.00, 3, 3674.00);
INSERT INTO public.farms VALUES (54, '1987-06-21 00:00:00', '47482140970', 34, -52.76, 13.77, 792.00, 8, 11721.00);
INSERT INTO public.farms VALUES (55, '1978-07-07 00:00:00', '47482140970', 67, -38.04, 45.68, 827.00, 6, 12024.00);
INSERT INTO public.farms VALUES (56, '1995-02-16 00:00:00', '47783337538', 68, 1.73, -134.76, 1534.00, 11, 321.00);
INSERT INTO public.farms VALUES (57, '2000-06-01 00:00:00', '85400243518', 30, -89.78, -169.81, 270.00, 15, 8574.00);
INSERT INTO public.farms VALUES (58, '2004-09-14 00:00:00', '92055203659', 8, 34.06, -30.75, 1290.00, 17, 17211.00);
INSERT INTO public.farms VALUES (59, '2005-06-26 00:00:00', '29471955016', 12, -89.74, 140.97, 1200.00, 6, 9478.00);
INSERT INTO public.farms VALUES (60, '2011-05-06 00:00:00', '39039628605', 23, 88.43, -123.39, 1740.00, 7, 10844.00);
INSERT INTO public.farms VALUES (61, '1982-08-23 00:00:00', '40152106929', 23, -73.53, -107.53, 1879.00, 10, 17895.00);
INSERT INTO public.farms VALUES (62, '2006-12-06 00:00:00', '86152020692', 4, 74.93, 44.78, 781.00, 6, 1406.00);
INSERT INTO public.farms VALUES (63, '1998-03-03 00:00:00', '78270111708', 58, -22.78, 96.33, 809.00, 5, 746.00);
INSERT INTO public.farms VALUES (64, '1983-06-25 00:00:00', '83090447335', 43, 28.32, 135.03, 1486.00, 14, 1239.00);
INSERT INTO public.farms VALUES (65, '1999-11-02 00:00:00', '47482140970', 65, 31.07, -111.25, 1114.00, 3, 13272.00);
INSERT INTO public.farms VALUES (66, '1984-01-04 00:00:00', '76615927303', 24, -56.92, 7.61, 812.00, 6, 8621.00);
INSERT INTO public.farms VALUES (67, '2011-08-20 00:00:00', '75341613403', 35, -39.9, 109.59, 3.00, 13, 8755.00);
INSERT INTO public.farms VALUES (68, '1986-02-15 00:00:00', '83090447335', 73, -3.85, 8.93, 1519.00, 13, 17884.00);
INSERT INTO public.farms VALUES (69, '2009-07-02 00:00:00', '13531648642', 11, -60.12, 67.96, 180.00, 15, 3586.00);
INSERT INTO public.farms VALUES (70, '2004-11-07 00:00:00', '63553153086', 28, -36.45, -39.31, 698.00, 13, 12927.00);
INSERT INTO public.farms VALUES (71, '1971-11-24 00:00:00', '83090447335', 47, -78.03, 109.86, 1627.00, 9, 949.00);
INSERT INTO public.farms VALUES (72, '1996-04-22 00:00:00', '14095189739', 14, -66.11, 128.05, 1821.00, 17, 18255.00);
INSERT INTO public.farms VALUES (73, '1997-12-08 00:00:00', '86152020692', 14, 74.97, 157.18, 1965.00, 7, 1794.00);
INSERT INTO public.farms VALUES (74, '1982-11-19 00:00:00', '20700549211', 12, 8.12, -1.67, 1057.00, 14, 8056.00);
INSERT INTO public.farms VALUES (75, '2020-06-23 00:00:00', '47783337538', 75, 60.41, 94.98, 1111.00, 6, 18092.00);
INSERT INTO public.farms VALUES (76, '2016-12-09 00:00:00', '54053014136', 21, -81.68, 17.77, 516.00, 6, 10915.00);
INSERT INTO public.farms VALUES (77, '1985-08-14 00:00:00', '63553153086', 49, 54.57, 40.44, 1204.00, 5, 15043.00);
INSERT INTO public.farms VALUES (78, '2018-08-19 00:00:00', '22795221300', 63, 35.74, -30.9, 1107.00, 8, 5258.00);
INSERT INTO public.farms VALUES (79, '2001-06-02 00:00:00', '54053014136', 31, -14.15, 155.14, 1681.00, 12, 9601.00);
INSERT INTO public.farms VALUES (80, '2006-07-29 00:00:00', '96702621249', 29, -68.81, 3.83, 1155.00, 13, 3781.00);
INSERT INTO public.farms VALUES (81, '1989-10-17 00:00:00', '40152106929', 23, -76.3, -12.18, 1242.00, 7, 2298.00);
INSERT INTO public.farms VALUES (82, '2013-11-02 00:00:00', '29433372715', 34, -10.69, 78.54, 978.00, 7, 8010.00);
INSERT INTO public.farms VALUES (83, '1970-11-05 00:00:00', '92055203659', 32, -47.92, -102.25, 867.00, 3, 8967.00);
INSERT INTO public.farms VALUES (84, '2016-10-29 00:00:00', '90366643479', 22, -52.05, 1.11, 1507.00, 13, 16445.00);
INSERT INTO public.farms VALUES (85, '2014-10-06 00:00:00', '29433372715', 57, -54.97, 134.29, 1190.00, 14, 14453.00);
INSERT INTO public.farms VALUES (86, '2018-12-24 00:00:00', '20700549211', 47, -9.6, 104.47, 1250.00, 12, 960.00);
INSERT INTO public.farms VALUES (87, '2014-08-03 00:00:00', '36425537800', 68, -86.87, 108.69, 6.00, 14, 1406.00);
INSERT INTO public.farms VALUES (88, '1980-10-08 00:00:00', '95282728223', 38, -47.99, -117.98, 257.00, 4, 3273.00);
INSERT INTO public.farms VALUES (89, '1979-07-14 00:00:00', '90366643479', 22, 35.7, -167.5, 1621.00, 9, 9361.00);
INSERT INTO public.farms VALUES (90, '1989-09-11 00:00:00', '40152106929', 33, 65.57, -46.76, 1299.00, 11, 1021.00);
INSERT INTO public.farms VALUES (91, '1998-09-14 00:00:00', '29471955016', 36, 5.73, 143.61, 79.00, 9, 4934.00);
INSERT INTO public.farms VALUES (92, '1993-05-01 00:00:00', '83090447335', 64, 22.4, 81.85, 1472.00, 12, 12924.00);
INSERT INTO public.farms VALUES (93, '2015-03-15 00:00:00', '48661190166', 75, 18.5, 98.82, 1189.00, 5, 9617.00);
INSERT INTO public.farms VALUES (94, '2017-07-27 00:00:00', '89982265785', 59, 8.65, -58.88, 438.00, 4, 14143.00);
INSERT INTO public.farms VALUES (95, '2002-09-07 00:00:00', '37106016524', 50, -84.61, -41.08, 968.00, 8, 14449.00);
INSERT INTO public.farms VALUES (96, '1990-09-24 00:00:00', '78270111708', 4, 56.39, 163.73, 1159.00, 12, 10415.00);
INSERT INTO public.farms VALUES (97, '1997-12-20 00:00:00', '76615927303', 57, 21.95, 87.23, 1051.00, 6, 5482.00);
INSERT INTO public.farms VALUES (98, '2010-10-26 00:00:00', '80387273551', 5, -8.3, 161.36, 750.00, 10, 18840.00);
INSERT INTO public.farms VALUES (99, '1973-10-13 00:00:00', '23603329767', 63, -22.62, 93.04, 1802.00, 12, 3607.00);
INSERT INTO public.farms VALUES (100, '2005-11-11 00:00:00', '52332702854', 41, 66.23, 74.38, 1158.00, 12, 12978.00);
INSERT INTO public.farms VALUES (101, '2013-01-06 00:00:00', '83090447335', 5, -43.8, -153.09, 1666.00, 5, 4159.00);
INSERT INTO public.farms VALUES (102, '2002-04-07 00:00:00', '66504027620', 69, 87.98, -156.78, 84.00, 12, 3931.00);
INSERT INTO public.farms VALUES (103, '1985-05-21 00:00:00', '78270111708', 61, 69.72, -36.5, 1327.00, 5, 14636.00);
INSERT INTO public.farms VALUES (104, '1972-12-17 00:00:00', '40527213111', 47, -39.08, 112.05, 1014.00, 17, 16758.00);
INSERT INTO public.farms VALUES (105, '2013-05-26 00:00:00', '83090447335', 49, 8.88, 4.82, 804.00, 11, 16865.00);
INSERT INTO public.farms VALUES (106, '1987-05-15 00:00:00', '86152020692', 35, 68.57, -57.94, 703.00, 16, 5026.00);
INSERT INTO public.farms VALUES (107, '1990-01-09 00:00:00', '85400243518', 74, 80.56, -73.82, 379.00, 10, 14969.00);
INSERT INTO public.farms VALUES (108, '1980-04-15 00:00:00', '96584822073', 54, -12.47, 92.97, 244.00, 2, 15059.00);
INSERT INTO public.farms VALUES (109, '1989-09-13 00:00:00', '82029664067', 76, -0.63, -65.4, 765.00, 10, 5485.00);
INSERT INTO public.farms VALUES (110, '1976-02-11 00:00:00', '13661320700', 71, -55.1, -178.85, 289.00, 17, 3816.00);
INSERT INTO public.farms VALUES (111, '1975-09-12 00:00:00', '41887714070', 62, -16.21, -22.89, 1366.00, 16, 5675.00);
INSERT INTO public.farms VALUES (112, '1981-09-07 00:00:00', '48661190166', 17, 77.65, 95.9, 28.00, 15, 628.00);
INSERT INTO public.farms VALUES (113, '2017-06-15 00:00:00', '40152106929', 9, -18.34, -177.64, 176.00, 12, 6781.00);
INSERT INTO public.farms VALUES (114, '1982-07-31 00:00:00', '87853562125', 49, 76.78, 163.34, 1516.00, 4, 19751.00);
INSERT INTO public.farms VALUES (115, '2015-06-02 00:00:00', '20700549211', 55, 58.89, -11.85, 1900.00, 8, 329.00);
INSERT INTO public.farms VALUES (116, '2010-08-06 00:00:00', '49453113216', 65, -27.47, -79.05, 602.00, 10, 19425.00);
INSERT INTO public.farms VALUES (117, '1987-08-31 00:00:00', '29471955016', 57, 72.7, -85.4, 1000.00, 12, 19344.00);
INSERT INTO public.farms VALUES (118, '1995-02-27 00:00:00', '82029664067', 29, 37.88, 73.21, 679.00, 10, 5694.00);
INSERT INTO public.farms VALUES (119, '2020-04-28 00:00:00', '29471955016', 55, -76.63, 41.11, 1751.00, 6, 7497.00);
INSERT INTO public.farms VALUES (120, '2013-10-29 00:00:00', '86152020692', 6, 50.84, -58.96, 1222.00, 2, 9556.00);


--
-- TOC entry 3166 (class 0 OID 25282)
-- Dependencies: 208
-- Data for Name: farmcrop; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.farmcrop VALUES (34, 36, '2014-08-21', 1757.000);
INSERT INTO public.farmcrop VALUES (110, 47, '1975-05-31', 554.000);
INSERT INTO public.farmcrop VALUES (59, 34, '2020-02-02', 1741.000);
INSERT INTO public.farmcrop VALUES (106, 38, '1980-12-31', 1737.000);
INSERT INTO public.farmcrop VALUES (36, 6, '1998-06-23', 1170.000);
INSERT INTO public.farmcrop VALUES (117, 5, '1978-08-23', 1157.000);
INSERT INTO public.farmcrop VALUES (72, 50, '2014-08-07', 1452.000);
INSERT INTO public.farmcrop VALUES (33, 35, '2004-04-20', 583.000);
INSERT INTO public.farmcrop VALUES (84, 43, '1970-10-04', 1397.000);
INSERT INTO public.farmcrop VALUES (28, 11, '1987-12-04', 1845.000);
INSERT INTO public.farmcrop VALUES (116, 6, '1975-04-14', 155.000);
INSERT INTO public.farmcrop VALUES (75, 39, '2003-10-12', 1038.000);
INSERT INTO public.farmcrop VALUES (38, 25, '1990-08-27', 555.000);
INSERT INTO public.farmcrop VALUES (42, 36, '2019-04-20', 140.000);
INSERT INTO public.farmcrop VALUES (67, 8, '2017-07-16', 1048.000);
INSERT INTO public.farmcrop VALUES (14, 3, '2017-05-19', 1099.000);
INSERT INTO public.farmcrop VALUES (30, 42, '1979-03-10', 1055.000);
INSERT INTO public.farmcrop VALUES (41, 27, '1975-10-23', 1636.000);
INSERT INTO public.farmcrop VALUES (15, 41, '2001-11-23', 1665.000);
INSERT INTO public.farmcrop VALUES (16, 2, '1979-01-30', 176.000);
INSERT INTO public.farmcrop VALUES (47, 25, '1997-11-07', 1199.000);
INSERT INTO public.farmcrop VALUES (119, 39, '1984-04-29', 292.000);
INSERT INTO public.farmcrop VALUES (97, 36, '1984-05-10', 1523.000);
INSERT INTO public.farmcrop VALUES (119, 21, '1997-12-30', 1832.000);
INSERT INTO public.farmcrop VALUES (5, 34, '1978-11-25', 834.000);
INSERT INTO public.farmcrop VALUES (41, 34, '2015-10-26', 176.000);
INSERT INTO public.farmcrop VALUES (120, 31, '2007-02-21', 1187.000);
INSERT INTO public.farmcrop VALUES (80, 40, '1987-02-05', 1602.000);
INSERT INTO public.farmcrop VALUES (98, 11, '2017-04-04', 467.000);
INSERT INTO public.farmcrop VALUES (76, 18, '1987-05-08', 677.000);
INSERT INTO public.farmcrop VALUES (34, 32, '2002-12-16', 1100.000);
INSERT INTO public.farmcrop VALUES (6, 3, '2005-07-19', 724.000);
INSERT INTO public.farmcrop VALUES (117, 16, '1992-05-16', 1797.000);
INSERT INTO public.farmcrop VALUES (63, 47, '2020-05-11', 975.000);
INSERT INTO public.farmcrop VALUES (33, 25, '1993-07-26', 664.000);
INSERT INTO public.farmcrop VALUES (38, 50, '2002-07-27', 1630.000);
INSERT INTO public.farmcrop VALUES (113, 6, '1980-10-10', 1880.000);
INSERT INTO public.farmcrop VALUES (83, 42, '1993-02-10', 1143.000);
INSERT INTO public.farmcrop VALUES (58, 47, '1990-11-27', 597.000);
INSERT INTO public.farmcrop VALUES (37, 29, '2000-09-15', 1840.000);
INSERT INTO public.farmcrop VALUES (39, 50, '1996-01-05', 1344.000);
INSERT INTO public.farmcrop VALUES (101, 25, '1989-03-29', 1706.000);
INSERT INTO public.farmcrop VALUES (111, 12, '2013-07-17', 1687.000);
INSERT INTO public.farmcrop VALUES (18, 30, '2012-10-01', 903.000);
INSERT INTO public.farmcrop VALUES (101, 12, '2003-01-07', 31.000);
INSERT INTO public.farmcrop VALUES (2, 48, '2004-11-09', 1744.000);
INSERT INTO public.farmcrop VALUES (3, 6, '2004-10-08', 1756.000);
INSERT INTO public.farmcrop VALUES (13, 41, '2017-04-15', 1399.000);
INSERT INTO public.farmcrop VALUES (40, 45, '2008-02-15', 827.000);
INSERT INTO public.farmcrop VALUES (56, 37, '1998-01-20', 1810.000);
INSERT INTO public.farmcrop VALUES (59, 26, '1971-11-25', 1252.000);
INSERT INTO public.farmcrop VALUES (61, 36, '1981-03-04', 1907.000);
INSERT INTO public.farmcrop VALUES (87, 36, '1991-01-06', 1006.000);
INSERT INTO public.farmcrop VALUES (22, 40, '2002-02-17', 5.000);
INSERT INTO public.farmcrop VALUES (4, 23, '1971-07-04', 373.000);
INSERT INTO public.farmcrop VALUES (47, 46, '2017-01-01', 1231.000);
INSERT INTO public.farmcrop VALUES (71, 4, '2012-02-29', 415.000);
INSERT INTO public.farmcrop VALUES (107, 48, '1988-03-28', 1688.000);
INSERT INTO public.farmcrop VALUES (116, 35, '2013-08-03', 466.000);
INSERT INTO public.farmcrop VALUES (46, 51, '2008-04-29', 1377.000);
INSERT INTO public.farmcrop VALUES (118, 5, '2013-02-17', 1384.000);
INSERT INTO public.farmcrop VALUES (96, 22, '1997-10-01', 159.000);
INSERT INTO public.farmcrop VALUES (29, 10, '1995-07-18', 865.000);
INSERT INTO public.farmcrop VALUES (46, 5, '1987-08-10', 1051.000);
INSERT INTO public.farmcrop VALUES (118, 20, '1985-02-16', 1327.000);
INSERT INTO public.farmcrop VALUES (9, 11, '1970-08-19', 1242.000);
INSERT INTO public.farmcrop VALUES (59, 25, '2018-02-24', 1256.000);
INSERT INTO public.farmcrop VALUES (47, 42, '1978-11-25', 1856.000);
INSERT INTO public.farmcrop VALUES (105, 40, '2010-05-22', 1793.000);
INSERT INTO public.farmcrop VALUES (60, 27, '2015-02-25', 1640.000);
INSERT INTO public.farmcrop VALUES (110, 2, '1979-02-09', 422.000);
INSERT INTO public.farmcrop VALUES (68, 39, '1979-08-19', 363.000);
INSERT INTO public.farmcrop VALUES (86, 17, '1984-06-15', 1143.000);
INSERT INTO public.farmcrop VALUES (72, 7, '2006-05-19', 402.000);
INSERT INTO public.farmcrop VALUES (39, 25, '2018-01-23', 630.000);
INSERT INTO public.farmcrop VALUES (42, 45, '2008-12-27', 736.000);
INSERT INTO public.farmcrop VALUES (3, 17, '1972-10-21', 1138.000);
INSERT INTO public.farmcrop VALUES (28, 18, '1998-02-01', 797.000);
INSERT INTO public.farmcrop VALUES (102, 21, '2019-11-29', 960.000);
INSERT INTO public.farmcrop VALUES (100, 34, '1976-12-16', 419.000);
INSERT INTO public.farmcrop VALUES (26, 7, '2008-11-08', 884.000);
INSERT INTO public.farmcrop VALUES (55, 17, '1999-06-29', 790.000);


--
-- TOC entry 3171 (class 0 OID 25383)
-- Dependencies: 214
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO public.migrations VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO public.migrations VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);


--
-- TOC entry 3174 (class 0 OID 25402)
-- Dependencies: 217
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 209
-- Name: cooperatives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cooperatives_id_seq', 40, true);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 206
-- Name: crops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.crops_id_seq', 51, true);


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 218
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 204
-- Name: farms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.farms_id_seq', 120, true);


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 213
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 3, true);


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 202
-- Name: soiltypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.soiltypes_id_seq', 17, true);


-- Completed on 2021-01-03 19:45:46

--
-- PostgreSQL database dump complete
--

