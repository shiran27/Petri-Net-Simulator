function [name,places,transitions,arcs,sizeOfSpace,specification,regions] = examplePNAGVOpenLoop()

    % Details of the simple cycle example
    name = 'Automated Guided Vehicle Petri Net (Open Loop)';
    
    %% loading places using: Place(index, name, location, centroid)
    holdingTime = 0.1;
    
    IPS1 = Place(1, 'IPS1', [30, 480], [NaN, NaN], holdingTime);
    IPS2 = Place(2, 'IPS2', [30, 460], [NaN, NaN], holdingTime);
    IPS3 = Place(3, 'IPS3', [30, 440], [NaN, NaN], holdingTime);
    IPS4 = Place(4, 'IPS4', [30, 420], [NaN, NaN], holdingTime);
    IPS5 = Place(5, 'IPS5', [70, 420], [NaN, NaN], holdingTime);
    IPS6 = Place(6, 'IPS6', [70, 440], [NaN, NaN], holdingTime);
    IPS7 = Place(7, 'IPS7', [70, 460], [NaN, NaN], holdingTime);
    IPS8 = Place(8, 'IPS8', [70, 480], [NaN, NaN], holdingTime);
    
    CPS1 = Place(9,  'CPS1', [230, 70], [NaN, NaN], holdingTime);
    CPS2 = Place(10, 'CPS2', [230, 30], [NaN, NaN], holdingTime);
    CPS3 = Place(11, 'CPS3', [270, 30], [NaN, NaN], holdingTime);
    CPS4 = Place(12, 'CPS4', [270, 70], [NaN, NaN], holdingTime);
    
    Z1S1 = Place(13, 'Z1S1', [150, 480], [NaN, NaN], holdingTime);
    Z1S2 = Place(14, 'Z1S2', [150, 460], [NaN, NaN], holdingTime);
    Z1S3 = Place(15, 'Z1S3', [180, 440], [NaN, NaN], holdingTime);
    Z1S4 = Place(16, 'Z1S4', [120, 420], [NaN, NaN], holdingTime);
    
    W1S1 = Place(17, 'W1S1', [10,230], [NaN,NaN], holdingTime);
    W1S2 = Place(18, 'W1S2', [40,150], [NaN,NaN], holdingTime);
    W1S3 = Place(19, 'W1S3', [40,190], [NaN,NaN], holdingTime);
    W1S4 = Place(20, 'W1S4', [60,210], [NaN,NaN], holdingTime);
    W1S5 = Place(21, 'W1S5', [60,250], [NaN,NaN], holdingTime);
    W1S6 = Place(22, 'W1S6', [20,250], [NaN,NaN], holdingTime);
    
    W2S1 = Place(23, 'W2S1', [290,470], [NaN,NaN], holdingTime);
    W2S2 = Place(24, 'W2S2', [250,400], [NaN,NaN], holdingTime);
    W2S3 = Place(25, 'W2S3', [290,330], [NaN,NaN], holdingTime);
    W2S4 = Place(26, 'W2S4', [290,400], [NaN,NaN], holdingTime);
    
    W3S1 = Place(27, 'W3S1', [290,250], [NaN,NaN], holdingTime);
    W3S2 = Place(28, 'W3S2', [250,190], [NaN,NaN], holdingTime);
    W3S3 = Place(29, 'W3S3', [290,150], [NaN,NaN], holdingTime);
    W3S4 = Place(30, 'W3S4', [290,190], [NaN,NaN], holdingTime);
    
    Z2S1 = Place(31, 'Z2S1', [120,330], [NaN,NaN], holdingTime);
    Z2S2 = Place(32, 'Z2S2', [150,310], [NaN,NaN], holdingTime);
    Z2S3 = Place(33, 'Z2S3', [180,330], [NaN,NaN], holdingTime);
    Z2S4 = Place(34, 'Z2S4', [150,350], [NaN,NaN], holdingTime);
    
    Z3S1 = Place(35, 'Z2S1', [120,230], [NaN,NaN], holdingTime);
    Z3S2 = Place(36, 'Z2S2', [120,210], [NaN,NaN], holdingTime);
    Z3S3 = Place(37, 'Z2S3', [180,250], [NaN,NaN], holdingTime);
    Z3S4 = Place(38, 'Z2S4', [180,270], [NaN,NaN], holdingTime);
    
    Z4S1 = Place(39, 'Z4S1', [120,130], [NaN,NaN], holdingTime);
    Z4S2 = Place(40, 'Z4S2', [120,110], [NaN,NaN], holdingTime);
    Z4S3 = Place(41, 'Z4S3', [180,150], [NaN,NaN], holdingTime);
    Z4S4 = Place(42, 'Z4S4', [180,170], [NaN,NaN], holdingTime);
    
    WZS1 = Place(43, 'WZS1', [90,350], [NaN,NaN], holdingTime);
    WZS2 = Place(44, 'WZS2', [90,310], [NaN,NaN], holdingTime);
    WZS3 = Place(45, 'WZS3', [90,250], [NaN,NaN], holdingTime);
    WZS4 = Place(46, 'WZS4', [90,210], [NaN,NaN], holdingTime);
    WZS5 = Place(47, 'WZS5', [90,150], [NaN,NaN], holdingTime);
    WZS6 = Place(48, 'WZS6', [90,110], [NaN,NaN], holdingTime);    
    WZS7 = Place(49, 'WZS7', [120,80], [NaN,NaN], holdingTime);
    WZS8 = Place(50, 'WZS8', [180,80], [NaN,NaN], holdingTime);
    
    WZS9  = Place(51, 'WZS9',  [220,130], [NaN,NaN], holdingTime);
    WZS10 = Place(52, 'WZS10', [220,170], [NaN,NaN], holdingTime);
    WZS11 = Place(53, 'WZS11', [220,230], [NaN,NaN], holdingTime);
    WZS12 = Place(54, 'WZS12', [220,270], [NaN,NaN], holdingTime);
    WZS13 = Place(55, 'WZS13', [220,310], [NaN,NaN], holdingTime);
    WZS14 = Place(56, 'WZS14', [220,350], [NaN,NaN], holdingTime);
    WZS15 = Place(57, 'WZS15', [220,460], [NaN,NaN], holdingTime);
    WZS16 = Place(58, 'WZS16', [220,480], [NaN,NaN], holdingTime);
    
    WZS17 = Place(59, 'WZS17', [120,390], [NaN,NaN], holdingTime);
    WZS18 = Place(60, 'WZS18', [180,390], [NaN,NaN], holdingTime);
    WZS19 = Place(61, 'WZS19', [120,290], [NaN,NaN], holdingTime);
    WZS20 = Place(62, 'WZS20', [180,290], [NaN,NaN], holdingTime);
    WZS21 = Place(63, 'WZS21', [120,190], [NaN,NaN], holdingTime);
    WZS22 = Place(64, 'WZS22', [180,190], [NaN,NaN], holdingTime);
    
    
    
    
    
    %% loading tokens using: Token(index,name,place)
    IPS1.addAToken(Token(1, 'P1', IPS1));
    IPS4.addAToken(Token(2, 'P2', IPS4));
    IPS8.addAToken(Token(3, 'P3', IPS8));
    
    CPS1.addAToken(Token(4, 'P4', CPS1));
    CPS4.addAToken(Token(5, 'P5', CPS4));
    
    W1S6.addAToken(Token(6, 'P6', W1S6));
    W1S4.addAToken(Token(7, 'P7', W1S4));
    
    W2S4.addAToken(Token(8, 'P8', W2S4));
    
    W3S3.addAToken(Token(9, 'P9', W3S3));
    
    Z2S2.addAToken(Token(10, 'P10', Z2S2));
    
    WZS4.addAToken(Token(11, 'P11', WZS4));
    WZS12.addAToken(Token(12, 'P12', WZS12));
    
    % places and transitions will kee track of tokens
    places = [IPS1,IPS2,IPS3,IPS4,IPS5,IPS6,IPS7,IPS8,CPS1,CPS2,CPS3,CPS4,...
        Z1S1,Z1S2,Z1S3,Z1S4,W1S1,W1S2,W1S3,W1S4,W1S5,W1S6,W2S1,W2S2,W2S3,W2S4,...
        W3S1,W3S2,W3S3,W3S4,Z2S1,Z2S2,Z2S3,Z2S4,Z3S1,Z3S2,Z3S3,Z3S4,Z4S1,Z4S2,Z4S3,Z4S4,...
        WZS1,WZS2,WZS3,WZS4,WZS5,WZS6,WZS7,WZS8,WZS9,WZS10,...
        WZS11,WZS12,WZS13,WZS14,WZS15,WZS16,WZS17,WZS18,WZS19,WZS20,WZS21,WZS22]; 
    

    %% loading transitions using: Transition(index,name,location,centroid,transitionTime,inputPlaces,outputPlaces)
    transitTime = 0.1;
    
    IPT1 = Transition(1,'IPT1', [10, 470, 0], [NaN, NaN], transitTime);
    IPT2 = Transition(2,'IPT2', [10, 430, 0], [NaN, NaN], transitTime);
    IPT3 = Transition(3,'IPT3', [50, 430, 0], [NaN, NaN], transitTime);
    IPT4 = Transition(4,'IPT4', [100, 420, pi/2], [NaN, NaN], transitTime);
    IPT5 = Transition(5,'IPT5', [100, 440, pi/2], [NaN, NaN], transitTime);
    IPT6 = Transition(6,'IPT6', [100, 460, pi/2], [NaN, NaN], transitTime);
    IPT7 = Transition(7,'IPT7', [100, 480, pi/2], [NaN, NaN], transitTime);
    IPT8 = Transition(8,'IPT8', [50, 470, 0], [NaN, NaN], transitTime);
    
    CPT1 = Transition(9, 'CPT1', [200, 70, pi/2], [NaN, NaN], transitTime);
    CPT2 = Transition(10,'CPT2', [200, 30, pi/2], [NaN, NaN], transitTime);
    CPT3 = Transition(11,'CPT3', [250, 50, 0], [NaN, NaN], transitTime);
    CPT4 = Transition(12,'CPT4', [290, 50, 0], [NaN, NaN], transitTime);
    
    W1T1 = Transition(13,'W1T1', [60, 330, 0], [NaN, NaN], transitTime);
    W1T2 = Transition(14,'W1T2', [60, 130, 0], [NaN, NaN], transitTime);
    W1T3 = Transition(15,'W1T3', [40, 180, 0], [NaN, NaN], transitTime);
    W1T4 = Transition(16,'W1T4', [40, 200, 0], [NaN, NaN], transitTime);
    W1T5 = Transition(17,'W1T5', [60, 230, 0], [NaN, NaN], transitTime);
        
    W2T1 = Transition(18,'W2T1', [250, 470, 0], [NaN, NaN], transitTime);
    W2T2 = Transition(19,'W2T2', [250, 330, 0], [NaN, NaN], transitTime);
    W2T3 = Transition(20,'W2T3', [290, 380, 0], [NaN, NaN], transitTime);
    W2T4 = Transition(21,'W2T4', [290, 420, 0], [NaN, NaN], transitTime);
    
    W3T1 = Transition(22,'W3T1', [250, 250, 0], [NaN, NaN], transitTime);
    W3T2 = Transition(23,'W3T2', [250, 150, 0], [NaN, NaN], transitTime);
    W3T3 = Transition(24,'W3T3', [290, 170, 0], [NaN, NaN], transitTime);
    W3T4 = Transition(25,'W3T4', [290, 210, 0], [NaN, NaN], transitTime);
    
    % Zones 1,2,3,4 does not have transitions
    
    WZT1 = Transition(26,'WZT1', [100,350,pi/2], [NaN, NaN], transitTime);
    WZT2 = Transition(27,'WZT2', [100,310,pi/2], [NaN, NaN], transitTime);
    WZT3 = Transition(28,'WZT3', [100,250,pi/2], [NaN, NaN], transitTime);
    WZT4 = Transition(29,'WZT4', [100,210,pi/2], [NaN, NaN], transitTime);
    WZT5 = Transition(30,'WZT5', [100,150,pi/2], [NaN, NaN], transitTime);
    WZT6 = Transition(31,'WZT6', [100,110,pi/2], [NaN, NaN], transitTime);    
    WZT7 = Transition(32,'WZT7', [120,100,0], [NaN, NaN], transitTime);
    WZT8 = Transition(33,'WZT8', [180,100,0], [NaN, NaN], transitTime);
    
    WZT9  = Transition(34,'WZT9',  [200,130,pi/2], [NaN, NaN], transitTime);
    WZT10 = Transition(35,'WZT10', [200,170,pi/2], [NaN, NaN], transitTime);
    WZT11 = Transition(36,'WZT11', [200,230,pi/2], [NaN, NaN], transitTime);
    WZT12 = Transition(37,'WZT12', [200,270,pi/2], [NaN, NaN], transitTime);
    WZT13 = Transition(38,'WZT13', [200,310,pi/2], [NaN, NaN], transitTime);
    WZT14 = Transition(39,'WZT14', [200,350,pi/2], [NaN, NaN], transitTime);
    WZT15 = Transition(40,'WZT15', [200,460,pi/2], [NaN, NaN], transitTime);
    WZT16 = Transition(41,'WZT16', [200,480,pi/2], [NaN, NaN], transitTime);
    
    WZT17 = Transition(42,'WZT17', [120,400,0], [NaN, NaN], transitTime);
    WZT18 = Transition(43,'WZT18', [120,380,0], [NaN, NaN], transitTime);
    WZT19 = Transition(44,'WZT19', [180,380,0], [NaN, NaN], transitTime);
    WZT20 = Transition(45,'WZT20', [180,400,0], [NaN, NaN], transitTime);    
    WZT21 = Transition(46,'WZT21', [120,300,0], [NaN, NaN], transitTime);
    WZT22 = Transition(47,'WZT22', [120,280,0], [NaN, NaN], transitTime);
    WZT23 = Transition(48,'WZT23', [180,280,0], [NaN, NaN], transitTime);
    WZT24 = Transition(49,'WZT24', [180,300,0], [NaN, NaN], transitTime);    
    WZT25 = Transition(50,'WZT25', [120,200,0], [NaN, NaN], transitTime);
    WZT26 = Transition(51,'WZT26', [120,180,0], [NaN, NaN], transitTime);
    WZT27 = Transition(52,'WZT27', [180,180,0], [NaN, NaN], transitTime);
    WZT28 = Transition(53,'WZT28', [180,200,0], [NaN, NaN], transitTime);
    
    
    transitions = [IPT1,IPT2,IPT3,IPT4,IPT5,IPT6,IPT7,IPT8,CPT1,CPT2,CPT3,CPT4,...
        W1T1,W1T2,W1T3,W1T4,W1T5,W2T1,W2T2,W2T3,W2T4,...
        W3T1,W3T2,W3T3,W3T4,WZT1,WZT2,WZT3,WZT4,WZT5,WZT6,WZT7,WZT8,WZT9,WZT10,...
        WZT11,WZT12,WZT13,WZT14,WZT15,WZT16,WZT17,WZT18,WZT19,WZT20,WZT21,WZT22,...
        WZT23,WZT24,WZT25,WZT26,WZT27,WZT28]; 
    
 
    
    
    
    %% loading arcs using: Arc(index,isFromPlace,edges) 
    IPA1 = Arc(1, 0, {IPT1,IPS1});
    IPA2 = Arc(2, 1, {IPS1,IPT8});
    IPA3 = Arc(3, 0, {IPT8,IPS2});
    IPA4 = Arc(4, 1, {IPS2,IPT1});    
    IPA5 = Arc(5, 0, {IPT2,IPS3});
    IPA6 = Arc(6, 1, {IPS3,IPT3});
    IPA7 = Arc(7, 0, {IPT3,IPS4});
    IPA8 = Arc(8, 1, {IPS4,IPT2});
    IPA9  = Arc(9,  0, {IPT3,IPS5});
    IPA10 = Arc(10, 1, {IPS5,IPT4});
    IPA11 = Arc(11, 0, {IPT5,IPS6});
    IPA12 = Arc(12, 1, {IPS6,IPT3});    
    IPA13 = Arc(13, 0, {IPT8,IPS7});
    IPA14 = Arc(14, 1, {IPS7,IPT6});
    IPA15 = Arc(15, 0, {IPT7,IPS8});
    IPA16 = Arc(16, 1, {IPS8,IPT8});
   
    CPA1 = Arc(17, 1, {CPS1,CPT1});
    CPA2 = Arc(18, 0, {CPT2,CPS2});
    CPA3 = Arc(19, 1, {CPS2,CPT3});
    CPA4 = Arc(20, 0, {CPT3,CPS1});
    CPA5 = Arc(21, 0, {CPT3,CPS4});
    CPA6 = Arc(22, 1, {CPS4,CPT4});
    CPA7 = Arc(23, 0, {CPT4,CPS3});
    CPA8 = Arc(24, 1, {CPS3,CPT3});
    
    Z1A1 = Arc(25, 0, {WZT16,Z1S1});
    Z1A2 = Arc(26, 1, {Z1S1,IPT7});
    Z1A3 = Arc(27, 0, {IPT6,Z1S2});
    Z1A4 = Arc(28, 1, {Z1S2,WZT15});   
    Z1A5 = Arc(29, 0, {WZT20,Z1S3});
    Z1A6 = Arc(30, 1, {Z1S3,IPT5});
    Z1A7 = Arc(31, 0, {IPT4,Z1S4});
    Z1A8 = Arc(32, 1, {Z1S4,WZT17});
    
    
    W1A1 = Arc(33, 1, {W1S1,W1T1},0,[10,40;380,380]);
    W1A2 = Arc(34, 0, {W1T1,W1S6});
    W1A3 = Arc(35, 1, {W1S6,W1T4});
    W1A4 = Arc(36, 0, {W1T4,W1S3});
    W1A5 = Arc(37, 1, {W1S3,W1T3});
    W1A6 = Arc(38, 0, {W1T3,W1S2});
    W1A7 = Arc(39, 1, {W1S2,W1T2});
    W1A8 = Arc(40, 0, {W1T2,W1S1},0,[50,10;110,110]);
    W1A9 = Arc(41, 0, {W1T2,W1S5},0,[60,70,70,60;110,110,270,270]);
    W1A10 = Arc(42, 1, {W1S5,W1T5});
    W1A11 = Arc(43, 0, {W1T5,W1S4});
    W1A12 = Arc(44, 1, {W1S4,W1T4});
    
    W2A1 = Arc(45, 0, {W2T1,W2S1},0,[250,290;480,480]);
    W2A2 = Arc(46, 1, {W2S1,W2T4});
    W2A3 = Arc(47, 0, {W2T4,W2S4});
    W2A4 = Arc(48, 1, {W2S4,W2T3});
    W2A5 = Arc(49, 0, {W2T3,W2S3});
    W2A6 = Arc(50, 1, {W2S3,W2T2},0,[290,250;310,310]);
    W2A7 = Arc(51, 0, {W2T2,W2S2});
    W2A8 = Arc(52, 1, {W2S2,W2T1});
    
    W3A1 = Arc(53, 0, {W3T1,W3S1},0,[250,290;270,270]);
    W3A2 = Arc(54, 1, {W3S1,W3T4});
    W3A3 = Arc(55, 0, {W3T4,W3S4});
    W3A4 = Arc(56, 1, {W3S4,W3T3});
    W3A5 = Arc(57, 0, {W3T3,W3S3});
    W3A6 = Arc(58, 1, {W3S3,W3T2},0,[290,250;130,130]);
    W3A7 = Arc(59, 0, {W3T2,W3S2});
    W3A8 = Arc(60, 1, {W3S2,W3T1});
    
    Z2A1 = Arc(61, 0, {WZT18,Z2S1 });
    Z2A2 = Arc(62, 1, {Z2S1 ,WZT21});
    Z2A3 = Arc(63, 0, {WZT14,Z2S4 });
    Z2A4 = Arc(64, 1, {Z2S4 ,WZT1 });
    Z2A5 = Arc(65, 0, {WZT2 ,Z2S2 });
    Z2A6 = Arc(66, 1, {Z2S2 ,WZT13});
    Z2A7 = Arc(67, 0, {WZT24,Z2S3 });
    Z2A8 = Arc(68, 1, {Z2S3 ,WZT19});
    
    Z3A1 = Arc(69, 0, {WZT22,Z3S1 });
    Z3A2 = Arc(70, 1, {Z3S1 ,WZT11});
    Z3A3 = Arc(71, 0, {WZT4 ,Z3S2 });
    Z3A4 = Arc(72, 1, {Z3S2 ,WZT25});
    Z3A5 = Arc(73, 0, {WZT28 ,Z3S3 });
    Z3A6 = Arc(74, 1, {Z3S3 ,WZT3 });
    Z3A7 = Arc(75, 0, {WZT12 ,Z3S4 });
    Z3A8 = Arc(76, 1, {Z3S4 ,WZT23});
    
    Z4A1 = Arc(77, 0, {WZT26,Z4S1 });
    Z4A2 = Arc(78, 1, {Z4S1 ,WZT9});
    Z4A3 = Arc(79, 0, {WZT6 ,Z4S2 });
    Z4A4 = Arc(80, 1, {Z4S2 ,WZT7});
    Z4A5 = Arc(81, 0, {WZT8,Z4S3 });
    Z4A6 = Arc(82, 1, {Z4S3 ,WZT5 });
    Z4A7 = Arc(83, 0, {WZT10 ,Z4S4 });
    Z4A8 = Arc(84, 1, {Z4S4 ,WZT27});
    
        
    WZA1 = Arc(85, 0, {WZT1 ,WZS1 });
    WZA2 = Arc(86, 1, {WZS1 ,W1T1 });
    WZA3 = Arc(87, 0, {W1T1 ,WZS2 });
    WZA4 = Arc(88, 1, {WZS2 ,WZT2 });    
    WZA5 = Arc(89, 0, {WZT3 ,WZS3 });
    WZA6 = Arc(90, 1, {WZS3 ,W1T5 });
    WZA7 = Arc(91, 0, {W1T5 ,WZS4 });
    WZA8 = Arc(92, 1, {WZS4 ,WZT4 });    
    WZA9 = Arc(93, 0, {WZT5 ,WZS5 });
    WZA10= Arc(94, 1, {WZS5 ,W1T2 });
    WZA11= Arc(95, 0, {W1T2 ,WZS6 });
    WZA12= Arc(96, 1, {WZS6 ,WZT6 });   
    WZA13 = Arc(97,  0, {WZT7 ,WZS7 });
    WZA14 = Arc(98,  1, {WZS7 ,CPT2 });
    WZA15 = Arc(99,  0, {CPT1 ,WZS8 });
    WZA16 = Arc(100, 1, {WZS8 ,WZT8 });
    
    WZA17 = Arc(101, 0, {WZT9 ,WZS9 });
    WZA18 = Arc(102, 1, {WZS9 ,W3T2 });
    WZA19 = Arc(103, 0, {W3T2 ,WZS10});
    WZA20 = Arc(104, 1, {WZS10,WZT10});    
    WZA21 = Arc(105, 0, {WZT11,WZS11 });
    WZA22 = Arc(106, 1, {WZS11,W3T1 });
    WZA23 = Arc(107, 0, {W3T1 ,WZS12});
    WZA24 = Arc(108, 1, {WZS12,WZT12});    
    WZA25 = Arc(109, 0, {WZT13,WZS13 });
    WZA26 = Arc(110, 1, {WZS13,W2T2 });
    WZA27 = Arc(111, 0, {W2T2 ,WZS14});
    WZA28 = Arc(112, 1, {WZS14,WZT14});    
    WZA29 = Arc(113, 0, {WZT15,WZS15 });
    WZA30 = Arc(114, 1, {WZS15,W2T1 });
    WZA31 = Arc(115, 0, {W2T1 ,WZS16});
    WZA32 = Arc(116, 1, {WZS16,WZT16});
    
    WZA33 = Arc(117, 0, {WZT17,WZS17});
    WZA34 = Arc(118, 1, {WZS17,WZT18});
    WZA35 = Arc(119, 0, {WZT19,WZS18});
    WZA36 = Arc(120, 1, {WZS18,WZT20});    
    WZA37 = Arc(121, 0, {WZT21,WZS19});
    WZA38 = Arc(122, 1, {WZS19,WZT22});
    WZA39 = Arc(123, 0, {WZT23,WZS20});
    WZA40 = Arc(124, 1, {WZS20,WZT24});    
    WZA41 = Arc(125, 0, {WZT25,WZS21});
    WZA42 = Arc(126, 1, {WZS21,WZT26});
    WZA43 = Arc(127, 0, {WZT27,WZS22});
    WZA44 = Arc(128, 1, {WZS22,WZT28});
    
    
    arcs = [IPA1,IPA2,IPA3,IPA4,IPA5,IPA6,IPA7,IPA8,IPA9,IPA10,...
        IPA11,IPA12,IPA13,IPA14,IPA15,IPA16,CPA1,CPA2,CPA3,CPA4,CPA5,CPA6,CPA7,CPA8,...
        Z1A1,Z1A2,Z1A3,Z1A4,Z1A5,Z1A6,Z1A7,Z1A8,...
        W1A1,W1A2,W1A3,W1A4,W1A5,W1A6,W1A7,W1A8,W1A9,W1A10,W1A11,W1A12,...
        W2A1,W2A2,W2A3,W2A4,W2A5,W2A6,W2A7,W2A8,W3A1,W3A2,W3A3,W3A4,W3A5,W3A6,W3A7,W3A8,...
        Z2A1,Z2A2,Z2A3,Z2A4,Z2A5,Z2A6,Z2A7,Z2A8,Z3A1,Z3A2,Z3A3,Z3A4,Z3A5,Z3A6,Z3A7,Z3A8,...
        Z4A1,Z4A2,Z4A3,Z4A4,Z4A5,Z4A6,Z4A7,Z4A8,....
        WZA1,WZA2,WZA3,WZA4,WZA5,WZA6,WZA7,WZA8,WZA9,WZA10,...
        WZA11,WZA12,WZA13,WZA14,WZA15,WZA16,WZA17,WZA18,WZA19,WZA20,...
        WZA21,WZA22,WZA23,WZA24,WZA25,WZA26,WZA27,WZA28,WZA29,WZA30,...
        WZA31,WZA32,WZA33,WZA34,WZA35,WZA36,WZA37,WZA38,WZA39,WZA40,...
        WZA41,WZA42,WZA43,WZA44]; 
    
    %% Remaining things:
    % load inout and output places of transitions
    transitions = loadInputAndOutputPlaces(transitions,arcs);
    
    % load track info
    [places,transitions,arcs] = loadTrackInfo(places,transitions,arcs,'AGV');
    
    % SizeofSpace
    sizeOfSpace = [0,0,300,500]; % [x0,y0,width,height]
    
    % Specification
    specification = 'Spec: $Z1 \leq 1 \land Z2 \leq 1 \land Z3 \leq 1 \land Z4 \leq 1$';
    
    
    %% load regions using: Region(index,name,isRect,coordinates,faceColor,lineWidth,edgeColor,centroid,fontSize,fontColor)
    faceColor = [0.5,0.5,0.5,0.1]; lineWidth = 1.5; edgeColor = 'k'; fontSize = 10; fontColor = 'k';
    R1 = Region(1,'Input Part Stations',true,[0,400,80,100],faceColor,lineWidth,edgeColor,[5,490],fontSize,fontColor);
    R2 = Region(2,'Completed Parts Station',true,[200,0,100,100],faceColor,lineWidth,edgeColor,[205,90],fontSize,fontColor);
    R3 = Region(3,'Zone 1',true,[100,400,100,100],faceColor,lineWidth,edgeColor,[135,490],fontSize,fontColor);
    R4 = Region(4,'Workstation 1',true,[0,100,80,300],faceColor,lineWidth,edgeColor,[15,390],fontSize,fontColor);
    R5 = Region(5,'Workstation 2',true,[240,300,60,200],faceColor,lineWidth,edgeColor,[245,490],fontSize,fontColor);
    R6 = Region(6,'Workstation 3',true,[240,100,60,200],faceColor,lineWidth,edgeColor,[245,290],fontSize,fontColor);
    R7 = Region(7,'Zone 2',true,[100,300,100,80],faceColor,lineWidth,edgeColor,[135,370],fontSize,fontColor);
    R8 = Region(8,'Zone 3',true,[100,200,100,80],faceColor,lineWidth,edgeColor,[135,270],fontSize,fontColor);
    R9 = Region(9,'Zone 4',true,[100,100,100,80],faceColor,lineWidth,edgeColor,[135,170],fontSize,fontColor);
    coordinates = [0,0,200,200,100,100,200,200,100,100,200,200,100,100,200,200,240,240,200,200,100,100,80,80;...
        100,0,0,100,100,380,380,300,300,280,280,200,200,180,180,100,100,500,500,400,400,500,500,100];
    R10 = Region(10,'A Manufacturing Facility with Five AGVs',false,coordinates,faceColor,lineWidth,edgeColor,[10,10],12,'k'); 
    
    regions = [R1,R2,R3,R4,R5,R6,R7,R8,R9,R10];
    
    
    
    
   
    
end
