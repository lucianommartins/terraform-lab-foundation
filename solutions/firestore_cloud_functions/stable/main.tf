# App Engine:    App Engine + Cloud Database
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: App Engine + Cloud Firestore
module "la_gae_database" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/app_engine/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GAE instance
  gae_location    = "us-central" 
  gae_hasDatabase = true 
  gae_db_type     = "CLOUD_FIRESTORE"
}


# Cloud Firestore: Document 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Cloud Firestore Document
module "la_firestore_document" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Firestore Document
  gfd_collection_id = "mycollection" 
  gfd_document_id   = "mydocument" 
  gfd_document_data = { default= {"field_1"= {"stringValue"="Test"}} } 
}


## #
## ## Cloud Storage 
## #-----------------------------------------------------------------------------
## #
## ### CALL: Cloud Storage Module
## 
## resource "google_storage_bucket" "bucket" {
##   name                        = "${var.gcp_project_id}-${var.gcs_bucket_extension}"
##   location                    = var.gcp_region
##   project                     = var.gcp_project_id
##   force_destroy               = true
##   uniform_bucket_level_access = true
## }
## 
## resource "google_storage_bucket_object" "archive" {
##   name   = "cloudio.zip"
##   bucket = google_storage_bucket.bucket.name
##   source = "./cloudio/cloudio.zip"
## }
## 


## #
## ## IAM Cloud Functions
## #-----------------------------------------------------------------------------
## #
## ## CALL IAM to apply role to member
## 
## # IAM entry for all users to invoke the function
## resource "google_cloudfunctions_function_iam_member" "invoker" {
##   project        = var.gcp_project_id
##   region         = var.gcp_region
##   cloud_function = google_cloudfunctions_function.cloudio_function.name
## 
##   role   = "roles/cloudfunctions.invoker"
##   member = "allUsers"
## }


## # Cloud Functions:   
## # Local:  modules/[channel]
## # Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]
## 
## # Module: Cloud Functions
## module "la_gcf" {
##   source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_function/stable"
## 
##   # Pass values to the module
##   gcp_project_id = var.gcp_project_id
##   gcp_region     = var.gcp_region
##   gcp_zone       = var.gcp_zone
## 
##   # Customise the Cloud Function
##   gcf_name          = "myfunction"
##   gcf_description   = "Test Cloud Function"
##   gcf_runtime       = "nodejs16"
##   gcf_target_bucket = "mybucket"
##   gcf_local_source  = "./cf/function.zip"
##   gcf_entry_point   = "httpHello"
##   
## }
