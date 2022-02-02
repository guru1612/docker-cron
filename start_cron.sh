echo "creating docker cron"

docker build --rm -t croncontainer .

docker run -itd croncontainer

echo "docker cron is created properly"
