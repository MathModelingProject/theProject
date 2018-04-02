function class_conflicts_matrix = best_time(ProfAvail)

possible_class_offerings_matrix = ["Econ 103",1,9,30; "Econ 103",2,10,30];
%class, section, time, seats

class_conflicts_matrix = string(zeros(size(possible_class_offerings_matrix)));
conflict = possible_conflict(ProfAvail);

for ii = 1:size(possible_class_offerings_matrix,1)
    if ~(ismember(possible_class_offerings_matrix(ii,3),conflict(ii,3)))
        class_conflicts_matrix(ii,:)=possible_class_offerings_matrix(ii,:);
    end %AND if statement
end %class weed out for loop

for kk = size(class_conflicts_matrix,1):-1:1
    %deletes unnecessary rows in class_conflict_matrix
    if class_conflicts_matrix(kk,1)=="0"
        class_conflicts_matrix(kk,:)=[];
    end %if statement
end %deleting of rows

    
end