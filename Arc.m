classdef Arc
    %ARC Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        index
        arcType  % 0 if regular, 1 if controller arc
        location % this may be multiple points
        isFromAPlace  % true if starts from a place
        edges  % start and end (place and transition, or vice versa) indexes
        pathCoordinates
        trackInfo % number, name, direction, a color 
    end
    
    methods
        
        function obj = Arc(index,isFromAPlace,edges,arcType,coordinates)
            %ARC Construct an instance of this class
            %   Detailed explanation goes here
            obj.index = index;
            obj.isFromAPlace = isFromAPlace;
            obj.edges = [edges{1}.index, edges{2}.index]; % taking only indexes
            obj.location = [edges{1}.location(1:2); edges{2}.location(1:2)];
            if nargin==3
                obj.arcType = 0;
                obj.pathCoordinates = [];
            elseif nargin==4
                obj.arcType = arcType;
                obj.pathCoordinates = [];
            else
                obj.arcType = arcType;
                obj.pathCoordinates = coordinates;
            end
        end
        
        function outputArg = draw(obj)
            thickness = 1;
            placeRadius = 4;
                
            if isempty(obj.pathCoordinates)
                X1 = obj.location(1,:);
                X2 = obj.location(2,:);
                u = (X2-X1)./norm(X2-X1);

                if obj.isFromAPlace
                    X1 = X1 + u*placeRadius;
                else
                    X2 = X2 - u*placeRadius;
                end
            else
                %resettiing X1
                X1 = obj.location(1,:);
                X2 = transpose(obj.pathCoordinates(:,1)); 
                u1 = (X2-X1)./norm(X2-X1);
                if obj.isFromAPlace
                    X1 = X1 + u1*placeRadius;
                end
                
                %resetting X2 (as X4)
                X3 = transpose(obj.pathCoordinates(:,end));
                X4 = obj.location(2,:);
                u = (X4-X3)./norm(X4-X3);
                if ~obj.isFromAPlace
                    X4 = X4 - u*placeRadius;
                end
                X2 = X4;
            end

            
            % selecting the color based on arc type
            if obj.arcType==0
                colorValue = 'b';
                lineStyle = '-';
                if ~isempty(obj.trackInfo)
                    colorValue = 'm';
                end
                
            elseif obj.isFromAPlace
                colorValue = [0,0.8,0];
                lineStyle = '--';
            else
                colorValue = [0.8,0,0];
                lineStyle = '--';
            end
            
            
            % drawing the line
            if isempty(obj.pathCoordinates)
                plot([X1(1),X2(1)],[X1(2),X2(2)],lineStyle,'LineWidth',thickness,'Color',colorValue);
            else
                plot([X1(1),obj.pathCoordinates(1,:),X2(1)],[X1(2),obj.pathCoordinates(2,:),X2(2)],lineStyle,'LineWidth',thickness,'Color',colorValue);
            end
            
            
            
            % drawing the arrow head
            arrowThickness = 2; 
            triangle = arrowThickness*[-1.5 -1.5 0; 0.5 -0.5 0];
            theta = atan2(u(2),u(1));
            rotMatrix = [cos(theta), -sin(theta); sin(theta) cos(theta)];
            triangleT = rotMatrix*triangle + X2';
            pgon = polyshape(triangleT(1,:),triangleT(2,:));
            plot(pgon,'FaceColor', colorValue, 'FaceAlpha', 0.5, 'EdgeColor',colorValue,'LineWidth',1);
            
        end
    end
end

