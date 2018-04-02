function class_conflicts_matrix = possible_conflict(ProfAvail)
%%%%Determines which classes could be conflicts in students' schedules
class_offerings_matrix = ["Math 109",1,9,5;"Math 246",1,9,10; "Math 246",2,10,1;"Econ 104",1,9,20;]; 
%class, section, time, seats

class_conflicts_matrix = string(zeros(size(class_offerings_matrix))); %stores which classes could be conflicts

for ii = 1:size(class_offerings_matrix,1)
    %Weeds out classes at times the prof isn't available at and ones with
    %=<5 seats
    if and(ismember(double(class_offerings_matrix(ii,3)),ProfAvail)== 1,double(class_offerings_matrix(ii,4))>5)
        class_conflicts_matrix(ii,:)=class_offerings_matrix(ii,:);
    end %AND if statement
end %class weed out for loop

for kk = size(class_conflicts_matrix,1):-1:1
    %deletes unnecessary rows in class_conflict_matrix
    if class_conflicts_matrix(kk,1)=="0"
        class_conflicts_matrix(kk,:)=[];
    end %if statement
end %deleting of rows

end %function