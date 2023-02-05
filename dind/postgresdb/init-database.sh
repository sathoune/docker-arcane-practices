set -e

psql -U $POSTGRES_USER -tc "SELECT 1 FROM pg_database WHERE datname = 'hello_phoenix'" \
 | grep -q 1 || psql -U $POSTGRES_USER -c "CREATE DATABASE hello_phoenix"

psql -U $POSTGRES_USER -tc "SELECT 1 FROM pg_database WHERE datname = 'postgres'" \
 | grep -q 1 || psql -U $POSTGRES_USER -c "CREATE DATABASE postgres"