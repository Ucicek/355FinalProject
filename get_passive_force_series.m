function [f_see] = get_passive_force_series(lt)

% Inputs
% lt: normalized length of tendon (series elastic element)

% Output
% f_see: passive force when muscle fibre longer than resting length (due to
% series element)


f_see = zeros(size(lt));
slack_length = 1;  % resting length of tendon

for n = 1:1:length(lt)
    if lt(n) < slack_length
        f_see(n) = 0;
    else
        f_see(n) = 10*(lt(n) - slack_length) + 240*(lt(n) - slack_length)^2;
    end
end

end