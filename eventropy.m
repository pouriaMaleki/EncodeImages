function H = eventropy(source)

	H = abs(sum(source(source~=0).*log(source(source~=0))));

end