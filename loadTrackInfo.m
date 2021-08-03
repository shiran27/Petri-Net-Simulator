function [places,transitions,arcs] = loadTrackInfo(places,transitions,arcs,testCase)

    if isequal(testCase,'AGV') 

        % place indices
        track1 = [7,8,13,14,57,58];
        track2 = [5,6,15,16,53,54,59,60,61,62,31,33,35,38];
        track3 = [43,44,55,56,32,34];
        track4 = [45,46,51,52,63,64,36,37,39,42];
        track5 = [47,48,49,50,9,10,40,41];
        track1R = [7,14,57];
        track1L = [8,13,58];
        track2R = [5,16,53,59,61,31,35];
        track2L = [6,15,54,60,62,33,38];
        track3R = [44,55,32];
        track3L = [43,56,34];
        track4R = [46,51,63,36,39];
        track4L = [45,52,64,37,42];
        track5R = [48,49,10,40];
        track5L = [47,50,9,41];


        for i = 1:1:length(places)
            if sum(places(i).index == track1)>0
                if sum(places(i).index == track1R)>0
                    places(i).trackInfo.index = 1;
                    places(i).trackInfo.name = 'Track 1: Forward';
                else
                    places(i).trackInfo.index = 2;
                    places(i).trackInfo.name = 'Track 1: Reverse';
                end
            elseif sum(places(i).index == track2)>0
                if sum(places(i).index == track2R)>0
                    places(i).trackInfo.index = 3;
                    places(i).trackInfo.name = 'Track 2: Forward';
                else
                    places(i).trackInfo.index = 4;
                    places(i).trackInfo.name = 'Track 2: Reverse';
                end
            elseif sum(places(i).index == track3)>0
                if sum(places(i).index == track3R)>0
                    places(i).trackInfo.index = 5;
                    places(i).trackInfo.name = 'Track 3: Forward';
                else
                    places(i).trackInfo.index = 6;
                    places(i).trackInfo.name = 'Track 3: Reverse';
                end
            elseif sum(places(i).index == track4)>0
                if sum(places(i).index == track4R)>0
                    places(i).trackInfo.index = 7;
                    places(i).trackInfo.name = 'Track 4: Forward';
                else
                    places(i).trackInfo.index = 8;
                    places(i).trackInfo.name = 'Track 4: Reverse';
                end
            elseif sum(places(i).index == track5)>0
                if sum(places(i).index == track5R)>0
                    places(i).trackInfo.index = 9;
                    places(i).trackInfo.name = 'Track 5: Forward';
                else
                    places(i).trackInfo.index = 10;
                    places(i).trackInfo.name = 'Track 5: Reverse';
                end
            end

        end



        % transition indices
        track1 = [6,7,8,18,40,41];
        track2 = [3,4,5,22,36,37,42,43,44,45,46,47,48,49];
        track3 = [13,19,26,27,38,39];
        track4 = [17,23,28,29,50,51,52,53,34,35];
        track5 = [9,10,11,14,19,30,31,32,33];
        track1R = [6,18,40];
        track1L = [7,8,41];
        track2R = [4,22,36,42,43,46,47];
        track2L = [3,5,37,44,45,48,49];
        track3R = [19,27,38];
        track3L = [13,26,39];
        track4R = [23,29,50,51,34];
        track4L = [17,28,52,53,35];
        track5R = [10,11,31,32];
        track5L = [9,14,19,30,33];

        for i = 1:1:length(transitions)
            if sum(transitions(i).index == track1)>0
                if sum(transitions(i).index == track1R)>0
                    transitions(i).trackInfo.index = 1;
                    transitions(i).trackInfo.name = 'Track 1: Forward';
                else
                    transitions(i).trackInfo.index = 2;
                    transitions(i).trackInfo.name = 'Track 1: Reverse';
                end
            elseif sum(transitions(i).index == track2)>0
                if sum(transitions(i).index == track2R)>0
                    transitions(i).trackInfo.index = 3;
                    transitions(i).trackInfo.name = 'Track 2: Forward';
                else
                    transitions(i).trackInfo.index = 4;
                    transitions(i).trackInfo.name = 'Track 2: Reverse';
                end
            elseif sum(transitions(i).index == track3)>0
                if sum(transitions(i).index == track3R)>0
                    transitions(i).trackInfo.index = 5;
                    transitions(i).trackInfo.name = 'Track 3: Forward';
                else
                    transitions(i).trackInfo.index = 6;
                    transitions(i).trackInfo.name = 'Track 3: Reverse';
                end
            elseif sum(transitions(i).index == track4)>0
                if sum(transitions(i).index == track4R)>0
                    transitions(i).trackInfo.index = 7;
                    transitions(i).trackInfo.name = 'Track 4: Forward';
                else
                    transitions(i).trackInfo.index = 8;
                    transitions(i).trackInfo.name = 'Track 4: Reverse';
                end
            elseif sum(transitions(i).index == track5)>0
                if sum(transitions(i).index == track5R)>0
                    transitions(i).trackInfo.index = 9;
                    transitions(i).trackInfo.name = 'Track 5: Forward';
                else
                    transitions(i).trackInfo.index = 10;
                    transitions(i).trackInfo.name = 'Track 5: Reverse';
                end
            end

        end
        
        
        
        
    elseif isequal(testCase,'CnM')
        % place indices
        track1 = [1,2,3,4,5];
        track2 = [6,7,8,9,10];
        
        for i = 1:1:length(places)
            if sum(places(i).index == track1)>0
                places(i).trackInfo.index = 1;
                places(i).trackInfo.name = "Cat's Track";
            elseif sum(places(i).index == track2)>0
%                 places(i).trackInfo.index = 2;
%                 places(i).trackInfo.name = "Mouse's Track";
            end
        end
        
        % transition indices
        track1 = [1,2,3,4,5,6,7,8];
        track2 = [9,10,11,12,13,14];
        

        for i = 1:1:length(transitions)
            if sum(transitions(i).index == track1)>0
                transitions(i).trackInfo.index = 1;
                transitions(i).trackInfo.name = "Cat's Track";
            elseif sum(transitions(i).index == track2)>0
%                 transitions(i).trackInfo.index = 2;
%                 transitions(i).trackInfo.name = "Mouse's Track";
            end
        end
    
    end
    
    
    
    for i = 1:1:length(arcs)
        indexes = arcs(i).edges;
        if arcs(i).isFromAPlace
            if places(indexes(1)).trackInfo.index == transitions(indexes(2)).trackInfo.index
                arcs(i).trackInfo = places(indexes(1)).trackInfo;
            elseif ~isempty(places(indexes(1)).trackInfo.index) && ~isempty(transitions(indexes(2)).trackInfo.index)
                arcs(i).trackInfo = places(indexes(1)).trackInfo;
            end
        else
            if places(indexes(2)).trackInfo.index == transitions(indexes(1)).trackInfo.index
                arcs(i).trackInfo = transitions(indexes(1)).trackInfo;
            elseif ~isempty(places(indexes(2)).trackInfo.index) && ~isempty(transitions(indexes(1)).trackInfo.index)
                arcs(i).trackInfo = transitions(indexes(1)).trackInfo;    
            end
        end
    end
    



                  
end

