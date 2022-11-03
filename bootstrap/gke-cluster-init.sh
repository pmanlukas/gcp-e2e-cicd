# Creates 3 GKE autopilot clusters
# ACTION REQUIRED! Change "project-id-here" value to the project you'll be using
# Change the network and subnetwork

export PROJECT_ID="dunder-mifflin-363209"
# Test cluster
echo "creating testcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "testcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/dunder-mifflin-infinity" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/dunder-mifflin-infinity" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async 
# Staging cluster
echo "creating stagingcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "stagingcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/dunder-mifflin-infinity" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/dunder-mifflin-infinity" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async 
# Prod cluster
echo "creating prodcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "prodcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/dunder-mifflin-infinity" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/dunder-mifflin-infinity" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async 
echo "Creating clusters! Check the UI for progress"
