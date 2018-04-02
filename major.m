function major_info_vector = major(NameOfMajor)

econ = strcmpi(NameOfMajor, 'Econ');
business = strcmpi(NameOfMajor , 'Business');

if econ == 1
    firstSemesterClasses = ["Econ 103" , "Econ 104"];
elseif business == 1
    firstSemesterClasses = ["Econ 103" , "Math 109" , "Math 246"];
end

major_info_vector = firstSemesterClasses;

end