%% conflicting_times Script
% This script returns a list of the class offering information of all the
% courses that are commonly taken with the course to be scheduled.
% The resulting Excel document is titled Conflict_Fall_Offerings.xlsx

%% Initialization of terms

classtimes=ClassSizeforCourseDemand;
% Contains a list of information on course offerings for the upcoming
% semester.

dimclasstimes=size(classtimes);
% Records dimensions of the classtimes array.

time_conflict=strings(dimclasstimes(1),dimclasstimes(2));
% time_conflict will contain only the information on course offerings which
% could be a conflict with the course to be scheduled.

index=1;
% Keeps track of the next open position in time_conflict 
%% Recording potential course conflict information in time_conflict.
% If the course offering is one of the conflicting courses and has
% seats open, the information is recorded in time_conflict.

for ii=1:length(CourseConflictList) %for each conflicting course
    for kk=1:dimclasstimes(1)  %for each offered class in the Fall
        
        if ismember(classtimes(kk,2),CourseConflictList(ii)) %courses match
            
            if  classtimes(kk,22)<classtimes(kk,23) %seats are available
                time_conflict(index,:)=classtimes(kk,:);
                index=index+1; 
            end % seats if statement
            
        end % course matching if statement  
    end % kk for loop
end % ii for loop

%% Removes unnecessary rows in time_conflict

time_conflict=rmmissing(time_conflict);
for jj = size(time_conflict,1):-1:1
    if time_conflict(jj,1)==""
        time_conflict(jj,:)=[];
    end %if statement
end % jj for loop

%% Writing results in an Excel Document.

xlswrite("Conflict_Fall_Offerings.xlsx",time_conflict);
