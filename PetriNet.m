classdef PetriNet
    %PETRINET Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        index
        name
        places = []
        transitions = []
        arcs = []
        specification  
        regions = []
    end
    
    methods
        
        function obj = PetriNet(index,name,places,transitions,arcs,specification,regions)
            %PETRINET Construct an instance of this class
            %   Detailed explanation goes here
            obj.index = index;
            obj.name = name;
            obj.places = places;
            obj.transitions = transitions;
            obj.arcs = arcs;
            obj.specification = specification;
            obj.regions = regions;
        end
        
        function outputArg = update(obj,timeVal)
            randPermIndArray = randperm(length(obj.transitions));
            for i = randPermIndArray 
                 obj.transitions(i).update(obj,timeVal);
            end
        end
        
        
        function outputArg = draw(obj, figNum, sizeOfSpace)
            %sizeOfSpace = [x0,y0,width,height]
            f = figure(figNum);
            f.Position = [700, 0, 5*sizeOfSpace(3), 5*sizeOfSpace(4)];
            axis([sizeOfSpace(1), sizeOfSpace(1)+sizeOfSpace(3), sizeOfSpace(2), sizeOfSpace(2)+sizeOfSpace(4)]);
            axis equal
            hold on
            
%             grid on
            
            % draw places
            for i=1:1:length(obj.places)
                obj.places(i).draw();
            end
            
            % traw transitions
            for i=1:1:length(obj.transitions)
                obj.transitions(i).draw();
            end
            
            % draw arcs
            for i=1:1:length(obj.arcs)
                obj.arcs(i).draw();
            end
            
            % draw regions
            for i=1:1:length(obj.regions)
                obj.regions(i).draw();
            end

            
            
            % draw tokens - taken careof when drawing places and transitions
                
            
            
            set(gca,'xtick',[], 'xticklabel',[])
            set(gca,'ytick',[], 'yticklabel',[])
            set(gca,'XColor', 'none', 'YColor', 'none')
        

            axis equal
            axis([sizeOfSpace(1), sizeOfSpace(1)+sizeOfSpace(3), sizeOfSpace(2), sizeOfSpace(2)+sizeOfSpace(4)]);
        end
        
        
        function outputArg = drawMarking(obj,figNum,timeValue)
            % draw tokens in places
            figure(figNum)
            for i=1:1:length(obj.places)
                obj.places(i).drawTokens(timeValue);
            end
            
            % traw tokens in transitions
            for i=1:1:length(obj.transitions)
                obj.transitions(i).drawTokens(timeValue);
            end
            
            
            % For the cat and mouse case we need the following
            st5 = 'Cat and Mouse Petri Net (Open Loop)';
            st6 = 'Cat and Mouse Petri Net (Closed Loop)';
            st7 = 'Automated Guided Vehicle Petri Net (Open Loop)';
            st8 = 'Automated Guided Vehicle Petri Net (Closed Loop)';
            
            if isequal(obj.name,st5) || isequal(obj.name,st6)
                [cat, ~, catAlpha] = imread('cat.png');
                [mouse, ~, mouseAlpha] = imread('mouse.png');
                for i=1:1:length(obj.places)
                    obj.places(i).drawTokenImageCnM(cat,catAlpha,mouse,mouseAlpha);
                end
                for i=1:1:length(obj.transitions)
                    obj.transitions(i).drawTokenImageCnM(cat,catAlpha,mouse,mouseAlpha);
                end
            elseif isequal(obj.name,st7) || isequal(obj.name,st8)
                [forklift, ~, forkliftAlpha] = imread('forklift.png');
                for i=1:1:length(obj.places)
                    obj.places(i).drawTokenImageAGV(forklift,forkliftAlpha);
                end

                for i=1:1:length(obj.transitions)
                    obj.transitions(i).drawTokenImageAGV(forklift,forkliftAlpha);
                end
            end
            
        end
        
        function [namePArray,numOfTokensPArray,nameTArray,numOfTokensTArray] = getMarking(obj)
            namePArray = {};
            numOfTokensPArray = [];
            for i = 1:1:length(obj.places)
                numOfTokensPArray = [numOfTokensPArray, length(obj.places(i).tokens)];
                namePArray{i} = obj.places(i).name;
            end
            nameTArray = {};
            numOfTokensTArray = [];
            for i = 1:1:length(obj.transitions)
                numOfTokensTArray = [numOfTokensTArray, length(obj.transitions(i).tokens)];
                nameTArray{i} = obj.transitions(i).name;
            end
        end
        
        function colorVal = checkSpec(obj)
            st1 = 'Simple Cyclic Petri Net (Open Loop)';
            st2 = 'Simple Cyclic Petri Net (Closed Loop)';
            st3 = 'Simple Non-Cyclic Petri Net (Open Loop)';
            st4 = 'Simple Non-Cyclic Petri Net (Closed Loop)';
            st5 = 'Cat and Mouse Petri Net (Open Loop)';
            st6 = 'Cat and Mouse Petri Net (Closed Loop)';
            st7 = 'Automated Guided Vehicle Petri Net (Open Loop)';
            st8 = 'Automated Guided Vehicle Petri Net (Closed Loop)';
            
            
            if isequal(obj.name,st1) || isequal(obj.name,st2) || isequal(obj.name,st3) || isequal(obj.name,st4) 
                if (length(obj.places(2).tokens) + length(obj.places(3).tokens)) <= 1
                    colorVal = [0 0.5 0];
                else
                    colorVal = 'r';
                end
            elseif isequal(obj.name,st5) || isequal(obj.name,st6)
                sum1 = length(obj.places(1).tokens) + length(obj.places(6).tokens);
                sum2 = length(obj.places(2).tokens) + length(obj.places(7).tokens);
                sum3 = length(obj.places(3).tokens) + length(obj.places(8).tokens);
                sum4 = length(obj.places(4).tokens) + length(obj.places(9).tokens);
                sum5 = length(obj.places(5).tokens) + length(obj.places(10).tokens);
                if sum1 <= 1 && sum2 <= 1 && sum3 <= 1 && sum4 <= 1 && sum5 <= 1 
                     colorVal = [0 0.5 0];
                else
                    colorVal = 'r';
