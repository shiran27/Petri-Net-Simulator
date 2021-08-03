classdef Place < handle
    %PLACE Summary of this class goes here
    %   This is the class that represents "places" in Petri-Nets 
    
    properties
        index
        name
        location      % location for graphical purposes
        centroid      % where to place the name
        radius
        graphicHandles
        graphicHandles2
        
        holdingTime   % minimum time that each token should spend in the place
        tokens        % array of tokens inside the position
        
        trackInfo     % number, direction, a color
    end
    
    methods
        
        function obj = Place(index, name, location, centroid, holdingTime)
            %PLACE Construct an instance of this class
            %   Detailed explanation goes here
            obj.index = index;
            obj.name = name;
            obj.centroid = centroid;
            obj.radius = 4;
            obj.location = location;
            obj.holdingTime = holdingTime;
            
            obj.trackInfo.index = [];
            obj.trackInfo.name = '';
                       
        end
        
        function removedToken = removeAToken(obj,transition)
            %removeAToken Summary: of this method goes here
            %   Removes the first token in the tokens array
            removedToken = obj.tokens(1);
            removedToken.removed(transition);
            obj.tokens(1) = [];
        end
        
        function outputArg = addAToken(obj,newToken)
            %addAToken Summary: of this method goes here
            %   Adds the newToken to the end of tokens array
            newToken.added(obj);
            obj.tokens = [obj.tokens, newToken];          
        end
        
        function outputArg = draw(obj)
            placeRadius = obj.radius;
            viscircles(obj.location, placeRadius, 'Color','b');
%             text(obj.centroid(1),obj.centroid(2),obj.name,'Color','b','FontSize',10);
        end
        
        
        function outputArg = drawTokens(obj,timeValue)
            numOfTokens = length(obj.tokens);
            
            deltaTheta = 2*pi/numOfTokens;    % angular separation
            tokenRadius = obj.radius/2; %4     % each token has a fixed radius
            if numOfTokens>1
                ringRadius = obj.radius/2;       % token ring's radius            
            else
                ringRadius = 0;
            end
            
            % deleting graphic Handles
            if timeValue~=0 && ~isempty(obj.graphicHandles)
                for i = 1:1:length(obj.graphicHandles)
                    delete(obj.graphicHandles(1));
                    obj.graphicHandles(1) = [];
                end
            end
            
            
            for i = 1:1:numOfTokens
                theta = i*deltaTheta;
                center =  obj.location + ringRadius*[cos(theta), sin(theta)];
                r = viscircles(center, tokenRadius, 'Color','r','LineWidth',2);%1
                obj.graphicHandles(i) = r;
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

