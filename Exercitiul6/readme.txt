In aceasta sectiune ne vom ocupa de partea de retelistica. Iata cateva exercitii pe care te invit sa le faci si pe care iti sugerez sa le rezolvi conectat prin SSH la masina ta Linux (fie ea virtuala sau nu):

1. Inspectati configurarile de retea curente de pe masina fizica. Afisati informatiile:

de nivel 2 – legatura de date (adresa MAC)
de nivel 3 – retea (adresa IP, masca de retea si gateway-ul implicit)
de nivel 7 – aplicatii (server DNS).
Pentru a schimba configurarile de retea, trebuie sa fim root. Pentru a le inspecta, in general, nu este nevoie.

	MAC - ip link show sau din ifconfig - ether 08:00......

Folositi ifconfig pentru a afla adresa MAC, adresa IP, si masca de retea. Ce interfata este cea relevanta?

	ifconfig:
	
	enp0s3:	ip: 10.32.1.57
		mask: 255.255.255.0
		gateway: 10.32.1.1
		DNS server - in /etc/resolve.conf 127.0.0.53		

2. Realizati un script care sa verifice daca exista conexiune la internet si sa afiseze mesaje corespunzatoare.

	#!/bin/bash
	#Check connectivity to google.com

	SITE="www.google.com"
	ping -c 3 $SITE > /dev/null

	if [[ $? != 0 ]]
		then
			echo "The internet seems to be down."
			echo "Today is `date`"
		else
			echo "The internet is up "
	fi	

3. Aflati adresa serverului wikipedia.org.

	dig or nslookup wikipedia.org - 127.0.0.53

4. Inspectati configuratia interfetei eth0. Este interfata activa? Configurati interfata eth0:

adresa 192.168.102.80
netmask 255.255.255.0
gateway 192.168.102.2

	pe local nu a mers internetul dupa schimbari (10.32...) ca server schimbare in fisierul /etc/resolv.conf

Folositi 8.8.8.8 ca nameserver. Atentie: nu folositi acelasi fisier in care ati configurat adresa IP si gateway-ul.

5. Porniti interfata eth0 folosind ifup. Cu ce difera ifup de ifconfig?

	ifup si ifdown -av - inchide si porneste utilitatile de network
	nu recunoaste interfata enp0s3
	verificat cu ping goolgle.com si chiar functioneaza

6. Aflati ip-ul serverului google.com folosind comanda ping. Stergeti apoi orice configurare din fisierul /etc/resolv.conf si incercati sa dati din nou comanda:

	daca sterg serverul nu ma pot conecta la server prin nume, doar prin ip

ping www.google.com

Ce observati?

Folositi ip-ul aflat mai devreme ca parametru pentru comanda ping.

7. Conectati-va la masina virtuala prin ssh si creati fisierul ‘my_file’ care sa contina adresa MAC a placii de retea.

	ipconfig | grep ether | awk '{print$2}' > my_file.txt

8. Configurati ssh astfel incat sa permita conectarea la masina virtuala, fara introducerea parolei. (Hint: ssh-keygen, ssh-copy-id)

	nu am putut deschide portul 22 pe windows (inbound, start service etc.) - scanat cu nmap de pe ubuntu

9. Transferati, folosind scp, fisierul ‘my_file’, creat la exercitiul 1, pe calculatorul vostru.

	scp -r dj@10.32.1.57:home/....../my_file.txt C:\Users\dominiq.jakab\Desktop
