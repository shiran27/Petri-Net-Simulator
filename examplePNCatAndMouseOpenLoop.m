function [name,places,transitions,arcs,sizeOfSpace,specification,regions] = examplePNCatAndMouseOpenLoop()

    % Details of the simple cycle example
    name = 'Cat and Mouse Petri Net (Open Loop)';
    
    % loading places using: Place(index, name, location, centroid)
    holdingTime = 0.2;
    CR0 = Place(1, 'CR0', [130, 100], [135, 100], holdingTime);  
    CR1 = Place(2, 'CR1', [50, 125], [38, 125], holdingTime);  
    CR2 = Place(3, 'CR2', [130, 165], [135, 165], holdingTime);  
    CR3 = Place(4, 'CR3', [50, 75], [38, 75], holdingTime);  
    CR4 = Place(5, 'CR4', [130, 35], [135, 35], holdingTime);  
    
    MR0 = Place(6, 'MR0', [170, 100], [175, 100], holdingTime);  
    MR1 = Place(7, 'MR1', [50, 175], [38, 175], holdingTime);  
    MR2 = Place(8, 'MR2', [170, 185], [175, 185], holdingTime);  
    MR3 = Place(9, 'MR3', [50, 25], [38, 25], holdingTime);  
    MR4 = Place(10, 'MR4', [170, 15], [175, 15], holdingTime);  
    
    
    % loading tokens using: Token(index,name,place)
    catToken = Token(1, 'Cat', CR2); 
    CR2.addAToken(catToken);
    mouseToken = Token(2, 'Mouse', MR4); 
    MR4.addAToken(mouseToken);
    
    places = [CR0, CR1, CR2, CR3, CR4, MR0, MR1, MR2, MR3, MR4]; % places and transitions will kee track of tokens
    

    % loading transitions using: Transition(index,name,location,centroid,transitionTime,inputPlaces,outputPlaces)
    transitTime = 0.2;
    
    CT1 = Transition(1,'CT1', [100, 115, pi/2], [92, 111], transitTime);
    CT2 = Transition(2,'CT2', [100, 165, pi/2], [101, 161], transitTime);
    CT3 = Transition(3,'CT3', [130, 150, 0], [122, 148], transitTime);
    CT4 = Transition(4,'CT4', [100, 85, pi/2], [92, 89], transitTime);
    CT5 = Transition(5,'CT5', [100, 35, pi/2], [101, 39], transitTime);
    CT6 = Transition(6,'CT6', [130, 50, 0], [122, 52], transitTime);
    CT7 = Transition(7,'CT7', [30, 100, 0], [22, 98], transitTime);
    CT8 = Transition(8,'CT8', [70, 100, 0], [72, 102], transitTime);
 
    MT1 = Transition(9,'MT1', [170, 150, 0], [172, 152], transitTime);
    MT2 = Transition(10,'MT2', [100, 185, pi/2], [92, 189], transitTime);
    MT3 = Transition(11,'MT3', [100, 135, pi/2], [101, 139], transitTime);
    MT4 = Transition(12,'MT4', [170, 50, 0], [172, 48], transitTime);
    MT5 = Transition(13,'MT5', [100, 15, pi/2], [92, 11], transitTime);
    MT6 = Transition(14,'MT6', [100, 65, pi/2], [101, 61], transitTime);
    
    transitions = [CT1,CT2,CT3,CT4,CT5,CT6,CT7,CT8,MT1,MT2,MT3,MT4,MT5,MT6];
 
    
    % loading arcs using: Arc(index,isFromPlace,edges) 
    CA1 = Arc(1, 1, {CR0,CT1});
    CA2 = Arc(2, 0, {CT1,CR1});
    CA3 = Arc(3, 1, {CR1,CT2});
    CA4 = Arc(4, 0, {CT2,CR2});
    CA5 = Arc(5, 1, {CR2,CT3});
    CA6 = Arc(6, 0, {CT3,CR0});
    CA7 = Arc(7, 1, {CR0,CT4});
    CA8 = Arc(8, 0, {CT4,CR3});
    CA9 = Arc(9, 1, {CR3,CT5});
    CA10 = Arc(10, 0, {CT5,CR4});
    CA11 = Arc(11, 1, {CR4,CT6});
    CA12 = Arc(12, 0, {CT6,CR0});
    CA13 = Arc(13, 1, {CR1,CT7});
    CA14 = Arc(14, 0, {CT7,CR3});
    CA15 = Arc(15, 1, {CR3,CT8});
    CA16 = Arc(16, 0, {CT8,CR1});
        
    MA1 = Arc(17, 1, {MR0,MT1});
    MA2 = Arc(18, 0, {MT1,MR2});
    MA3 = Arc(19, 1, {MR2,MT2});
    MA4 = Arc(20, 0, {MT2,MR1});
    MA5 = Arc(21, 1, {MR1,MT3});
    MA6 = Arc(22, 0, {MT3,MR0});
    MA7 = Arc(23, 1, {MR0,MT4});
    MA8 = Arc(24, 0, {MT4,MR4});
    MA9 = Arc(25, 1, {MR4,MT5});
    MA10 = Arc(26, 0, {MT5,MR3});
    MA11 = Arc(27, 1, {MR3,MT6});
    MA12 = Arc(28, 0, {MT6,MR0});
    
    arcs = [CA1,CA2,CA3,CA4,CA5,CA6,CA7,CA8,CA9,CA10,CA11,CA12,CA13,CA14,CA15,CA16,...
        MA1,MA2,MA3,MA4,MA5,MA6,MA7,MA8,MA9,MA10,MA11,MA12];
    
    
    % load inout and output places of transitions
    transitions = loadInputAndOutputPlaces(transitions,arcs);
    
    % load track info
    [places,transitions,arcs] = loadTrackInfo(places,transitions,arcs,'CnM');
        
    
    % SizeofSpace
    sizeOfSpace = [0,0,200,200]; % [x0,y0,width,height]
    
    % Specification
    specification = 'Spec: CR$i$ + MR$i$ $\leq$ $1$, $i\in\{1,2,3,4,5\}$';
    
    % load regions using: Region(index,name,isRect,coordinates,faceColor,lineWidth,edgeColor,centroid,fontSize,fontColor)
    faceColor = [0.5,0.5,0.5,0.1]; lineWidth = 1.5; edgeColor = 'k'; fontSize = 15; fontColor = 'k';
    R1 = Region(1,'Room 0',true,[100,50,100,100],faceColor,lineWidth,edgeColor,[142,100],fontSize,fontColor);
    R2 = Region(2,'Room 1',true,[0,100,100,100],faceColor,lineWidth,edgeColor,[42,150],fontSize,fontColor); 
    R3 = Region(3,'Room 2',true,[100,150,100,50],faceColor,lineWidth,edgeColor,[142,175],fontSize,fontColor);
    R4 = Region(4,'Room 3',true,[0,0,100,100],faceColor,lineWidth,edgeColor,[42,50],fontSize,fontColor);
    R5 = Region(5,'Room 4',true,[100,0,100,50],faceColor,lineWidth,edgeColor,[142,25],fontSize,fontColor);
    
    regions = [R1,R2,R3,R4,R5];
    
end
