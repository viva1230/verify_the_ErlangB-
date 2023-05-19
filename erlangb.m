function B = erlangb(N, A)
% ERLANGB Erlang-B blocking probability of a telecommunications systems
% with N servers (channels) and a traffic intensity A
% A is lambda * d.
% lambda is average call arrival rate (call/s).
% d is average call duration (s/call). 
% elements of A must be real and positive
if (length(N)~=1) || (fix(N) ~= N) || (N < 0)
  error('N must be a scalar positive integer'); 
end
% TODO: test that elements of A are real and positive here?
esum = zeros(size(A));
for ii=0:N
	esum = esum + A .^ ii ./ factorial(ii);
end
B = A .^ N ./ (factorial(N) .* esum);