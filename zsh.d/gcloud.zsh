
# ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
# │                                                 Components                                                 │
# ├───────────────┬──────────────────────────────────────────────────────┬──────────────────────────┬──────────┤
# │     Status    │                         Name                         │            ID            │   Size   │
# ├───────────────┼──────────────────────────────────────────────────────┼──────────────────────────┼──────────┤
# │ Not Installed │ App Engine Go Extensions                             │ app-engine-go            │  4.8 MiB │
# │ Not Installed │ Appctl                                               │ appctl                   │ 18.5 MiB │
# │ Not Installed │ Cloud Bigtable Command Line Tool                     │ cbt                      │  7.6 MiB │
# │ Not Installed │ Cloud Bigtable Emulator                              │ bigtable                 │  6.6 MiB │
# │ Not Installed │ Cloud Datalab Command Line Tool                      │ datalab                  │  < 1 MiB │
# │ Not Installed │ Cloud Datastore Emulator                             │ cloud-datastore-emulator │ 18.4 MiB │
# │ Not Installed │ Cloud Firestore Emulator                             │ cloud-firestore-emulator │ 41.5 MiB │
# │ Not Installed │ Cloud Pub/Sub Emulator                               │ pubsub-emulator          │ 56.4 MiB │
# │ Not Installed │ Cloud SQL Proxy                                      │ cloud_sql_proxy          │  7.4 MiB │
# │ Not Installed │ Emulator Reverse Proxy                               │ emulator-reverse-proxy   │ 14.5 MiB │
# │ Not Installed │ Google Cloud Build Local Builder                     │ cloud-build-local        │  6.2 MiB │
# │ Not Installed │ Google Container Registry's Docker credential helper │ docker-credential-gcr    │  1.8 MiB │
# │ Not Installed │ Kind                                                 │ kind                     │  4.4 MiB │
# │ Not Installed │ Kustomize                                            │ kustomize                │ 22.8 MiB │
# │ Not Installed │ Minikube                                             │ minikube                 │ 22.8 MiB │
# │ Not Installed │ Nomos CLI                                            │ nomos                    │ 17.7 MiB │
# │ Not Installed │ Skaffold                                             │ skaffold                 │ 16.1 MiB │
# │ Not Installed │ anthos-auth                                          │ anthos-auth              │ 16.4 MiB │
# │ Not Installed │ config-connector                                     │ config-connector         │ 42.0 MiB │
# │ Not Installed │ gcloud Alpha Commands                                │ alpha                    │  < 1 MiB │
# │ Not Installed │ gcloud Beta Commands                                 │ beta                     │  < 1 MiB │
# │ Not Installed │ gcloud app Java Extensions                           │ app-engine-java          │ 59.6 MiB │
# │ Not Installed │ gcloud app PHP Extensions                            │ app-engine-php           │ 21.9 MiB │
# │ Not Installed │ gcloud app Python Extensions                         │ app-engine-python        │  6.1 MiB │
# │ Not Installed │ gcloud app Python Extensions (Extra Libraries)       │ app-engine-python-extras │ 27.1 MiB │
# │ Not Installed │ kpt                                                  │ kpt                      │ 12.0 MiB │
# │ Not Installed │ kubectl                                              │ kubectl                  │  < 1 MiB │
# │ Not Installed │ kubectl-oidc                                         │ kubectl-oidc             │ 16.4 MiB │
# │ Not Installed │ pkg                                                  │ pkg                      │          │
# │ Installed     │ BigQuery Command Line Tool                           │ bq                       │  < 1 MiB │
# │ Installed     │ Cloud SDK Core Libraries                             │ core                     │ 15.9 MiB │
# │ Installed     │ Cloud Storage Command Line Tool                      │ gsutil                   │  3.5 MiB │
# └───────────────┴──────────────────────────────────────────────────────┴──────────────────────────┴──────────┘
# To install or remove components at your current SDK version [321.0.0], run:
#   $ gcloud components install COMPONENT_ID
#   $ gcloud components remove COMPONENT_ID

# To update your SDK installation to the latest version [321.0.0], run:
#   $ gcloud components update

if chk::asdf::plugin 'gcloud'
then
  gcloud_version=$(asdf list gcloud | tail -1 | xargs)
  source "$ASDF_DATA_DIR/installs/gcloud/${gcloud_version}/completion.zsh.inc"
  source "$ASDF_DATA_DIR/installs/gcloud/${gcloud_version}/path.zsh.inc"
fi
