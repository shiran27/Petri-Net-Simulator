clear all
close all
clc

rand('seed', 27);


% Loading an example petri net
% [name,places,transitions,arcs,sizeOfSpace,specification,regions] = examplePNSimpleCyclicOpenLoop();
% [name,places,transitions,arcs,sizeOfSpace,specification,regions] = examplePNSimpleCyclicClosedLoop();
% [name,places,transitions,arcs,sizeOfSpace,specification,regions] = examplePNSimpleNonCyclicOpenLoop();
% [name,places,transitions,arcs,sizeOfSpace,specification,regions] = examplePNSimpleNonCyclicClosedLoop();
% [name,places,transitions,arcs,sizeOfSpace,specification,regions] = examplePNCatAndMouseOpenLoop();
% [name,places,transitions,arcs,sizeOfSpace,specification,regions] = examplePNCatAndMouseClosedLoop();
% [name,places,transitions,arcs,sizeOfSpace,specification,regions] = examplePNAGVOpenLoop();
[name,places,transitions,arcs,sizeOfSpace,specification,regions] = examplePNAGVClosedLoop();


% Creating the petri net example
examplePN = PetriNet(1,name,places,transitions,arcs,specification,regions)


% draw the petri net
examplePN.draw(1,sizeOfSpace) % argument is the figure number


% simulate the petri net
timeResolution = 0.01;
timeHorizon = 14;
textHandle1 = text();  textHandle2 = text(); textHandle3 = text(); 
videoMode = true;
frameCount = 1;

for timeValue = 0:timeResolution:timeHorizon
    
    examplePN.update(timeValue);
    
    % display and video
    
    if rem(timeValue,0.05)
        examplePN.drawMarking(1,timeValue);
        
        % printing plot labels
        textLevel = sizeOfSpace(2) + sizeOfSpace(4) + 3; 
        colorVal = examplePN.checkSpec();
        delete(textHandle1); delete(textHandle2); delete(textHandle3);  
        
        % For the AGV petri net examples use the following three lines
        textHandle1 = text(1,textLevel+5,['Time: ',num2str(timeValue,5)],'Color','k','FontSize',textLevel/40);
        textHandle2 = text(1,textLevel+13,examplePN.specification,'Color',colorVal,'FontSize',textLevel/40,'Interpreter','latex');
        textHandle3 = text(205,5,['Parts Produced: ',num2str(examplePN.transitions(12).triggerCount)],'Color','k','FontSize',textLevel/40,'Interpreter','latex');
        
        % For other petri net examples use the following two lines
%         textHandle1 = text(1,textLevel+0.5,['Time: ',num2str(timeValue,5)],'Color','k','FontSize',textLevel/10);
%         textHandle2 = text(1,textLevel+6.5,examplePN.specification,'Color',colorVal,'FontSize',textLevel/10,'Interpreter','latex');
        
        if videoMode
            frameArray(frameCount) = getframe(gcf);
            frameCount = frameCount + 1;
        end
    end
end


run('graphicsOfSimulation.m')  % to compile the video file
