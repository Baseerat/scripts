#!/usr/bin/tcc -run

#include <stdlib.h>

main() {
	double loadavg[3];
	int rval;

	rval = getloadavg(loadavg, 3);

	if(rval == 3) {
		printf("%i, %.2f, %.2f, %.2f\n", rval, loadavg[0], loadavg[1], loadavg[2]);
	}
} 

