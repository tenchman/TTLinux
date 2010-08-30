PKGBINNAME -  sollte der Name des finalen Paketes anders als der Name des
	      Quellpaketes sein, kann mittels dieser Variable der Name gesetzt
	      werden.
	      Bsp.: apps/development/svntrac

PKGSRC     -  sollte sich der Name des Quellpaketes anders sein als der
	      Name welcher sich aus der Kombination von
	      $(NAME)-$(VERSION)-$(FORMAT) ergibt, kann der Name hier explizit
	      gesetzt werden.

STRIPPIT   -  sollen die resultierenden Binaries bzw. Bibliotheken 'gestriped'
	      werden, ist diese Variable auf 'yes' zu setzen.
