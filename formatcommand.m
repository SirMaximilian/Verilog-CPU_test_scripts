function f = formatcommand(command)
    f = [command(:,1:8) ' ' command(:,9:16) ' ' command(:,17:24) ' ' command(:,25:32)];
    %f = [command(:,1:8)  command(:,9:16)  command(:,17:24)  command(:,25:32) ','];
end