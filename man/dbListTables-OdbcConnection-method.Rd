% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Connection.R
\name{dbListTables,OdbcConnection-method}
\alias{dbListTables,OdbcConnection-method}
\alias{dbListTables}
\title{List remote tables}
\usage{
\S4method{dbListTables}{OdbcConnection}(
  conn,
  catalog_name = NULL,
  schema_name = NULL,
  table_name = NULL,
  table_type = NULL,
  ...
)
}
\arguments{
\item{conn}{A \linkS4class{DBIConnection} object, as returned by
\code{\link[DBI:dbConnect]{dbConnect()}}.}

\item{catalog_name}{The name of the catalog to return, the default returns all catalogs.}

\item{schema_name}{The name of the schema to return, the default returns all schemas.}

\item{table_name}{The name of the table to return, the default returns all tables.}

\item{table_type}{The type of the table to return, the default returns all table types.}

\item{...}{Other parameters passed on to methods.}
}
\value{
\code{dbListTables()}
returns a character vector
that enumerates all tables
and views
in the database.
Tables added with \code{\link[DBI:dbWriteTable]{dbWriteTable()}}
are part of the list.
As soon a table is removed from the database,
it is also removed from the list of database tables.

The same applies to temporary tables if supported by the database.

The returned names are suitable for quoting with \code{dbQuoteIdentifier()}.
An error is raised when calling this method for a closed
or invalid connection.
}
\description{
Returns the unquoted names of remote tables accessible through this
connection.
This should include views and temporary objects, but not all database backends
(in particular \pkg{RMariaDB} and \pkg{RMySQL}) support this.

\Sexpr[results=rd,stage=render]{DBI:::methods_as_rd("dbListTables")}
}
\details{
\code{\%} can be used as a wildcard in any of the search parameters to
match 0 or more characters. \verb{_} can be used to match any single character.
}
\examples{
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbListTables(con)
dbWriteTable(con, "mtcars", mtcars)
dbListTables(con)

dbDisconnect(con)
}
\seealso{
The ODBC documentation on \href{https://docs.microsoft.com/en-us/sql/odbc/reference/develop-app/pattern-value-arguments}{Pattern Value Arguments}
for further details on the supported syntax.
}
