if [ $# -ne 1 ]; then
    echo "usage: ./change_image_name_osx.sh [docker username]"
    exit
fi

IP=$(kubectl get nodes | awk ' /Ready/ { print $1;exit }')
export IP

sed -i .bak s/journeycode/"$1"/ manifests/deploy-schedule.yaml
sed -i .bak s/journeycode/"$1"/ manifests/deploy-session.yaml
sed -i .bak s/journeycode/"$1"/ manifests/deploy-speaker.yaml
sed -i .bak s/journeycode/"$1"/ manifests/deploy-vote.yaml
sed -i .bak s/journeycode/"$1"/ manifests/deploy-webapp.yaml
