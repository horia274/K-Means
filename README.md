# K-Means

## Enunt

Pe scurt, este vorba de implementarea unui algoritm de *clustering*, de tipul **K-Means**. Mai multe
detalii despre enunt se pot gasi [aici](https://acs.curs.pub.ro/2019/pluginfile.php/67380/mod_resource/content/12/Tema%201%20MN%20-%202020.pdf#section.2).
Algoritmul a fost implementat ca o tema de la cursul **Metode numerice**.

## Scop

* utilizarea functionalitatilor limbajului *GNU Octave* ın mod eficient;
* implementarea unui algoritm n-dimensional de clustering;
* descoperirea elementelor de baza ale Invatarii Automate Nesupervizate, **Unsupervised ML**.

## Cerintele programului

Programul implementeaza doua functii:

* function \[centroids\] = clustering_pc(points, NC)
  Aceasta functie primeste ca parametri un vector de puncte *D*-dimensionale (matrice *N*×*D*) *points*
  si numarul de clustere ın care trebuie segmentate punctele *NC* si trebuie sa returneze un vector de
  puncte *centroids* ce reprezinta mediile (centrele de masa) ale clusterelor.
  
* function \[cost\] = compute_cost_pc(points, centroids)
  Aceasta functie primeste ca parametri un vector de puncte *D*-dimensionale (matrice *N*×*D*) *points*
  si un vector de centroizi *centroids* si returneaza costul clustering-ului,  adica suma distantelor
  euclidiene de la fiecare punct din *points* la centroidul clusterului caruia ii apartine.  Acest
  *cost* trebuie sa fie minim.

## Detalii despre implementare

### clustering_pc

Folosesc matricea clusters in care adun pe linia *i*, pe coordonate, punctele care dau restul *i*
la impartirea cu *NC* (pt linia *NC* - punctele care dau restul 0) - initializez clusterele. Vectorul
*numbers* contine pe linia *i*, cate puncte sunt pe linia *i* din clusters. Folosesc aceasta matrice
si acest vector pentru a face media mai usor, obtinand coordonatele centroizilor.

Calculez coordonatele centroizilor initiali si repet procedeul pana cand pozitiile lor nu se mai
modifica. Refac matricea *clusters* si vectorul *numbers*.

Pentru fiecare punct din *points*, calculez distanta minima fata de un centroid si adaug coordonale
lui linia corespunzatoare din *clusters* si cresc valoarea din *numbers* cu 1. Apoi calculez noile
coordonate ale centroizilor si verific diferenta dintre acestea si vechile coordonate. Daca este mare,
continui algoritmul si actualizez centroizii vechi cu cei noi. Daca nu, opresc procedeul.

### compute_cost_pc

Pentru fiecare punct din points, calculez distanta minima pana la un centroid si o adaug la cost.
