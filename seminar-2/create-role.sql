CREATE ROLE GLUHX_ROLE NOT IDENTIFIED;
GRANT CONNECT TO GLUHX_ROLE;
GRANT SELECT ON employees TO GLUHX_ROLE;
GRANT CREATE ANY TABLE TO GLUHX_ROLE;
GRANT GLUHX_ROLE TO GLUHX;
