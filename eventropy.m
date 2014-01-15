function H = eventropy(source)

	H = sum(source(source~=0).*log(source(source~=0)));

end