function show_setup(eventdata, avsdata)

%SHOW_SETUP This is will be used to create top down view of 
%   the arrays and the eventlocations

% it will also show some information in the legends
% should be extended since the extended capabilities of eventgen. 
% also does not show direction of avs. 
   
   legendInfo=[];
    for i = 1:size(eventdata,2)
        plot(complex(eventdata(:,i).location), 'o');
        type = eventdata(:,i).type;
            if strcmp(type, 'cosine')
                legendInfo = [legendInfo; cellstr(['Event ' num2str(i) ', ' type ' ' num2str(eventdata(:,i).freq);])];
            else
                legendInfo = [legendInfo; cellstr(['Event ' num2str(i) ', ' type ])];
            end 
        hold on;
    end
    
    for i = 1:size(avsdata,2)
        for j = 1:size(avsdata,3)     
            plot(complex(avsdata(:,i,j).location), 'x');
            legendInfo = [legendInfo; cellstr(['AVS ' num2str(i) '.' num2str(j)])];
        end
    end
    
    legend(legendInfo)
 end

