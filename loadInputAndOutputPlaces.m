function transitionsArray = loadInputAndOutputPlaces(transitions, arcs)
% This function loads the input and output places info into the transitions
% given the arcs and places information
    
    for i = 1:1:length(transitions)
        transition = transitions(i);
        % finding the arcs that are going from and towards this transition
        for j = 1:1:length(arcs)
            arc = arcs(j);
            isFromAPlace = arc.isFromAPlace;   % 1 if arc goeas from a place to a transition
            edgeIndexes = arc.edges;           % start and end index
            if isFromAPlace 
                if edgeIndexes(2) == transition.index
                    % then the corresponding place is an input place
                    transition.inputPlaces = [transition.inputPlaces, edgeIndexes(1)];
                end
            else
                if edgeIndexes(1) == transition.index
                    % then the corresponding place is an output place
                    transition.outputPlaces = [transition.outputPlaces, edgeIndexes(2)]; 
                end
            end
        end
        transitionsArray(i) = transition;
    end
       
end

