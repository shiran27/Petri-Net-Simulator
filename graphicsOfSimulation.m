
if videoMode
    % create the video writer with 1 fps
    writerObj = VideoWriter(examplePN.name);
    writerObj.FrameRate = 20;
    % set the seconds per image
    % open the video writer
    open(writerObj);
    % write the frames to the video
    for i=1:length(frameArray)
        % convert the image to a frame
        frame = frameArray(i) ;    
        writeVideo(writerObj, frame);
    end
    % close the writer object
    close(writerObj);
end