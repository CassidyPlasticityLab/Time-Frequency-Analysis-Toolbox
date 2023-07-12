%whole Brain -> leftbrain -> right Brain
%  cd /Volumes/CassidyLab/EMBARK/EEG/Process/

fields = fieldnames(wholeBrainAverageCoh);
for i = 1:length(fields)
    A(i, 1:8) = wholeBrainAverageCoh.(fields{i})(2, 1:end);
    A(i, 9:16) = leftBrainAverageCoh.(fields{i})(2, 1:end);
    A(i, 17:24) = rightBrainAverageCoh.(fields{i})(2, 1:end);
end

temp1 = A(1, 1:end);
temp2 = A(2, 1:end);
temp3 = A(3, 1:end);
temp4 = A(4, 1:end);
temp5 = A(5, 1:end);
temp6 = A(6, 1:end);
temp7 = A(7, 1:end);

globalCoh2lines = horzcat(temp1, temp2, temp2, temp4, temp5, temp6, temp7);

save(fd.SUBJ_ID);