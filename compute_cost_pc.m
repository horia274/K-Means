function [cost] = compute_cost_pc(points, centroids)
  [n d] = size(points);
  [NC, d] = size(centroids);
  cost = 0;
  % pentru fiecare punct calculez distanta
  % minima pana la un centroid
  for i = 1:n
    Min = norm(points(i, 1:d) - centroids(1, 1:d));
    for j = 2:NC
      if Min > norm(points(i, 1:d) - centroids(j, 1:d))
        Min = norm(points(i, 1:d) - centroids(j, 1:d));
      endif
    endfor
    % adun distanta gasita la cost
    cost += Min;
  endfor
endfunction
