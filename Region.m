classdef Region
    %REGION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        index
        
        name
        poly
        faceColor
        lineWidth
        edgeColor
        
        centroid
        fontSize
        fontColor
        
    end
    
    methods
        function obj = Region(index,name,isRect,coordinates,faceColor,lineWidth,edgeColor,centroid,fontSize,fontColor)
            %REGION Construct an instance of this class
            %   Detailed explanation goes here
            obj.index = index;
            obj.name = name;
            if isRect
                obj.poly = obj.rectToPoly(coordinates);
            else
                obj.poly = polyshape(coordinates(1,:),coordinates(2,:));
            end
            obj.faceColor = faceColor;
            obj.lineWidth = lineWidth;
            obj.edgeColor = edgeColor;
            obj.centroid = centroid;
            obj.fontSize = fontSize;
            obj.fontColor = fontColor;
        end
        
        function poly = rectToPoly(obj,rectCoordinates)
            % rectCoordinates = [x0,y0,width,height]
            % polyCoordinates = [x0,x1,x2,x3;y0,y1,y2,y3]
            x0 = rectCoordinates(1);
            y0 = rectCoordinates(2);
            w = rectCoordinates(3);
            h = rectCoordinates(4);
            x1 = x0 + w;
            x2 = x1;
            x3 = x0;
            y1 = y0;
            y2 = y0 + h;
            y3 = y2;
            poly = polyshape([x0,x1,x2,x3],[y0,y1,y2,y3]);
          
        end
        
        function outputArg = draw(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            plot(obj.poly,'FaceColor',obj.faceColor,'EdgeColor',obj.edgeColor,'LineWidth',obj.lineWidth)
            text(obj.centroid(1),obj.centroid(2),obj.name,'Color',obj.fontColor,'FontSize',obj.fontSize);
        end
    end
end

