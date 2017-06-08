function detection_plot(detection, eventVec, peakMatrix, P)
    Freq=[];
    Start=[];
    Stop=[];
    Fs = 16000;
    
    for j = 1:size(detection, 3)
        for i = 1:size(detection, 2)
            Freq=[Freq; detection(:,i,j).freqdiff]
            Start =[Start; detection(:,i,j).startdiff]
            Stop =[Stop; detection(:,i,j).stopdiff]
            %StartSample(:,i,j) = find(eventVec(:,i,j) == 0.1);
            %StopSample(:,i,j) = find(eventVec(:,i,j) == -0.1);
        end
    end
    
    PM=[];
    
     for j = 1:size(detection, 3)
        for i = 1:size(detection, 2)
            figure
            subplot(211)
            tas = (1:size(P(:, i, j)))./Fs;     
            hold on;
            plot(tas,P(:,i,j));
            tas2 = (1:length(eventVec(:,i,j)))./Fs;     
            eventVec(eventVec(:,i,j)==0 ,i ,j) = nan;
            plot(tas2,eventVec(:,i,j),'x') 
            PM = cell2mat(peakMatrix(1,i,j));
            subplot(212)
            TS = (1:size(PM, 1)) ./ Fs;
            plot(TS, PM(1:end,:,1));   
        end
     end
end