function [name,places,transitions,arcs,sizeOfSpace,specification,regions] = examplePNSimpleCyclicClosedLoop()

    % Details of the simple cycle example
    name = 'Simple Cyclic Petri Net (Closed Loop)';
    
    % loading places using: Place(index, name, location, centroid)
    holdingTime = 0.2;
    place1 = Place(1, 'P1', [50, 70], [48, 77], holdingTime);  
    place2 = Place(2, 'P2', [20, 20], [10, 20], holdingTime);
    place3 = Place(3, 'P3', [80, 20], [85, 20], holdingTime);
    place4 = Place(4, 'Ps', [50, 90], [48, 97], holdingTime);  %% Newline
    
    % loading tokens using: Token(index,name,place)
    token1 = Token(1, 't1', place1); place1.addAToken(token1);
    token2 = Token(2, 't2', place1); place1.addAToken(token2);
    token3 = Token(3, 't3', place1); place1.addAToken(token3);
    token4 = Token(4, 'ts', place4); place4.addAToken(token4);  %% Newline
    places = [place1, place2, place3, place4]; % places and transitions will kee track of tokens %% Newline
    
    % loading transitions using: Transition(index,name,location,centroid,transitionTime,inputPlaces,outputPlaces)
    transitTime = 0.2;
    transition1 = Transition(1,'T1', [20, 50, 0], [10, 50], transitTime); %% Newline
    transition2 = Transition(2,'T2', [50, 30, pi/2], [48, 36], transitTime);
    transition3 = Transition(3,'T3', [50, 10, pi/2], [48, 4], transitTime);
    transition4 = Transition(4,'T4', [80, 50, 0], [85, 50], transitTime); %% Newline
    
    transitions = [transition1, transition2, transition3, transition4];
    
    
    % loading arcs using: Arc(index,isFromPlace,edges) 
    arc1 = Arc(1, 1, {place1, transition1});
    arc2 = Arc(2, 0, {transition1, place2});
    arc3 = Arc(3, 1, {place2, transition3});
    arc4 = Arc(4, 0, {transition3, place3});
    arc5 = Arc(5, 1, {place3, transition2});
    arc6 = Arc(6, 0, {transition2, place2});
    arc7 = Arc(7, 1, {place3, transition4});
    arc8 = Arc(8, 0, {transition4, place1});
    arc9 = Arc(9, 0, {transition4, place4},1);    %% Newline
    arc10 = Arc(10, 1, {place4, transition1},1);  %% Newline
    arcs = [arc1, arc2, arc3, arc4, arc5, arc6, arc7, arc8, arc9, arc10]; %% Newline
    
    
    % load inout and output places of transitions
    transitions = loadInputAndOutputPlaces(transitions,arcs);
    
    % SizeofSpace
    sizeOfSpace = [0,0,100,100];
    
    % Specification
    specification = 'Spec: P1+P2$\leq$ $1$';
    
    
    % load regions using: Region(index,name,isRect,coordinates,faceColor,lineWidth,edgeColor,centroid,fontSize,fontColor)
    faceColor = [0.5,0.5,0,0.1]; lineWidth = 1.5; edgeColor = 'k'; fontSize = 10; fontColor = 'k';
    R1 = Region(1,'Controller:',true,[35,80,30,20],faceColor,lineWidth,edgeColor,[18,90],fontSize,fontColor);
    
    regions = [R1];
    
    
end