%                     pause(0.5)
                end
            elseif isequal(obj.name,st7) || isequal(obj.name,st8)
                sum1 = length(obj.places(13).tokens) + length(obj.places(14).tokens) + length(obj.places(15).tokens) + length(obj.places(16).tokens);
                sum2 = length(obj.places(31).tokens) + length(obj.places(32).tokens) + length(obj.places(33).tokens) + length(obj.places(34).tokens);
                sum3 = length(obj.places(35).tokens) + length(obj.places(36).tokens) + length(obj.places(37).tokens) + length(obj.places(38).tokens);
                sum4 = length(obj.places(39).tokens) + length(obj.places(40).tokens) + length(obj.places(41).tokens) + length(obj.places(42).tokens);
                if sum1 <= 1 && sum2 <= 1 && sum3 <= 1 && sum4 <= 1 
                     colorVal = [0 0.5 0];
                else
                    colorVal = 'r';
%                     pause(0.5)
                end
            end
        end
        
        function count = getAGVLocations(obj)
            count = 0;
            for i = 1:1:length(obj.transitions)
                for j = 1:1:length(obj.transitions(i).tokens)
                    if length(obj.transitions(i).tokens(j).name)==4
                        if isequal(obj.transitions(i).tokens(j).name(1:3),'AGV')
%                             disp(['Found: ',obj.transitions(i).tokens(j).name]);
                            count = count+1;
                        end
                    end
                end
            end
            
            for i = 1:1:length(obj.places)
                for j = 1:1:length(obj.places(i).tokens)
                    if length(obj.places(i).tokens(j).name)==4
                        if isequal(obj.places(i).tokens(j).name(1:3),'AGV')
%                             disp(['Found: ',obj.places(i).tokens(j).name]);
                            count = count+1;
                        end
                    end
                end
            end
        end
        
        
    end
end

