function symbols = zigzag_scanner(lin)

	ind = reshape(1:numel(lin), size(lin));

	ind = fliplr(spdiags( fliplr(ind)));

	ind(:,1:2:end) = flipud(ind(:,1:2:end));

	ind(ind==0) = [];

	symbols = lin(ind);

end