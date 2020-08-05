## FROM rocker/shiny
FROM rocker/r-ver:3.6.3
MAINTAINER Mark Edmondson (r@sunholo.com)

# install R package dependencies
RUN apt-get update && apt-get install -y \
    libssl-dev \
    ## clean up
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/ \ 
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
    
## Install packages from CRAN
RUN install2.r --error \ 
    -r 'http://cran.rstudio.com' \
    googleAuthR \
    leaflet \
    sp \
    viridis \
    shinythemes \
    ##### add other CRAN packages
    ## install Github packages
    #### && Rscript -e "devtools::install_github( ## ADD YOUR GITHUB PACKAGES )" \
    ## clean up
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## assume shiny app is in build folder /shiny
COPY ./shiny-volcano/ /srv/shiny-server/shiny-volcano/

#CMD R -e "source('/srv/shiny-server/shiny-volcano/server.R')" \
#    R -e "source('/srv/shiny-server/shiny-volcano/ui.R')" \ 