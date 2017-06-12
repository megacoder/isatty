/*
 * vim: ts=8 sw=8
 */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

#include <gcc-compat.h>

int
main(
	int		argc,
	char * *	argv
)
{
	int		fd;
	int		retval;

	fd = 0;
	if( argc > 1 )	{
		fd = atoi( argv[ 1 ] );
	}
	retval = (isatty( fd ) == 0);
#if	0
	fprintf( stderr, "retval = %d\n", retval );
#endif	/* NOPE */
	return( retval );
}
