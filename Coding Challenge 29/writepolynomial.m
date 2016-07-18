function writepolynomial(coeffs)

fid=fopen('runpolynomial.m','wt');
fprintf(fid,'function result=runpolynomial(x)\n');
fprintf(fid,'result=');
if isempty(coeffs) || isempty(find(coeffs))
    fprintf(fid,'0;\nend');
    return
end

for i=1:length(coeffs)
    if coeffs(i)==0
        continue
    end
    if i~=1 && coeffs(i)>0
        fprintf(fid,'+');
    end
    if coeffs(i)~=1 && i~=length(coeffs)
        fprintf(fid,'%g*',coeffs(i));
    end
    if i==length(coeffs)
        fprintf(fid,'%g',coeffs(i));
    end
    if length(coeffs)-i>1
        fprintf(fid,'x^%g',length(coeffs)-i);
    end
    if length(coeffs)-i==1
        fprintf(fid,'x');
    end
end

fprintf(fid,';\nend');
fclose(fid);
end