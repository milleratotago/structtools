function outStruc = mergestructsdup(S, T)
%MERGESTRUCTSDUP Combines fields of both input structures into a single structure
%   including fields that are duplicated in the two structures.
%   Output structure will contain all fields and their corresponding values of
%   the two input structures. If a field is present in both input structures,
%   both values are in the output structure with fields renamed to match
%   the input structure names.
%
%   Example:
%   S.one = 1;
%   S.other = 47;
%   T.two = 2;
%   T.other = 48;
%   mergestructsdup(S,T)
%
%   ans = 
%   struct with fields:
%     one: 1
%     S_other: 47
%     two: 2
%     T_other: 48
%
%   Inputs:
%   S       first structure to merge
%   T       second structure to merge
%
%   Output:
%   outStruc     combination structure
    sPrefix = [inputname(1) '_'];
    tPrefix = [inputname(2) '_'];
    sorigFieldnames = fieldnames(S);
    torigFieldnames = fieldnames(T);
    snewFieldnames = sorigFieldnames;
    tnewFieldnames = torigFieldnames;
    for iField=1:numel(sorigFieldnames)
        [match, tpos] = ismember(sorigFieldnames{iField},torigFieldnames);
        if match
            snewFieldnames{iField} = [sPrefix snewFieldnames{iField}];
            tnewFieldnames{tpos} = [tPrefix tnewFieldnames{tpos}];
        end
    end
    for iField=1:numel(sorigFieldnames)
        outStruc.(snewFieldnames{iField}) = S.(sorigFieldnames{iField});
    end
    for iField=1:numel(torigFieldnames)
        outStruc.(tnewFieldnames{iField}) = T.(torigFieldnames{iField});
    end
end

