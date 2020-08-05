library(googleComputeEngineR)

# Setup -------------------------------------------------------------------
gce_tag_container("shiny-gce-test", project = "shiny-deploy")

# build docker image
#docker_build(localhost, 'Dockerfile', 'shiny-test') # replace with build trigger on GCE

## make new Shiny template VM for your self-contained Shiny app
vm <- gce_vm("shiny-volcano", # testing using old shiny app I built
             template = "shiny",
             predefined_type = "n1-standard-2",
             dynamic_image = gce_tag_container("shiny-gce-test", project = "shiny-deploy"))