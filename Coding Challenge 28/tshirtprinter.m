function result=tshirtprinter(jobs,Npresses)
    massive_list=generate_massive_list(jobs,Npresses);
    time_list=calculate_time(massive_list,Npresses);
    [~,I]=min(time_list);
    result=massive_list{I};
end

function result=calculate_time(list,Npresses)
    result=zeros(length(list),1);
    for i=1:length(list)
        for j=1:Npresses
            result(i)=max(result(i), sum(list{i}{j})); 
        end
    end
end

function result=generate_massive_list(jobs,Npresses)
    choice_list=options_choices_list(Npresses,length(jobs));
    for i=1:length(choice_list)
        for j=1:Npresses
           configlist{j} = [];
        end
        for j=1:length(jobs)
            I=choice_list(i,j);
            configlist{I}=[configlist{I} jobs(j)];
        end
        result{i}=configlist;
    end
end