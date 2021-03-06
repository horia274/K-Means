function [centroids] = clustering_pc(points, NC)
  [n d] = size(points);
  numbers = zeros(NC, 1);
  clusters = zeros(NC, d);
  % clusters(i) - suma pe coordonate la punctele
  % points(j) cu j % NC = i
  % numbers(i) - numarul de puncte din clusters(i)
  for i = 1:n
    if mod(i, NC) != 0
      rest = mod(i, NC);
    else
      rest = NC;
    endif
    clusters(rest, 1:d) += points(i, 1:d);
    numbers(rest)++;
  endfor
  % construiesc centroizii
  for i = 1:NC
    if numbers(i) != 0
      centroids(i, 1:d) = clusters(i, 1:d) / numbers(i);
    endif
  endfor
  % ok devine 1 cand centroizii nu se mai modifica
  ok = 0;
  while ok == 0
    clusters = zeros(NC, d);
    numbers = zeros(NC, 1);
    % construiesc noua matrice clusters si noul numbers
    for i = 1:n
      Min = norm(points(i, 1:d) - centroids(1, 1:d));
      index = 1;
      for j = 2:NC
        if Min > norm(points(i, 1:d) - centroids(j, 1:d))
          Min = norm(points(i, 1:d) - centroids(j, 1:d));
          index = j;
        endif
      endfor
      clusters(index, 1:d) += points(i, 1:d);
      numbers(index)++;
    endfor
    % noii centroizi
    for i = 1:NC
      if numbers(i) != 0
        new_centroids(i, 1:d) = clusters(i, 1:d) / numbers(i);
      endif
    endfor
    % verific daca centroizii s-au modificat
    if abs(centroids - new_centroids) < eps
      % daca nu, opresc programul
      ok = 1;
    endif
    % daca da, actualizez si continui
    centroids = new_centroids;
  endwhile
endfunction
