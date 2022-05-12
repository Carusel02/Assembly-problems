README IOCLA

student: Marin Marius Daniel
durata: 2-3 zile

mod de implementare:
1) task1
ideea la task1 e extragerea fiecarei litere intr un registru de 8 biti
si encodarea ei efectiva adunand in registru valoarea step data
2) task2
ideea la task2 partea 1 e aflarea dreptei pe care se afla punctele, (verificare
daca coordonatele x sau y sunt egale) si scaderea coordonatelor ramase
ideea la task2 partea 2 e apelarea functiei de la partea 1 si adaugarea intr un
vector de distante, apoi incrementarea adresei acestuia
ideea la task3 partea 3 e luarea unui index si aflarea patratului lui folosind
ori loop ori jump, apoi compararea cu elementul din vectorul de distante
3) task3
ideea la task3 este asemanatoare cu cea de la task1, se iau ambele litere din plain
si key si folosind un algoritm rezultat din matricea tabulara, se adauga litera
rezultata in enc_string. algoritmul poate fi prezentat in felul urmator: daca litera
din plain < key, se scade in cod ascii key - plain si se adauga 65 | daca litera din
plain > key, se scade din 26 diferenta lor si se adauga 65. de asemenea, e nevoie si
de o zona care sa refresh uiasca adresa key ului in caz ca string ul e mai lung decat 
acesta
4) task4
ideea la task4 e generarea indexilor corespunzatori matricei spirala prin folosirea
jmp urilor in 4 zone in care se parcurge matricea in spirala (zona laturii de sus,
apoi laturii din dreapta, apoi laturii de jos, laturii din stanga si apoi repeat).
trebuie implementata si o zona care scade nr de pasi luati in parcurgerea zonelor,
deoarece cu cat spirala inainteaza, cu atat scade in "dimensiune".
apoi se ia din adresa de unde e matricea key cu indexul generat si adaugandu se la
litera plain, se baga totul la adresa unde trebuie encodat stringul.

concluzii: tema a fost una foarte interesanta, mi a placut foarte mult!
