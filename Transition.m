classdef Transition < handle
    %TRANSITION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        index
        name
        location       % For graphical purposes, location now contains orientation!
        centroid       % where to print the name label
        graphicHandles
        graphicHandles2
        transitionWidth
        transitTime % transitionTime
        
        inputPlaces    % indexes of places that are inputs
        outputPlaces   % indexes of places that are outputs
        
        inTransit      % the transition is currently active
        tokens         % tokens being transferred (tokens being temporarily holding)
        eventTime      % when the last transition event was triggered
        triggerCount
        
        trackInfo     % number, direction, a color
    end
    
    methods
        
        function obj = Transition(index,name,location,centroid,transitTime)
            %TRANSITION Construct an instance of this class
            %   Detailed explanation goes here
            obj.index = index;
            obj.name = name;
            obj.location = location;
            obj.centroid = centroid;
            obj.transitionWidth = 8;
            obj.transitTime = transitTime;
            
            obj.inTransit = false;
            obj.tokens = [];
            obj.eventTime = 0;
            obj.triggerCount = 0;
            
            obj.trackInfo.index = [];
            obj.trackInfo.name = '';
            
        end
        
        
        function outputArg = update(obj,petriNet,timeVal)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            
            if obj.inTransit && timeVal < (obj.eventTime+obj.transitTime)
                % currently in transit, but not complete
                return
            elseif obj.inTransit 
                % Transition is complete! Distribute the collected tokens
                for j = obj.outputPlaces
                    if ~isempty(obj.tokens)
                        tokenToAdd = obj.tokens(1);
                        tokenToAdd.eventTime = timeVal; % added token will have a time stamp of added time
                        obj.tokens(1) = [];
                    else
                        % create a new token
                        tokenToAdd = Token(obj,timeVal); % added token will have a time stamp of added time
                    end
                    petriNet.places(j).addAToken(tokenToAdd);
                    obj.inTransit = false;
                    obj.eventTime = -1;
                    obj.triggerCount = obj.triggerCount + 1;
                end
                obj.tokens = []; 
            else
                % see whether ready to fire
                readyToFire = true;
                for i = obj.inputPlaces
                    if isempty(petriNet.places(i).tokens)
                        readyToFire = false;
                        break
                    else
                        latestArrivalTime = petriNet.places(i).tokens(1).eventTime;
                        holdingTime = petriNet.places(i).holdingTime;
                        if timeVal < latestArrivalTime + holdingTime  % holdingtime is incomplete
                            readyToFire = false;
                            break
                        end
                    end
                end
                
                % collect tokens if ready to fire
                if readyToFire
                    for i = obj.inputPlaces
                        tokenCollected = petriNet.places(i).removeAToken(obj);
                        obj.tokens = [obj.tokens, tokenCollected];
                    end
                    
                    if isempty(obj.inputPlaces) % to handle input transitions
                        tokenCreated = Token(obj,timeVal);
                        tokenCreated.removed(obj);
                        obj.tokens = [tokenCreated];
                    end    % End: to handle input transitions
                    
                    obj.inTransit = true;
                    obj.eventTime = timeVal;
                end
                
            end           
        end
        
        
        function outputArg = draw(obj)
            X0 = obj.location(1:2);
            theta = obj.location(3);
            X1 = X0 + 0.5*obj.transitionWidth*[cos(theta), sin(theta)];
            X2 = X0 - 0.5*obj.transitionWidth*[cos(theta), sin(theta)];
            thickness = 4;
            plot([X1(1),X2(1)],[X1(2),X2(2)],'-b','LineWidth',thickness);
%             text(obj.centroid(1),obj.centroid(2),obj.name,'Color','b','FontSize',10);
        end
        
        
        function outputArg = drawTokens(obj,timeValue)
            
            if timeValue~=0 && ~isempty(obj.graphicHandles)
                delete(obj.graphicHandles(1));
                obj.graphicHandles(1) = [];
            end
                
            if ~isempty(obj.tokens)
                X0 = obj.location(1:2);
                theta = obj.location(3);
                X1 = X0 + 0.5*obj.transitionWidth*[cos(theta), sin(theta)];
                X2 = X0 - 0.5*obj.transitionWidth*[cos(theta), sin(theta)];
                thickness = 4;
                r = plot([X1(1),X2(1)],[X1(2),X2(2)],'-r','LineWidth',thickness);
                obj.graphicHandles(1) = r;
            end
                
        end
        
        
        function outputArg = drawTokenImageCnM(obj,cat,catAlpha,mouse,mouseAlpha)
             
            if ~isempty(obj.graphicHandles2)
                delete(obj.graphicHandles2(1));
                obj.graphicHandles2 = [];
            end
            
            
            if isempty(obj.tokens)
                return
            end
                        
            for i = 1:1:length(obj.tokens)
                if isequal(obj.tokens(i).name,'Cat')
                    catSize = 8;
%                     [cat, ~, catAlpha] = imread('cat.png');
                    obj.graphicHandles2(1) = image(flipud(cat),'AlphaData', flipud(catAlpha), 'XData',[obj.location(1)-catSize,obj.location(1)+catSize],...
                        'YData',[obj.location(2)-catSize,obj.location(2)+catSize]);
                end
                if isequal(obj.tokens(i).name,'Mouse')
                    mouseSize = 5;
%                     [mouse, ~, mouseAlpha] = imread('mouse.png');
                    obj.graphicHandles2(1) = image(flipud(mouse),'AlphaData', flipud(mouseAlpha), 'XData',[obj.location(1)-mouseSize,obj.location(1)+mouseSize],...
                        'YData',[obj.location(2)-mouseSize,obj.location(2)+mouseSize]);
                end
            end
            
        end
        
        function outputArg = drawTokenImageAGV(obj,forklift,forkliftAlpha)
           
            
            if ~isempty(obj.graphicHandles2)
                delete(obj.graphicHandles2(1));
                obj.graphicHandles2 = [];
            end
            
            
            if isempty(obj.tokens) || isempty(obj.trackInfo.index)
                return
            end
            
            
            forkliftSize = 9;
            if rem(obj.trackInfo.index,2)==1 % right
                forklift = fliplr(forklift);
                forkliftAlpha = fliplr(forkliftAlpha);
            end
            obj.graphicHandles2(1) = image(flipud(forklift),'AlphaData', flipud(forkliftAlpha), 'XData',[obj.location(1)-forkliftSize,obj.location(1)+forkliftSize],...
                        'YData',[obj.location(2)-forkliftSize+2,obj.location(2)+forkliftSize+2]);
            
        end
        
        
    end
end

