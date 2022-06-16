library(XLHDataPrediction)
# USER INPUTS
#=======================
# The folder where the study intermediate and result files will be written:
outputFolder <- "./XLHDataPredictionResults"

# Specify where the temporary files (used by the ff package) will be created:
options(fftempdir = "location with space to save big data")

# Details for connecting to the server:
dbms <- "redshift"
user <- 'master'
pw <- 'ClinakosDev#123'
server <- 'ohdsiclinakosdev-databasesstack-c-redshiftcluster-1ccqrj3nx2vlb.cfb0kz4jz4fu.us-west-2.redshift.amazonaws.com/mycdm'
port <- '5439'

connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = dbms,
                                                                server = server,
                                                                user = user,
                                                                password = pw,
                                                                port = port)

# Add the database containing the OMOP CDM data
cdmDatabaseSchema <- 'synthea1k'
# Add a sharebale name for the database containing the OMOP CDM data
cdmDatabaseName <- 'synthea1k'
# Add a database with read/write access as this is where the cohorts will be generated
cohortDatabaseSchema <- 'synthea1k'

oracleTempSchema <- NULL

# table name where the cohorts will be generated
cohortTable <- 'XLHDataPredictionCohort'
#=======================

execute(connectionDetails = connectionDetails,
        cdmDatabaseSchema = cdmDatabaseSchema,
        cdmDatabaseName = cdmDatabaseName,
        cohortDatabaseSchema = cohortDatabaseSchema,
        cohortTable = cohortTable,
        outputFolder = outputFolder,
        createProtocol = F,
        createCohorts = F,
        runAnalyses = F,
        createResultsDoc = F,
        packageResults = F,
        createValidationPackage = F, 
        minCellCount= 5,
        createShiny = F,
        createJournalDocument = F,
        analysisIdDocument = 1)

# if you ran execute with: createShiny = T
# Uncomment and run the next line to see the shiny app:
# viewShiny()
