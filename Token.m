classdef Token < handle
    %TOKEN Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        index
        name            % like "cat" "dog"
        
        location        % for graphical purposes
        residingIn      % residing place or transition
        inTransit       % is the token in transit
        
        eventTime      % when the token arrived at the place
    end
    
    methods
        function obj = Token(index,name,place) % Or: Token(transition)
            %TOKEN Construct an instance of this class
            %   Detailed explanation goes here
            if nargin==3
                obj.index = index;
                obj.name = name;
                obj.location = place.location;
                obj.residingIn = place.index;
                obj.inTransit = false;
                obj.eventTime = 0;
            elseif nargin == 2
                transition = index;
                obj.eventTime = name;
                
                obj.index = -1;
                obj.name = 'Synthetic';
                obj.location = transition.location;
                obj.residingIn = transition.index;
                obj.inTransit = true;
            end
        end
        
        function outputArg = removed(obj,transition)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.location = transition.location;
            obj.residingIn = transition.index;
            obj.inTransit = true;
        end
        
        function outputArg = added(obj,place)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.location = place.location;
            obj.residingIn = place.index ;
            obj.inTransit = false;
        end
        
        
        function outputArg = draw(obj)
        
        
        end
        
        
        
    end
end

